<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\JobDescription;
use Illuminate\Http\Request;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Storage;

class JobDescriptionController extends Controller
{
    private ?array $jobDescriptionColumns = null;

    public function index()
    {
        $this->ensureOptionalColumnsExist();

        $descriptions = JobDescription::descriptions()->ordered()->get();
        $activities = JobDescription::activities()->ordered()->get();
        
        return view('admin.job_descriptions.index', compact('descriptions', 'activities'));
    }

    public function create()
    {
        $this->ensureOptionalColumnsExist();

        return view('admin.job_descriptions.create');
    }

    public function store(Request $request)
    {
        $this->ensureOptionalColumnsExist();

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
        } else {
            unset($validated['illustration_image']);
        }

        $validated = $this->filterByExistingColumns($validated);

        JobDescription::create($validated);

        return redirect()->route('admin.job-descriptions.index')
            ->with('success', 'Item berhasil ditambahkan!');
    }

    public function edit(JobDescription $jobDescription)
    {
        $this->ensureOptionalColumnsExist();

        return view('admin.job_descriptions.edit', compact('jobDescription'));
    }

    public function update(Request $request, JobDescription $jobDescription)
    {
        $this->ensureOptionalColumnsExist();

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
        if ($this->jobDescriptionColumns === null) {
            $this->jobDescriptionColumns = Schema::getColumnListing((new JobDescription())->getTable());
        }

        return array_filter(
            $payload,
            fn ($key) => in_array($key, $this->jobDescriptionColumns, true),
            ARRAY_FILTER_USE_KEY
        );
    }

    private function ensureOptionalColumnsExist(): void
    {
        $table = (new JobDescription())->getTable();

        if (!Schema::hasTable($table)) {
            return;
        }

        if (!Schema::hasColumn($table, 'year')) {
            Schema::table($table, function (Blueprint $blueprint) {
                $blueprint->year('year')->nullable()->after('type');
            });
        }

        if (!Schema::hasColumn($table, 'year_end')) {
            Schema::table($table, function (Blueprint $blueprint) {
                $blueprint->smallInteger('year_end')->nullable()->after('year');
            });
        }

        if (!Schema::hasColumn($table, 'illustration_image')) {
            Schema::table($table, function (Blueprint $blueprint) {
                $blueprint->string('illustration_image')->nullable()->after('items');
            });
        }

        $this->jobDescriptionColumns = null;
    }
}
