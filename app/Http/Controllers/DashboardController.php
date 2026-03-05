<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Project;
use App\Models\PurchaseRequest;
use App\Models\BudgetPlan;
use App\Models\BudgetItem;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        $isRestricted = in_array($user->role, ['User', 'Dept Head']);
        $allowedCodes = [];
        $allowedNames = [];

        if ($isRestricted) {
            $allowedCodes = $user->customers()->pluck('customer_code')->toArray();
            $allowedNames = $user->customers()->pluck('customer_name')->toArray();
        }

        // Apply restriction for relations involving budget_plans and projects
        $applyRestriction = function ($query) use ($isRestricted, $allowedCodes, $allowedNames) {
            if ($isRestricted) {
                $query->where(function ($q) use ($allowedCodes, $allowedNames) {
                    $q->whereIn('projects.customer', $allowedCodes)
                        ->orWhereIn('budget_plans.customer', $allowedCodes)
                        ->orWhereIn('budget_plans.customer', $allowedNames);
                });
            }
        };

        // Budget Statistics (only from Approved budget plans)
        $budgetQuery = BudgetItem::join('budget_plans', 'budget_items.plan_id', '=', 'budget_plans.id')
            ->join('projects', 'budget_plans.project_id', '=', 'projects.id')
            ->where('budget_plans.status', 'Approved')
            ->whereNull('budget_items.parent_item_id');

        $applyRestriction($budgetQuery);
        $totalBudget = $budgetQuery->sum(DB::raw('budget_items.qty * budget_items.estimated_price')) ?? 0;

        // Realization = Approved PRs total (only from Approved budget plans)
        $realizationQuery = PurchaseRequest::join('budget_items', 'purchase_requests.budget_item_id', '=', 'budget_items.id')
            ->join('budget_plans', 'budget_items.plan_id', '=', 'budget_plans.id')
            ->join('projects', 'budget_plans.project_id', '=', 'projects.id')
            ->where('budget_plans.status', 'Approved')
            ->where('purchase_requests.status', 'Approved');

        $applyRestriction($realizationQuery);
        $totalRealization = $realizationQuery->sum(DB::raw('purchase_requests.qty_req * purchase_requests.estimated_price')) ?? 0;

        $remainingBalance = $totalBudget - $totalRealization;

        // PR Counts by Status
        $buildPrQuery = function ($status) use ($isRestricted, $allowedCodes, $allowedNames) {
            $q = PurchaseRequest::leftJoin('budget_items', 'purchase_requests.budget_item_id', '=', 'budget_items.id')
                ->leftJoin('budget_plans', 'budget_items.plan_id', '=', 'budget_plans.id')
                ->leftJoin('projects', 'budget_plans.project_id', '=', 'projects.id')
                ->where('purchase_requests.status', $status);

            if ($isRestricted) {
                $q->where(function ($sub) use ($allowedCodes, $allowedNames) {
                    $sub->whereIn('projects.customer', $allowedCodes)
                        ->orWhereIn('budget_plans.customer', $allowedCodes)
                        ->orWhereIn('budget_plans.customer', $allowedNames)
                        ->orWhereNull('budget_plans.id'); // Fallback if no budget linked
                });
            }
            return $q;
        };

        $prApproved = $buildPrQuery('Approved')->distinct('purchase_requests.pr_number')->count('purchase_requests.pr_number');
        $prCompleted = $buildPrQuery('Completed')->distinct('purchase_requests.pr_number')->count('purchase_requests.pr_number');
        $prOnProgress = $buildPrQuery('Submitted')->distinct('purchase_requests.pr_number')->count('purchase_requests.pr_number');

        $prDraft = PurchaseRequest::where('status', 'Draft')
            ->where('requester_id', auth()->id())
            ->distinct('pr_number')
            ->count('pr_number');

        // Top Projects with Budget and Realization (only Approved budget plans)
        $topProjectsQuery = DB::table('projects')
            ->select('projects.id', 'projects.project_name', 'projects.status')
            ->selectRaw('(SELECT status FROM budget_plans WHERE project_id = projects.id AND (status != "Draft" OR created_by = ?) ORDER BY id DESC LIMIT 1) as budget_status', [auth()->id()])
            ->selectRaw('(SELECT COALESCE(SUM(bi.qty * bi.estimated_price), 0) FROM budget_plans bp 
                          JOIN budget_items bi ON bp.id = bi.plan_id 
                          WHERE bp.project_id = projects.id AND bp.status = "Approved" AND bi.parent_item_id IS NULL) as total_budget')
            ->selectRaw('COALESCE((SELECT SUM(pr.qty_req * pr.estimated_price) FROM purchase_requests pr 
                          JOIN budget_items bi2 ON pr.budget_item_id = bi2.id
                          JOIN budget_plans bp2 ON bi2.plan_id = bp2.id
                          WHERE bp2.project_id = projects.id AND bp2.status = "Approved" AND pr.status = "Approved"), 0) as total_realization');

        if ($isRestricted) {
            $topProjectsQuery->where(function ($q) use ($allowedCodes, $allowedNames) {
                $q->whereIn('projects.customer', $allowedCodes)
                    ->orWhereExists(function ($ex) use ($allowedCodes, $allowedNames) {
                        $ex->select(DB::raw(1))
                            ->from('budget_plans')
                            ->whereColumn('budget_plans.project_id', 'projects.id')
                            ->where(function ($sub_ex) use ($allowedCodes, $allowedNames) {
                                $sub_ex->whereIn('budget_plans.customer', $allowedCodes)
                                    ->orWhereIn('budget_plans.customer', $allowedNames);
                            });
                    });
            });
        }

        $topProjects = $topProjectsQuery->having('total_budget', '>', 0)
            ->orderByDesc('total_budget')
            ->limit(3)
            ->get();

        // Budget vs Realization per Project (for chart - only Approved budget plans)
        $chartProjectsQuery = DB::table('projects')
            ->select('projects.project_name')
            ->selectRaw('COALESCE((SELECT SUM(bi.qty * bi.estimated_price) FROM budget_plans bp 
                          JOIN budget_items bi ON bp.id = bi.plan_id 
                          WHERE bp.project_id = projects.id AND bp.status = "Approved" AND bi.parent_item_id IS NULL), 0) as budget')
            ->selectRaw('COALESCE((SELECT SUM(pr.qty_req * pr.estimated_price) FROM purchase_requests pr 
                          JOIN budget_items bi2 ON pr.budget_item_id = bi2.id
                          JOIN budget_plans bp2 ON bi2.plan_id = bp2.id
                          WHERE bp2.project_id = projects.id AND bp2.status = "Approved" AND pr.status = "Approved"), 0) as realized');

        if ($isRestricted) {
            $chartProjectsQuery->where(function ($q) use ($allowedCodes, $allowedNames) {
                $q->whereIn('projects.customer', $allowedCodes)
                    ->orWhereExists(function ($ex) use ($allowedCodes, $allowedNames) {
                        $ex->select(DB::raw(1))
                            ->from('budget_plans')
                            ->whereColumn('budget_plans.project_id', 'projects.id')
                            ->where(function ($sub_ex) use ($allowedCodes, $allowedNames) {
                                $sub_ex->whereIn('budget_plans.customer', $allowedCodes)
                                    ->orWhereIn('budget_plans.customer', $allowedNames);
                            });
                    });
            });
        }

        $chartProjects = $chartProjectsQuery->having('budget', '>', 0)
            ->orderByDesc('budget')
            ->limit(4)
            ->get();

        $chartData = [
            'labels' => $chartProjects->pluck('project_name')->map(function ($name) {
                // Shorten long names
                return strlen($name) > 10 ? substr($name, 0, 10) . '...' : $name;
            })->toArray(),
            'budget' => $chartProjects->pluck('budget')->toArray(),
            'realized' => $chartProjects->pluck('realized')->toArray(),
        ];

        return view('dashboard.index', compact(
            'totalBudget',
            'totalRealization',
            'remainingBalance',
            'prApproved',
            'prCompleted',
            'prDraft',
            'prOnProgress',
            'topProjects',
            'chartData'
        ));
    }

    public function markNotificationsRead(Request $request)
    {
        $user = auth()->user();
        $user->last_notification_read_at = now();
        $user->save();

        return response()->json(['success' => true]);
    }

    public function clearNotifications(Request $request)
    {
        $user = auth()->user();
        $user->last_notification_read_at = now();
        $user->save();

        return response()->json(['success' => true, 'cleared' => true]);
    }
}
