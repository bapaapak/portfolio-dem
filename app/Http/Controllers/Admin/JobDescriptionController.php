<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\JobDescription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class JobDescriptionController extends Controller
{
    private ?array $jobDescriptionColumns = null;

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
        $uploadError = $_FILES['illustration_image']['error'] ?? UPLOAD_ERR_OK;
        if ($uploadError === UPLOAD_ERR_INI_SIZE || $uploadError === UPLOAD_ERR_FORM_SIZE) {
            return back()
                ->withInput()
                ->withErrors(['illustration_image' => 'Ukuran file terlalu besar untuk konfigurasi server. Maksimum saat ini sekitar 2MB. Hubungi admin server untuk menaikkan upload_max_filesize/post_max_size minimal 10MB.']);
        }

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

        $validated = $this->normalizePayload($validated, $request);
        if ($request->hasFile('illustration_image')) {
            $validated['illustration_image'] = $request->file('illustration_image')->store('job_descriptions', 'public');
            $file = $request->file('illustration_image');
            $validated['illustration_image_data'] = \App\Helpers\ImageCompressor::compressToBase64($file);
        } else {
            unset($validated['illustration_image']);
        }

        $validated = $this->filterByExistingColumns($validated);

        JobDescription::create($validated);

        return redirect()->route('admin.job-descriptions.index')
            ->with('success', 'Item berhasil ditambahkan!');
    }

    public function show(JobDescription $jobDescription)
    {
        return redirect()->route('admin.job-descriptions.edit', $jobDescription);
    }

    public function edit(JobDescription $jobDescription)
    {
        return view('admin.job_descriptions.edit', compact('jobDescription'));
    }

    public function update(Request $request, JobDescription $jobDescription)
    {
        $uploadError = $_FILES['illustration_image']['error'] ?? UPLOAD_ERR_OK;
        if ($uploadError === UPLOAD_ERR_INI_SIZE || $uploadError === UPLOAD_ERR_FORM_SIZE) {
            return back()
                ->withInput()
                ->withErrors(['illustration_image' => 'Ukuran file terlalu besar untuk konfigurasi server. Maksimum saat ini sekitar 2MB. Hubungi admin server untuk menaikkan upload_max_filesize/post_max_size minimal 10MB.']);
        }

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

        $validated = $this->normalizePayload($validated, $request);
        if ($request->hasFile('illustration_image')) {
            if ($jobDescription->illustration_image) {
                Storage::disk('public')->delete($jobDescription->illustration_image);
            }
            $validated['illustration_image'] = $request->file('illustration_image')->store('job_descriptions', 'public');
            $file = $request->file('illustration_image');
            $validated['illustration_image_data'] = \App\Helpers\ImageCompressor::compressToBase64($file);
        } else {
            unset($validated['illustration_image']);
        }

        $validated = $this->filterByExistingColumns($validated);

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

    private function normalizePayload(array $validated, Request $request): array
    {
        $validated['items'] = array_filter($validated['items'] ?? []);
        $validated['is_active'] = $request->has('is_active');

        if (($validated['type'] ?? null) === 'description') {
            $validated['year'] = null;
            $validated['year_end'] = null;
        }

        if ($request->boolean('until_now')) {
            $validated['year_end'] = null;
        }

        return $validated;
    }

    private function filterByExistingColumns(array $payload): array
    {
        $allowedColumns = [
            'type',
            'year',
            'year_end',
            'title',
            'description',
            'items',
            'illustration_image',
            'illustration_image_data',
            'order',
            'is_active',
        ];

        return array_filter(
            $payload,
            fn ($key) => in_array($key, $allowedColumns, true),
            ARRAY_FILTER_USE_KEY
        );
    }

}
