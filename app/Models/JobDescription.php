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
        $path = $this->normalizeMediaPath($this->illustration_image);
        if (!$path) {
            return null;
        }

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        return '/storage/' . $path;
    }

    public function getIllustrationImageFallbackUrlAttribute(): ?string
    {
        $path = $this->normalizeMediaPath($this->illustration_image);
        if (!$path) {
            return null;
        }

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        return '/media/' . ltrim($path, '/');
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
