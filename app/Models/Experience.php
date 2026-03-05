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
