<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobDescription extends Model
{
    use HasFactory;

    protected $fillable = [
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

    protected $casts = [
        'items' => 'array',
        'is_active' => 'boolean',
        'year' => 'integer',
        'year_end' => 'integer',
    ];

    public function getIllustrationImageUrlAttribute(): ?string
    {
        $path = $this->illustration_image_storage_path;
        if (!$path) {
            return null;
        }

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        return '/media/' . $path;
    }

    public function getIllustrationImageFallbackUrlAttribute(): ?string
    {
        $path = $this->illustration_image_storage_path;
        if (!$path) {
            return null;
        }

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        return '/storage/' . ltrim($path, '/');
    }

    public function getIllustrationImageStoragePathAttribute(): ?string
    {
        return $this->normalizeMediaPath($this->illustration_image);
    }

    private function normalizeMediaPath(?string $rawPath): ?string
    {
        if (!$rawPath) {
            return null;
        }

        $raw = str_replace('\\', '/', trim($rawPath));
        $path = $raw;

        if (preg_match('#^https?://#', $raw)) {
            $parsedPath = parse_url($raw, PHP_URL_PATH) ?: '';

            if ($parsedPath === '' || !preg_match('#/(storage|media|public)/#', $parsedPath)) {
                return $raw;
            }

            $path = $parsedPath;
        }

        $path = ltrim($path, '/');

        if (str_starts_with($path, 'media/')) {
            $path = substr($path, strlen('media/'));
        }

        $prefixes = [
            'storage/app/public/',
            'app/storage/app/public/',
            'var/www/html/storage/app/public/',
            'app/public/',
            'public/storage/',
            'storage/',
            'public/',
        ];

        $stripped = true;
        while ($stripped) {
            $stripped = false;
            foreach ($prefixes as $prefix) {
                if (str_starts_with($path, $prefix)) {
                    $path = ltrim(substr($path, strlen($prefix)), '/');
                    $stripped = true;
                    break;
                }
            }
        }

        return ltrim($path, '/');
    }

    public function getYearLabelAttribute(): string
    {
        if (!$this->year) return 'Lainnya';
        if ($this->year_end) {
            return $this->year . ' – ' . $this->year_end;
        }
        return $this->year . ' – Sekarang';
    }

    // Scopes
    public function scopeDescriptions($query)
    {
        return $query->where('type', 'description');
    }

    public function scopeActivities($query)
    {
        return $query->where('type', 'activity');
    }

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('order', 'asc');
    }
}
