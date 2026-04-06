<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class MediaController extends Controller
{
    public function show(Request $request, string $path)
    {
        $cleanPath = ltrim($path, '/');

        // Prevent path traversal attempts
        if (str_contains($cleanPath, '..')) {
            abort(404);
        }

        // Accept both "job_descriptions/file.jpg" and "storage/job_descriptions/file.jpg"
        if (str_starts_with($cleanPath, 'storage/')) {
            $cleanPath = substr($cleanPath, strlen('storage/'));
        }

        if (!Storage::disk('public')->exists($cleanPath)) {
            abort(404);
        }

        $absolutePath = Storage::disk('public')->path($cleanPath);

        return response()->file($absolutePath, [
            'Cache-Control' => 'public, max-age=86400',
        ]);
    }
}
