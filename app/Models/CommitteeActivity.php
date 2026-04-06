<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CommitteeActivity extends Model
{
    protected $fillable = [
        'title',
        'title_en',
        'role',
        'role_en',
        'description',
        'description_en',
        'organization',
        'event_date',
        'end_date',
        'location',
        'image',
        'order',
        'is_active',
    ];

    protected $casts = [
        'event_date' => 'date',
        'end_date' => 'date',
        'is_active' => 'boolean',
    ];

    /**
     * Scope to get only active activities
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * Get formatted date range
     */
    public function getFormattedDateAttribute()
    {
        if (!$this->event_date) {
            return '-';
        }
        
        if ($this->end_date && $this->end_date != $this->event_date) {
            return $this->event_date->format('d M Y') . ' - ' . $this->end_date->format('d M Y');
        }
        
        return $this->event_date->format('d M Y');
    }

    public function getImageUrlAttribute(): ?string
    {
        $path = $this->normalizeMediaPath($this->image);
        if (!$path) {
            return null;
        }

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        return '/storage/' . $path;
    }

    public function getImageFallbackUrlAttribute(): ?string
    {
        $path = $this->normalizeMediaPath($this->image);
        if (!$path) {
            return null;
        }

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        return '/media/' . $path;
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
}
