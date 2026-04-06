<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class MediaController extends Controller
{
    public function show(Request $request, string $path)
    {
        try {
            $cleanPath = ltrim($path, '/');

            // Prevent path traversal attempts
            if (str_contains($cleanPath, '..')) {
                abort(404);
            }

            // Accept both "job_descriptions/file.jpg" and "storage/job_descriptions/file.jpg"
            if (str_starts_with($cleanPath, 'storage/')) {
                $cleanPath = substr($cleanPath, strlen('storage/'));
            }

            if (Storage::disk('public')->exists($cleanPath)) {
                return Storage::disk('public')->response($cleanPath, null, [
                    'Cache-Control' => 'public, max-age=86400',
                ]);
            }

            // Fallback path for environments with custom storage/symlink layouts.
            $publicStoragePath = public_path('storage/' . $cleanPath);
            if (is_file($publicStoragePath) && is_readable($publicStoragePath)) {
                return response()->file($publicStoragePath, [
                    'Cache-Control' => 'public, max-age=86400',
                ]);
            }

            abort(404);
        } catch (\Throwable $e) {
            Log::warning('MediaController show failed: ' . $e->getMessage(), [
                'path' => $path,
            ]);
            abort(404);
        }
    }
}
