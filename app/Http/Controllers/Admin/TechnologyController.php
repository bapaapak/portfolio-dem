<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Technology;
use Illuminate\Http\Request;

class TechnologyController extends Controller
{
    public function index()
    {
        $technologies = Technology::orderBy('order')->orderBy('name')->get();
        return view('admin.technologies.index', compact('technologies'));
    }

    public function create()
    {
        return view('admin.technologies.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'icon' => 'required|string|max:255',
            'order' => 'integer|min:0',
            'is_active' => 'boolean',
            'featured' => 'nullable|boolean',
        ]);

        $validated['is_active'] = $request->has('is_active');
        $validated['featured'] = $request->has('featured');

        Technology::create($validated);

        return redirect()->route('admin.technologies.index')->with('success', 'Technology added successfully!');
    }

    public function edit(Technology $technology)
    {
        return view('admin.technologies.edit', compact('technology'));
    }

    public function update(Request $request, Technology $technology)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'icon' => 'required|string|max:255',
            'order' => 'integer|min:0',
            'is_active' => 'boolean',
            'featured' => 'nullable|boolean',
        ]);

        $validated['is_active'] = $request->has('is_active');
        $validated['featured'] = $request->has('featured');

        $technology->update($validated);

        return redirect()->route('admin.technologies.index')->with('success', 'Technology updated successfully!');
    }

    public function destroy(Technology $technology)
    {
        $technology->delete();
        return redirect()->route('admin.technologies.index')->with('success', 'Technology deleted successfully!');
    }
}
