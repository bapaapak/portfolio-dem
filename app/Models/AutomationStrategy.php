<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AutomationStrategy extends Model
{
    use HasFactory;

    protected $fillable = [
        'term_type',
        'category',
        'title',
        'items',
        'order',
        'is_active',
    ];

    protected $casts = [
        'items' => 'array',
        'is_active' => 'boolean',
    ];

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function scopeShortTerm($query)
    {
        return $query->where('term_type', 'short');
    }

    public function scopeMiddleTerm($query)
    {
        return $query->where('term_type', 'middle');
    }

    public function scopeLongTerm($query)
    {
        return $query->where('term_type', 'long');
    }

    public function scopeManufacturing($query)
    {
        return $query->where('category', 'manufacturing');
    }

    public function scopeDigitalization($query)
    {
        return $query->where('category', 'digitalization');
    }

    // Helper to get term type label
    public function getTermLabelAttribute()
    {
        return match($this->term_type) {
            'short' => 'Short Term Strategy',
            'middle' => 'Middle Term Strategy',
            'long' => 'Long Term Strategy',
            default => $this->term_type,
        };
    }

    // Helper to get category label
    public function getCategoryLabelAttribute()
    {
        return match($this->category) {
            'manufacturing' => 'Manufacturing',
            'digitalization' => 'Digitalization & Automation',
            default => $this->category,
        };
    }
}
