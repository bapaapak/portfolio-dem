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

    /**
     * Serve a base64-encoded image from the database as a real image response.
     * URL: /dbimg/{model}/{field}/{id?}
     * Examples:
     *   /dbimg/company/logo_data
     *   /dbimg/project/thumbnail_data/5
     */
    public function dbimg(Request $request, string $model, string $field, ?int $id = null)
    {
        try {
            // Whitelist allowed models and fields
            $allowed = [
                'company' => [
                    'class' => \App\Models\CompanyProfile::class,
                    'fields' => ['logo_data', 'plant_1_image_data', 'plant_2_image_data', 'director_image_data', 'triputra_dna_image_data'],
                    'single' => true,
                ],
                'company_bm' => [
                    'class' => \App\Models\CompanyProfile::class,
                    'fields' => ['image_data'],
                    'single' => true,
                    'json_array' => 'business_models',
                ],
                'project' => [
                    'class' => \App\Models\Project::class,
                    'fields' => ['thumbnail_data'],
                    'single' => false,
                ],
                'job_description' => [
                    'class' => \App\Models\JobDescription::class,
                    'fields' => ['illustration_image_data'],
                    'single' => false,
                ],
                'experience' => [
                    'class' => \App\Models\Experience::class,
                    'fields' => ['logo_data'],
                    'single' => false,
                ],
                'education' => [
                    'class' => \App\Models\Education::class,
                    'fields' => ['logo_data'],
                    'single' => false,
                ],
                'committee' => [
                    'class' => \App\Models\CommitteeActivity::class,
                    'fields' => ['image_data'],
                    'single' => false,
                ],
                'profile' => [
                    'class' => \App\Models\Profile::class,
                    'fields' => ['aspiration_image_data'],
                    'single' => true,
                ],
            ];

            if (!isset($allowed[$model])) {
                return new Response('', 404);
            }

            $config = $allowed[$model];

            if (!in_array($field, $config['fields'], true)) {
                return new Response('', 404);
            }

            if ($config['single']) {
                $record = $config['class']::first();
            } else {
                if ($id === null) {
                    return new Response('', 404);
                }
                $record = $config['class']::find($id);
            }

            if (!$record) {
                return new Response('', 404);
            }

            // Handle JSON array fields (e.g. business_models[index].image_data)
            if (isset($config['json_array'])) {
                $arrayField = $config['json_array'];
                $items = $record->$arrayField;
                if (!is_array($items) || $id === null || !isset($items[$id][$field])) {
                    return new Response('', 404);
                }
                $data = $items[$id][$field];
            } else {
                if (empty($record->$field)) {
                    return new Response('', 404);
                }
                $data = $record->$field;
            }

            // Parse "data:image/png;base64,xxxx"
            if (!preg_match('/^data:image\/([a-zA-Z0-9+]+);base64,(.+)$/', $data, $matches)) {
                return new Response('', 404);
            }

            $mimeSubtype = $matches[1];
            $binary = base64_decode($matches[2], true);

            if ($binary === false) {
                return new Response('', 404);
            }

            $mimeMap = [
                'png' => 'image/png',
                'jpeg' => 'image/jpeg',
                'jpg' => 'image/jpeg',
                'gif' => 'image/gif',
                'webp' => 'image/webp',
                'svg+xml' => 'image/svg+xml',
            ];

            $contentType = $mimeMap[$mimeSubtype] ?? 'image/' . $mimeSubtype;

            $etag = '"' . md5($data) . '"';

            // Return 304 Not Modified if browser already has this version
            $ifNoneMatch = $request->header('If-None-Match');
            if ($ifNoneMatch && $ifNoneMatch === $etag) {
                return new Response('', 304, [
                    'Cache-Control' => 'public, max-age=604800',
                    'ETag' => $etag,
                ]);
            }

            return new Response($binary, 200, [
                'Content-Type' => $contentType,
                'Content-Length' => strlen($binary),
                'Cache-Control' => 'public, max-age=604800',
                'ETag' => $etag,
            ]);
        } catch (\Throwable $e) {
            return new Response('', 404);
        }
    }
}
