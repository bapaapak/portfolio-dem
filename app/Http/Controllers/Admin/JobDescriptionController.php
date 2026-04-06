<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\JobDescription;
use Illuminate\Http\Request;
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
            $validated['illustration_image'] = $this->storeCompressedIllustration($request->file('illustration_image'));
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
            $validated['illustration_image'] = $this->storeCompressedIllustration($request->file('illustration_image'));
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
        try {
            $table = (new JobDescription())->getTable();
            if (!Schema::hasTable($table)) {
                return;
            }

            // Refresh known columns for safe payload filtering.
            $this->jobDescriptionColumns = Schema::getColumnListing($table);
        } catch (\Throwable $e) {
            // Keep app usable even when schema introspection fails on production.
            $this->jobDescriptionColumns = [
                'id',
                'type',
                'title',
                'description',
                'items',
                'order',
                'is_active',
                'created_at',
                'updated_at',
            ];
        }
    }

    private function storeCompressedIllustration($uploadedFile): string
    {
        $storedFileName = null;

        try {
            $tmpPath = $uploadedFile->getRealPath();
            $imageContents = $tmpPath ? file_get_contents($tmpPath) : false;

            if ($imageContents === false || !function_exists('imagecreatefromstring')) {
                return $uploadedFile->store('job_descriptions', 'public');
            }

            $sourceImage = @imagecreatefromstring($imageContents);
            if (!$sourceImage) {
                return $uploadedFile->store('job_descriptions', 'public');
            }

            $sourceWidth = imagesx($sourceImage);
            $sourceHeight = imagesy($sourceImage);
            $maxDimension = 1600;
            $scale = min(1, $maxDimension / max($sourceWidth, $sourceHeight));
            $targetWidth = (int) max(1, round($sourceWidth * $scale));
            $targetHeight = (int) max(1, round($sourceHeight * $scale));

            $targetImage = imagecreatetruecolor($targetWidth, $targetHeight);

            if (function_exists('imagealphablending') && function_exists('imagesavealpha')) {
                imagealphablending($targetImage, false);
                imagesavealpha($targetImage, true);
                $transparent = imagecolorallocatealpha($targetImage, 0, 0, 0, 127);
                imagefilledrectangle($targetImage, 0, 0, $targetWidth, $targetHeight, $transparent);
            }

            imagecopyresampled(
                $targetImage,
                $sourceImage,
                0,
                0,
                0,
                0,
                $targetWidth,
                $targetHeight,
                $sourceWidth,
                $sourceHeight
            );

            $storedFileName = 'job_descriptions/' . uniqid('jd_', true) . '.webp';
            $fullTargetPath = Storage::disk('public')->path($storedFileName);
            $targetDirectory = dirname($fullTargetPath);

            if (!is_dir($targetDirectory)) {
                mkdir($targetDirectory, 0775, true);
            }

            if (function_exists('imagewebp')) {
                imagewebp($targetImage, $fullTargetPath, 82);
            } else {
                $storedFileName = 'job_descriptions/' . uniqid('jd_', true) . '.jpg';
                $fullTargetPath = Storage::disk('public')->path($storedFileName);
                imagejpeg($targetImage, $fullTargetPath, 82);
            }

            imagedestroy($sourceImage);
            imagedestroy($targetImage);

            return $storedFileName;
        } catch (\Throwable $e) {
            return $uploadedFile->store('job_descriptions', 'public');
        }
    }
}
