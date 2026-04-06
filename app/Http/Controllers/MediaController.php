<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\Response;

class MediaController extends Controller
{
    public function show(Request $request, string $path)
    {
        try {
            $cleanPath = ltrim($path, '/');

            // Prevent path traversal attempts
            if (str_contains($cleanPath, '..')) {
                return new Response('', 404);
            }

            // Accept both "job_descriptions/file.jpg" and "storage/job_descriptions/file.jpg"
            if (str_starts_with($cleanPath, 'storage/')) {
                $cleanPath = substr($cleanPath, strlen('storage/'));
            }

            // Fallback-friendly candidates for container/shared-hosting layouts.
            $candidates = [
                base_path('storage/app/public/' . $cleanPath),
                base_path('public/storage/' . $cleanPath),
                '/app/storage/app/public/' . $cleanPath,
                '/storage/app/public/' . $cleanPath,
            ];

            foreach ($candidates as $absolutePath) {
                if (is_file($absolutePath) && is_readable($absolutePath)) {
                    return new BinaryFileResponse($absolutePath, 200, [
                        'Cache-Control' => 'public, max-age=86400',
                    ]);
                }
            }

            return new Response('', 404);
        } catch (\Throwable $e) {
            // Avoid Laravel logging/rendering dependencies for this endpoint.
            return new Response('', 404);
        }
    }
}
