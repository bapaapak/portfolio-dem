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
}
