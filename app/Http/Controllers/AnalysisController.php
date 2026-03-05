<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class AnalysisController extends Controller
{
    /**
     * Plan vs Realization Report
     */
    public function planRealization()
    {
        // Base query for budget items with realized amounts
        $baseQuery = DB::table('budget_items as bi')
            ->join('budget_plans as bp', 'bi.plan_id', '=', 'bp.id')
            ->join('projects as p', 'bp.project_id', '=', 'p.id')
            ->select(
                'bi.*',
                'p.project_name',
                'p.project_code',
                'bp.io_number',
                'bp.cc_code as cc_code',
                DB::raw('(SELECT COALESCE(SUM(qty_req * estimated_price), 0) 
                         FROM purchase_requests pr 
                         WHERE pr.budget_item_id = bi.id AND pr.status != \'Rejected\') as realized_amount')
            )
            ->where('bp.status', 'Approved')
            ->whereNull('bi.parent_item_id');

        // Customer Scope for User/Dept Head
        $user = Auth::user();
        if (in_array($user->role, ['User', 'Dept Head'])) {
            $allowedCodes = $user->customers()->pluck('customer_code')->toArray();
            $allowedNames = $user->customers()->pluck('customer_name')->toArray();

            $baseQuery->where(function ($q) use ($allowedCodes, $allowedNames) {
                // Check Project Customer (Code)
                $q->whereIn('p.customer', $allowedCodes)
                    // Check Budget Plan Customer (Code or Name)
                    ->orWhereIn('bp.customer', $allowedCodes)
                    ->orWhereIn('bp.customer', $allowedNames);
            });
        }

        $baseQuery->orderBy('bi.id', 'desc');

        // Calculate grand totals from ALL items (not just current page)
        $allItems = (clone $baseQuery)->get();
        $grandPlan = $allItems->sum(function ($item) {
            return $item->qty * $item->estimated_price;
        });
        $grandReal = $allItems->sum('realized_amount');
        $grandBalance = $grandPlan - $grandReal;
        $grandUtilization = $grandPlan > 0 ? ($grandReal / $grandPlan) * 100 : 0;

        // Paginate for display
        $items = $baseQuery->paginate(10)->appends(request()->query());

        // Get PRs for each paginated item
        $items->getCollection()->transform(function ($item) {
            $prs = DB::table('purchase_requests')
                ->where('budget_item_id', $item->id)
                ->orderBy('id', 'desc')
                ->get();
            $item->prs = $prs;
            return $item;
        });

        $itemsWithPRs = $items;

        return view('analysis.plan_realization', compact(
            'itemsWithPRs',
            'grandPlan',
            'grandReal',
            'grandBalance',
            'grandUtilization'
        ));
    }

    /**
     * Budget Evaluation - Customer/Project Folder List
     */
    public function budgetEvaluation()
    {
        // Get approved budget plans grouped by customer
        $plans = DB::table('budget_plans as bp')
            ->join('projects as p', 'bp.project_id', '=', 'p.id')
            ->select(
                'bp.id as plan_id',
                'bp.fiscal_year',
                'bp.status',
                'p.project_name',
                'p.project_code',
                'p.category',
                'bp.customer as customer_name',
                'bp.model as model_name',
                DB::raw('(SELECT COALESCE(SUM(bi.qty * bi.estimated_price), 0) FROM budget_items bi WHERE bi.plan_id = bp.id AND bi.parent_item_id IS NULL) as total_budget'),
                DB::raw('(SELECT COALESCE(SUM(
                    (SELECT COALESCE(SUM(pr.qty_req * pr.estimated_price), 0) FROM purchase_requests pr WHERE pr.budget_item_id = bi2.id AND pr.status != \'Rejected\')
                ), 0) FROM budget_items bi2 WHERE bi2.plan_id = bp.id) as total_realized'),
                DB::raw('(SELECT COUNT(*) FROM budget_items bi3 WHERE bi3.plan_id = bp.id) as item_count')
            )
            ->where('bp.status', '!=', 'Rejected')
            ->when(in_array(Auth::user()->role, ['User', 'Dept Head']), function ($q) {
                $user = Auth::user();
                $codes = $user->customers()->pluck('customer_code')->toArray();
                $names = $user->customers()->pluck('customer_name')->toArray();
                $q->where(function ($sub) use ($codes, $names) {
                    $sub->whereIn('p.customer', $codes)
                        ->orWhereIn('bp.customer', $codes)
                        ->orWhereIn('bp.customer', $names);
                });
            })
            ->where(function ($query) {
                $query->where('bp.status', '!=', 'Draft')
                    ->orWhere('bp.created_by', Auth::id());
            })
            ->orderBy('p.customer')
            ->orderBy('p.model')
            ->orderBy('bp.id', 'desc')
            ->get();

        // Group by customer, then by model
        $customerGroups = $plans->groupBy(function ($plan) {
            return $plan->customer_name ?? 'Tanpa Customer';
        })->map(function ($customerPlans) {
            return $customerPlans->groupBy(function ($plan) {
                return $plan->model_name ?? 'Tanpa Model';
            });
        });

        return view('analysis.budget_evaluation_index', compact('customerGroups'));
    }

    /**
     * Budget Evaluation Detail - Single Plan Spreadsheet View
     */
    public function budgetEvaluationDetail($planId)
    {
        // Get the specific plan
        $plan = DB::table('budget_plans as bp')
            ->join('projects as p', 'bp.project_id', '=', 'p.id')
            ->join('users as u', 'bp.created_by', '=', 'u.id')
            ->select(
                'bp.*', // Get bp data for full context
                'bp.id as plan_id',
                'bp.fiscal_year',
                'p.project_name',
                'p.project_code',
                'p.category',
                'u.full_name as creator',
                'bp.customer as customer_name'
            )
            ->where('bp.id', $planId)
            ->where('bp.status', '!=', 'Rejected')
            ->where(function ($query) {
                $query->where('bp.status', '!=', 'Draft')
                    ->orWhere('bp.created_by', Auth::id());
            })
            ->first();

        if (!$plan) {
            return redirect()->route('analysis.budget_evaluation')->with('error', 'Budget Plan tidak ditemukan.');
        }

        // Get items with PR data
        $items = DB::table('budget_items as bi')
            ->leftJoin('master_cost_center as cc', 'bi.cc_id', '=', 'cc.id')
            ->select(
                'bi.*',
                'cc.cc_code',
                DB::raw('(SELECT COALESCE(SUM(qty_req), 0) 
                         FROM purchase_requests pr 
                         WHERE pr.budget_item_id = bi.id AND pr.status != \'Rejected\') as pr_qty'),
                DB::raw('(SELECT COALESCE(SUM(qty_req * estimated_price), 0) 
                         FROM purchase_requests pr 
                         WHERE pr.budget_item_id = bi.id AND pr.status != \'Rejected\') as realized_amount'),
                DB::raw('(SELECT pr.estimated_price 
                         FROM purchase_requests pr 
                         WHERE pr.budget_item_id = bi.id AND pr.status != \'Rejected\' 
                         ORDER BY pr.id DESC LIMIT 1) as pr_price')
            )
            ->where('bi.plan_id', $planId)
            ->orderBy('bi.process')
            ->orderBy('bi.id')
            ->get();

        $categoryMapping = [
            'Machine' => 'A',
            'Machine (standard And Spm)' => 'A',
            'Machine (Standard and SPM)' => 'A',
            'Tooling And Equipment' => 'B',
            'Tooling and Equipment' => 'B',
            'Testing And Equipment' => 'A',
            'Facility Equipment Investment Plan' => 'C',
            'Building & Supporting' => 'D',
        ];

        $plan->itemsByProcess = $items->groupBy(function ($item) use ($categoryMapping) {
            $code = $item->item_code;
            if (!$code && isset($categoryMapping[$item->category])) {
                $code = $categoryMapping[$item->category];
            }
            $codeStr = $code ? $code . '. ' : '';
            $catStr = $item->category ? $item->category . ' - ' : '';
            return $codeStr . $catStr . $item->process;
        });
        $plan->items = $items;

        return view('analysis.budget_evaluation', compact('plan'));
    }

    /**
     * Print Budget Evaluation
     */
    public function printEvaluation($planId)
    {
        // Reuse detail logic but return print view
        $plan = DB::table('budget_plans as bp')
            ->join('projects as p', 'bp.project_id', '=', 'p.id')
            ->join('users as u', 'bp.created_by', '=', 'u.id')
            ->select(
                'bp.id as plan_id',
                'bp.*',
                'bp.fiscal_year',
                'p.project_name',
                'p.project_code',
                'p.category',
                'u.full_name as creator',
                'bp.customer as customer_name'
            )
            ->where('bp.id', $planId)
            ->first();

        $items = DB::table('budget_items as bi')
            ->leftJoin('master_cost_center as cc', 'bi.cc_id', '=', 'cc.id')
            ->select(
                'bi.*',
                'cc.cc_code',
                DB::raw('(SELECT COALESCE(SUM(qty_req), 0) FROM purchase_requests pr WHERE pr.budget_item_id = bi.id AND pr.status != \'Rejected\') as pr_qty'),
                DB::raw('(SELECT COALESCE(SUM(qty_req * estimated_price), 0) FROM purchase_requests pr WHERE pr.budget_item_id = bi.id AND pr.status != \'Rejected\') as realized_amount'),
                DB::raw('(SELECT pr.estimated_price FROM purchase_requests pr WHERE pr.budget_item_id = bi.id AND pr.status != \'Rejected\' ORDER BY pr.id DESC LIMIT 1) as pr_price')
            )
            ->where('bi.plan_id', $planId)
            ->orderBy('bi.process')
            ->orderBy('bi.id')
            ->get();

        $categoryMapping = [
            'Machine' => 'A',
            'Machine (standard And Spm)' => 'A',
            'Machine (Standard and SPM)' => 'A',
            'Tooling And Equipment' => 'B',
            'Tooling and Equipment' => 'B',
            'Testing And Equipment' => 'A',
            'Facility Equipment Investment Plan' => 'C',
            'Building & Supporting' => 'D',
        ];

        $plan->itemsByProcess = $items->groupBy(function ($item) use ($categoryMapping) {
            $code = $item->item_code;
            if (!$code && isset($categoryMapping[$item->category])) {
                $code = $categoryMapping[$item->category];
            }
            $codeStr = $code ? $code . '. ' : '';
            $catStr = $item->category ? $item->category . ' - ' : '';
            return $codeStr . $catStr . $item->process;
        });

        return view('analysis.print_evaluation', compact('plan'));
    }

    /**
     * Save evaluation data
     */
    public function saveEvaluation(Request $request)
    {
        $itemIds = $request->item_id;
        $obstacles = $request->obstacle;
        $reasons = $request->reason;

        if ($itemIds) {
            foreach ($itemIds as $index => $itemId) {
                DB::table('budget_items')
                    ->where('id', $itemId)
                    ->update([
                        'evaluation_obstacle' => $obstacles[$index] ?? null,
                        'evaluation_reason' => $reasons[$index] ?? null
                    ]);
            }
        }

        return back()->with('success', 'Evaluation data saved successfully.');
    }
}
