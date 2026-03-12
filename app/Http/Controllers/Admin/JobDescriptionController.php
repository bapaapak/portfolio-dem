<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\JobDescription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

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
            'year' => 'nullable|integer|min:2000|max:2099',
            'year_end' => 'nullable|integer|min:2000|max:2099',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
            'illustration_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:10240',
        ]);

        $validated['items'] = array_filter($validated['items'] ?? []);
        $validated['is_active'] = $request->has('is_active');
        if ($validated['type'] === 'description') {
            $validated['year'] = null;
            $validated['year_end'] = null;
        }
        if ($request->boolean('until_now')) {
            $validated['year_end'] = null;
        }
        if ($request->hasFile('illustration_image')) {
            $validated['illustration_image'] = $request->file('illustration_image')->store('job_descriptions', 'public');
        } else {
            unset($validated['illustration_image']);
        }

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
            'year' => 'nullable|integer|min:2000|max:2099',
            'year_end' => 'nullable|integer|min:2000|max:2099',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
            'illustration_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:10240',
        ]);

        $validated['items'] = array_filter($validated['items'] ?? []);
        $validated['is_active'] = $request->has('is_active');
        if ($validated['type'] === 'description') {
            $validated['year'] = null;
            $validated['year_end'] = null;
        }
        if ($request->boolean('until_now')) {
            $validated['year_end'] = null;
        }
        if ($request->hasFile('illustration_image')) {
            if ($jobDescription->illustration_image) {
                Storage::disk('public')->delete($jobDescription->illustration_image);
            }
            $validated['illustration_image'] = $request->file('illustration_image')->store('job_descriptions', 'public');
        } else {
            unset($validated['illustration_image']);
        }

        $jobDescription->update($validated);

        return redirect()->route('admin.job-descriptions.index')
            ->with('success', 'Item berhasil diperbarui!');
    }

    public function destroy(JobDescription $jobDescription)
    {
        if ($jobDescription->illustration_image) {
            Storage::disk('public')->delete($jobDescription->illustration_image);
        }
        $jobDescription->delete();

        return redirect()->route('admin.job-descriptions.index')
            ->with('success', 'Item berhasil dihapus!');
    }
}
