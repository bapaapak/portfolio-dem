<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CommitteeActivity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CommitteeActivityController extends Controller
{
    public function index()
    {
        $activities = CommitteeActivity::orderBy('order')
            ->orderBy('event_date', 'desc')
            ->get();
        
        return view('admin.committee_activities.index', compact('activities'));
    }

    public function create()
    {
        return view('admin.committee_activities.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'title_en' => 'nullable|string|max:255',
            'role' => 'required|string|max:255',
            'role_en' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'description_en' => 'nullable|string',
            'organization' => 'nullable|string|max:255',
            'event_date' => 'nullable|date',
            'end_date' => 'nullable|date|after_or_equal:event_date',
            'location' => 'nullable|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'order' => 'nullable|integer',
            'is_active' => 'boolean',
        ]);

        if ($request->hasFile('image')) {
            if ($request->file('image')) {
                $validated['image'] = $this->storeCompressedImage($request->file('image'));
            }
        }

        $validated['is_active'] = $request->has('is_active');
        $validated['order'] = $validated['order'] ?? 0;

        CommitteeActivity::create($validated);

        return redirect()->route('admin.committee-activities.index')
            ->with('success', 'Aktivitas kepanitiaan berhasil ditambahkan!');
    }

    public function edit(CommitteeActivity $committee_activity)
    {
        return view('admin.committee_activities.edit', compact('committee_activity'));
    }

    public function update(Request $request, CommitteeActivity $committee_activity)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'title_en' => 'nullable|string|max:255',
            'role' => 'required|string|max:255',
            'role_en' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'description_en' => 'nullable|string',
            'organization' => 'nullable|string|max:255',
            'event_date' => 'nullable|date',
            'end_date' => 'nullable|date|after_or_equal:event_date',
            'location' => 'nullable|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'order' => 'nullable|integer',
            'is_active' => 'boolean',
        ]);

        if ($request->hasFile('image')) {
            // Delete old image
            if ($committee_activity->image) {
                Storage::disk('public')->delete($committee_activity->image);
            }
            $validated['image'] = $this->storeCompressedImage($request->file('image'));
        }

        $validated['is_active'] = $request->has('is_active');
        $validated['order'] = $validated['order'] ?? 0;

        $committee_activity->update($validated);

        return redirect()->route('admin.committee-activities.index')
            ->with('success', 'Aktivitas kepanitiaan berhasil diperbarui!');
    }

    public function destroy(CommitteeActivity $committee_activity)
    {
        // Delete image if exists
        if ($committee_activity->image) {
            Storage::disk('public')->delete($committee_activity->image);
        }

        $committee_activity->delete();

        return redirect()->route('admin.committee-activities.index')
            ->with('success', 'Aktivitas kepanitiaan berhasil dihapus!');
    }

    private function storeCompressedImage($uploadedFile): string
    {
        try {
            $tmpPath = $uploadedFile->getRealPath();
            $imageContents = $tmpPath ? file_get_contents($tmpPath) : false;

            if ($imageContents === false || !function_exists('imagecreatefromstring')) {
                return $uploadedFile->store('committee', 'public');
            }

            $sourceImage = @imagecreatefromstring($imageContents);
            if (!$sourceImage) {
                return $uploadedFile->store('committee', 'public');
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

            $storedFileName = 'committee/' . uniqid('committee_', true) . '.webp';
            $fullTargetPath = Storage::disk('public')->path($storedFileName);
            $targetDirectory = dirname($fullTargetPath);

            if (!is_dir($targetDirectory)) {
                mkdir($targetDirectory, 0775, true);
            }

            if (function_exists('imagewebp')) {
                imagewebp($targetImage, $fullTargetPath, 82);
            } else {
                $storedFileName = 'committee/' . uniqid('committee_', true) . '.jpg';
                $fullTargetPath = Storage::disk('public')->path($storedFileName);
                imagejpeg($targetImage, $fullTargetPath, 82);
            }

            imagedestroy($sourceImage);
            imagedestroy($targetImage);

            return $storedFileName;
        } catch (\Throwable $e) {
            return $uploadedFile->store('committee', 'public');
        }
    }
}
