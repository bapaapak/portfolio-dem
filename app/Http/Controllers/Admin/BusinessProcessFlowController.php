<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\BusinessProcessFlow;
use Illuminate\Http\Request;

class BusinessProcessFlowController extends Controller
{
    public function index()
    {
        $flows = BusinessProcessFlow::orderBy('step_order', 'asc')->get();
        return view('admin.business_process_flows.index', compact('flows'));
    }

    public function create()
    {
        return view('admin.business_process_flows.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'role' => 'required',
            'action' => 'required',
            'step_order' => 'required|integer',
        ]);

        BusinessProcessFlow::create($request->all());

        return redirect()->route('admin.business-process-flows.index')
            ->with('success', 'Flow step created successfully.');
    }

    public function edit(BusinessProcessFlow $businessProcessFlow)
    {
        return view('admin.business_process_flows.edit', compact('businessProcessFlow'));
    }

    public function update(Request $request, BusinessProcessFlow $businessProcessFlow)
    {
        $request->validate([
            'role' => 'required',
            'action' => 'required',
            'step_order' => 'required|integer',
        ]);

        $businessProcessFlow->update($request->all());

        return redirect()->route('admin.business-process-flows.index')
            ->with('success', 'Flow step updated successfully.');
    }

    public function destroy(BusinessProcessFlow $businessProcessFlow)
    {
        $businessProcessFlow->delete();

        return redirect()->route('admin.business-process-flows.index')
            ->with('success', 'Flow step deleted successfully.');
    }
}
