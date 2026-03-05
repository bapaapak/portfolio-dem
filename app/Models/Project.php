<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
        'category_id',
        'title',
        'slug',
        'client',
        'role',
        'timeline',
        'description',
        'challenge',
        'solution',
        'thumbnail',
        'images',
        'tags',
        'tools',
        'key_improvements',
        'live_url',
        'code_url',
        'status',
        'featured',
    ];

    protected $casts = [
        'images' => 'array',
        'tags' => 'array',
        'tools' => 'array',
        'key_improvements' => 'array',
        'featured' => 'boolean',
    ];

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function scopePublished($query)
    {
        return $query->where('status', 'published');
    }

    public function scopeFeatured($query)
    {
        return $query->where('featured', true);
    }
}
