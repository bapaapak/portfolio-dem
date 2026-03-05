<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AutomationStrategy;
use Illuminate\Http\Request;

class AutomationStrategyController extends Controller
{
    public function index()
    {
        $strategies = AutomationStrategy::orderBy('term_type')
            ->orderBy('category')
            ->orderBy('order')
            ->get()
            ->groupBy('term_type');
        
        return view('admin.automation_strategies.index', compact('strategies'));
    }

    public function create()
    {
        return view('admin.automation_strategies.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'term_type' => 'required|in:short,middle,long',
            'category' => 'required|in:manufacturing,digitalization',
            'title' => 'nullable|string|max:255',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'boolean',
        ]);

        // Filter out empty items
        $validated['items'] = array_filter($validated['items'] ?? [], fn($item) => !empty(trim($item)));
        $validated['is_active'] = $request->has('is_active');
        $validated['order'] = $validated['order'] ?? 0;

        AutomationStrategy::create($validated);

        return redirect()->route('admin.automation-strategies.index')
            ->with('success', 'Strategi berhasil ditambahkan!');
    }

    public function edit(AutomationStrategy $automation_strategy)
    {
        return view('admin.automation_strategies.edit', compact('automation_strategy'));
    }

    public function update(Request $request, AutomationStrategy $automation_strategy)
    {
        $validated = $request->validate([
            'term_type' => 'required|in:short,middle,long',
            'category' => 'required|in:manufacturing,digitalization',
            'title' => 'nullable|string|max:255',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'boolean',
        ]);

        // Filter out empty items
        $validated['items'] = array_filter($validated['items'] ?? [], fn($item) => !empty(trim($item)));
        $validated['is_active'] = $request->has('is_active');
        $validated['order'] = $validated['order'] ?? 0;

        $automation_strategy->update($validated);

        return redirect()->route('admin.automation-strategies.index')
            ->with('success', 'Strategi berhasil diperbarui!');
    }

    public function destroy(AutomationStrategy $automation_strategy)
    {
        $automation_strategy->delete();

        return redirect()->route('admin.automation-strategies.index')
            ->with('success', 'Strategi berhasil dihapus!');
    }
}
