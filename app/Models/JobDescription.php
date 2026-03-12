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
