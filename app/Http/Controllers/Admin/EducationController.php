<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Education;
use Illuminate\Http\Request;

class EducationController extends Controller
{
    public function index()
    {
        $educations = Education::orderBy('order')->orderBy('start_date', 'desc')->get();
        return view('admin.education.index', compact('educations'));
    }

    public function create()
    {
        return view('admin.education.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'institution' => 'required|string|max:255',
            'degree' => 'required|string|max:255',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date',
            'location' => 'nullable|string|max:255',
            'gpa' => 'nullable|string|max:50',
            'description' => 'nullable|string',
            'order' => 'integer|min:0',
            'is_current' => 'boolean',
        ]);

        // Clear end_date if currently studying
        if ($request->has('is_current') && $request->is_current) {
            $validated['end_date'] = null;
        }

        Education::create($validated);

        return redirect()->route('admin.education.index')->with('success', 'Education added successfully!');
    }

    public function edit(Education $education)
    {
        return view('admin.education.edit', compact('education'));
    }

    public function update(Request $request, Education $education)
    {
        $validated = $request->validate([
            'institution' => 'required|string|max:255',
            'degree' => 'required|string|max:255',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date',
            'location' => 'nullable|string|max:255',
            'gpa' => 'nullable|string|max:50',
            'description' => 'nullable|string',
            'order' => 'integer|min:0',
            'is_current' => 'boolean',
        ]);

        // Clear end_date if currently studying
        if ($request->has('is_current') && $request->is_current) {
            $validated['end_date'] = null;
        }

        $education->update($validated);

        return redirect()->route('admin.education.index')->with('success', 'Education updated successfully!');
    }

    public function destroy(Education $education)
    {
        $education->delete();
        return redirect()->route('admin.education.index')->with('success', 'Education deleted successfully!');
    }
}
