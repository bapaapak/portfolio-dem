<?php

namespace App\Helpers;

class ImageCompressor
{
    /**
     * Compress an uploaded file and return base64 data URI.
     * Resizes large images and converts to JPEG for smaller size.
     *
     * @param \Illuminate\Http\UploadedFile $file
     * @param int $maxWidth  Maximum width in pixels
     * @param int $maxHeight Maximum height in pixels
     * @param int $quality   JPEG quality (1-100)
     * @return string data:image/...;base64,...
     */
    public static function compressToBase64($file, int $maxWidth = 1200, int $maxHeight = 1200, int $quality = 75): string
    {
        $mime = $file->getMimeType();
        $path = $file->getRealPath();

        // SVG: don't compress, just encode
        if (str_contains($mime, 'svg')) {
            return 'data:' . $mime . ';base64,' . base64_encode(file_get_contents($path));
        }

        // GIF: don't compress (might be animated)
        if ($mime === 'image/gif') {
            return 'data:' . $mime . ';base64,' . base64_encode(file_get_contents($path));
        }

        // Check if GD is available
        if (!function_exists('imagecreatefromstring')) {
            return 'data:' . $mime . ';base64,' . base64_encode(file_get_contents($path));
        }

        $imageData = file_get_contents($path);
        $source = @imagecreatefromstring($imageData);

        if (!$source) {
            return 'data:' . $mime . ';base64,' . base64_encode($imageData);
        }

        $origWidth = imagesx($source);
        $origHeight = imagesy($source);

        // Calculate new dimensions
        $ratio = min($maxWidth / $origWidth, $maxHeight / $origHeight, 1.0);
        $newWidth = (int) round($origWidth * $ratio);
        $newHeight = (int) round($origHeight * $ratio);

        // Only resize if image is larger than max dimensions
        if ($ratio < 1.0) {
            $resized = imagecreatetruecolor($newWidth, $newHeight);

            // Preserve transparency for PNG
            if ($mime === 'image/png') {
                imagealphablending($resized, false);
                imagesavealpha($resized, true);
            }

            imagecopyresampled($resized, $source, 0, 0, 0, 0, $newWidth, $newHeight, $origWidth, $origHeight);
            imagedestroy($source);
            $source = $resized;
        }

        // Output to buffer
        ob_start();

        if ($mime === 'image/png') {
            // For PNG: try WebP first if available, otherwise use PNG with compression
            if (function_exists('imagewebp')) {
                imagewebp($source, null, $quality);
                $outputMime = 'image/webp';
            } else {
                imagepng($source, null, min(9, (int)(9 * (100 - $quality) / 100)));
                $outputMime = 'image/png';
            }
        } else {
            // JPEG/WebP: compress as JPEG
            imagejpeg($source, null, $quality);
            $outputMime = 'image/jpeg';
        }

        $compressed = ob_get_clean();
        imagedestroy($source);

        // Only use compressed version if it's actually smaller
        if (strlen($compressed) < strlen($imageData)) {
            return 'data:' . $outputMime . ';base64,' . base64_encode($compressed);
        }

        return 'data:' . $mime . ';base64,' . base64_encode($imageData);
    }
}
