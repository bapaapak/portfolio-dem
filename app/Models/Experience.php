<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Experience extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'title_en',
        'company',
        'logo',
        'company_en',
        'type',
        'location',
        'location_en',
        'start_date',
        'end_date',
        'description',
        'description_en',
        'technologies',
        'technologies_en',
        'order',
        'featured',
        'date_format',
        'show_description',
        'show_tags',
    ];

    protected $casts = [
        'start_date' => 'date',
        'end_date' => 'date',
        'technologies' => 'array',
        'technologies_en' => 'array',
        'featured' => 'boolean',
        'show_description' => 'boolean',
        'show_tags' => 'boolean',
    ];

    public function getLogoUrlAttribute(): ?string
    {
        $logoPath = $this->normalizeMediaPath($this->logo);
        if (!$logoPath) {
            return null;
        }

        if (preg_match('#^https?://#', $logoPath)) {
            return $logoPath;
        }

        return '/storage/' . $logoPath;
    }

    public function getLogoFallbackUrlAttribute(): ?string
    {
        $logoPath = $this->normalizeMediaPath($this->logo);
        if (!$logoPath) {
            return null;
        }

        if (preg_match('#^https?://#', $logoPath)) {
            return $logoPath;
        }

        return '/media/' . $logoPath;
    }

    private function normalizeMediaPath(?string $rawPath): ?string
    {
        if (!$rawPath) {
            return null;
        }

        $path = str_replace('\\', '/', trim($rawPath));

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        $path = ltrim($path, '/');

        $prefixes = [
            'storage/app/public/',
            'app/storage/app/public/',
            'var/www/html/storage/app/public/',
            'app/public/',
            'public/storage/',
            'storage/',
            'public/',
        ];

        // Strip one or more known leading prefixes that may appear in legacy data.
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

    public function scopeFeatured($query)
    {
        return $query->where('featured', true);
    }

    public function getFormattedStartDateAttribute()
    {
        return $this->start_date->format($this->date_format ?? 'M Y');
    }

    public function getFormattedEndDateAttribute()
    {
        return $this->end_date ? $this->end_date->format($this->date_format ?? 'M Y') : 'Present';
    }
}
