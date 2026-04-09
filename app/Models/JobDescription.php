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
        'month',
        'year_end',
        'month_end',
        'title',
        'title_en',
        'description',
        'description_en',
        'items',
        'items_en',
        'illustration_image',
        'illustration_image_data',
        'order',
        'is_active',
    ];

    protected $casts = [
        'items' => 'array',
        'items_en' => 'array',
        'is_active' => 'boolean',
        'year' => 'integer',
        'month' => 'integer',
        'year_end' => 'integer',
        'month_end' => 'integer',
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

    private static array $monthNames = [
        1 => 'Jan', 2 => 'Feb', 3 => 'Mar', 4 => 'Apr',
        5 => 'Mei', 6 => 'Jun', 7 => 'Jul', 8 => 'Agu',
        9 => 'Sep', 10 => 'Okt', 11 => 'Nov', 12 => 'Des',
    ];

    public function getYearLabelAttribute(): string
    {
        if (!$this->year) return 'Lainnya';

        $startLabel = ($this->month ? self::$monthNames[$this->month] . ' ' : '') . $this->year;

        if ($this->year_end) {
            $endLabel = ($this->month_end ? self::$monthNames[$this->month_end] . ' ' : '') . $this->year_end;
            return $startLabel . ' – ' . $endLabel;
        }

        return $startLabel . ' – Sekarang';
    }

    public function getDurationLabelAttribute(): ?string
    {
        if (!$this->year) return null;

        $startMonth = $this->month ?: 1;
        $startYear = $this->year;

        if ($this->year_end) {
            $endMonth = $this->month_end ?: 12;
            $endYear = $this->year_end;
        } else {
            // Sampai sekarang
            $endMonth = (int) date('n');
            $endYear = (int) date('Y');
        }

        $totalMonths = ($endYear - $startYear) * 12 + ($endMonth - $startMonth) + 1;
        if ($totalMonths < 1) $totalMonths = 1;

        $years = intdiv($totalMonths, 12);
        $months = $totalMonths % 12;

        $parts = [];
        if ($years > 0) $parts[] = $years . ' Tahun';
        if ($months > 0) $parts[] = $months . ' Bulan';

        return implode(' ', $parts) ?: '1 Bulan';
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
