<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Education;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

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
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        // Clear end_date if currently studying
        if ($request->has('is_current') && $request->is_current) {
            $validated['end_date'] = null;
        }

        if ($request->hasFile('logo')) {
            $validated['logo'] = $request->file('logo')->store('education/logos', 'public');
            $file = $request->file('logo');
            $validated['logo_data'] = \App\Helpers\ImageCompressor::compressToBase64($file);
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
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        // Clear end_date if currently studying
        if ($request->has('is_current') && $request->is_current) {
            $validated['end_date'] = null;
        }

        if ($request->hasFile('logo')) {
            if ($education->logo) {
                Storage::disk('public')->delete($education->logo);
            }
            $validated['logo'] = $request->file('logo')->store('education/logos', 'public');
            $file = $request->file('logo');
            $validated['logo_data'] = \App\Helpers\ImageCompressor::compressToBase64($file);
        }

        if ($request->has('remove_logo') && $request->remove_logo) {
            if ($education->logo) {
                Storage::disk('public')->delete($education->logo);
            }
            $validated['logo'] = null;
            $validated['logo_data'] = null;
        }

        $education->update($validated);

        return redirect()->route('admin.education.index')->with('success', 'Education updated successfully!');
    }

    public function destroy(Education $education)
    {
        if ($education->logo) {
            Storage::disk('public')->delete($education->logo);
        }
        $education->delete();
        return redirect()->route('admin.education.index')->with('success', 'Education deleted successfully!');
    }
}
