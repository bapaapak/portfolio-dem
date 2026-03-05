<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\JobDescription;
use Illuminate\Http\Request;

class JobDescriptionController extends Controller
{
    public function index()
    {
        $descriptions = JobDescription::descriptions()->ordered()->get();
        $activities = JobDescription::activities()->ordered()->get();
        
        return view('admin.job_descriptions.index', compact('descriptions', 'activities'));
    }

    public function create()
    {
        return view('admin.job_descriptions.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'type' => 'required|in:description,activity',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
        ]);

        $validated['items'] = array_filter($validated['items'] ?? []);
        $validated['is_active'] = $request->has('is_active');

        JobDescription::create($validated);

        return redirect()->route('admin.job-descriptions.index')
            ->with('success', 'Item berhasil ditambahkan!');
    }

    public function edit(JobDescription $jobDescription)
    {
        return view('admin.job_descriptions.edit', compact('jobDescription'));
    }

    public function update(Request $request, JobDescription $jobDescription)
    {
        $validated = $request->validate([
            'type' => 'required|in:description,activity',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
        ]);

        $validated['items'] = array_filter($validated['items'] ?? []);
        $validated['is_active'] = $request->has('is_active');

        $jobDescription->update($validated);

        return redirect()->route('admin.job-descriptions.index')
            ->with('success', 'Item berhasil diperbarui!');
    }

    public function destroy(JobDescription $jobDescription)
    {
        $jobDescription->delete();

        return redirect()->route('admin.job-descriptions.index')
            ->with('success', 'Item berhasil dihapus!');
    }
}
