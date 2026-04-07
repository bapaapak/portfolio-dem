<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Education extends Model
{
    use HasFactory;

    protected $fillable = [
        'institution',
        'logo',
        'logo_data',
        'degree',
        'start_date',
        'end_date',
        'location',
        'description',
        'gpa',
        'order',
        'is_current',
        'date_format',
    ];

    protected $casts = [
        'start_date' => 'date',
        'end_date' => 'date',
        'is_current' => 'boolean',
    ];

    public function getLogoUrlAttribute(): ?string
    {
        $path = $this->logo_storage_path;
        if (!$path) {
            return null;
        }

        $logoPath = ltrim($path, '/');

        if (preg_match('#^https?://#', $logoPath)) {
            return $logoPath;
        }

        return '/media/' . $logoPath;
    }

    public function getLogoFallbackUrlAttribute(): ?string
    {
        $path = $this->logo_storage_path;
        if (!$path) {
            return null;
        }

        $logoPath = ltrim($path, '/');

        if (preg_match('#^https?://#', $logoPath)) {
            return $logoPath;
        }

        return '/storage/' . $logoPath;
    }

    public function getLogoStoragePathAttribute(): ?string
    {
        if (!$this->logo) {
            return null;
        }

        $logoPath = str_replace('\\', '/', trim($this->logo));

        if (preg_match('#^https?://#', $logoPath)) {
            $parsedPath = parse_url($logoPath, PHP_URL_PATH) ?: '';
            if ($parsedPath === '' || !preg_match('#/(storage|media|public)/#', $parsedPath)) {
                return $logoPath;
            }
            $logoPath = $parsedPath;
        }

        $logoPath = ltrim($logoPath, '/');

        foreach ([
            'storage/app/public/',
            'app/storage/app/public/',
            'var/www/html/storage/app/public/',
            'public/storage/',
            'storage/',
            'public/',
        ] as $prefix) {
            if (str_starts_with($logoPath, $prefix)) {
                $logoPath = ltrim(substr($logoPath, strlen($prefix)), '/');
                break;
            }
        }

        return ltrim($logoPath, '/');
    }
}
