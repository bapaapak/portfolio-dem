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
        if (!$this->logo) {
            return null;
        }

        $logoPath = ltrim($this->logo, '/');

        if (preg_match('#^https?://#', $logoPath)) {
            return $logoPath;
        }

        return '/media/' . $logoPath;
    }

    public function getLogoFallbackUrlAttribute(): ?string
    {
        if (!$this->logo) {
            return null;
        }

        $logoPath = ltrim($this->logo, '/');

        if (preg_match('#^https?://#', $logoPath)) {
            return $logoPath;
        }

        return '/storage/' . $logoPath;
    }
}
