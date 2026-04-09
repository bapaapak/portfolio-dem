<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Concerns\ClearsHomeCache;

class ObstacleChallenge extends Model
{
    use HasFactory, ClearsHomeCache;

    protected $fillable = [
        'type',
        'title',
        'title_en',
        'description',
        'description_en',
        'items',
        'items_en',
        'order',
        'is_active',
    ];

    protected $casts = [
        'items' => 'array',
        'items_en' => 'array',
        'is_active' => 'boolean',
    ];

    // Scopes
    public function scopeObstacles($query)
    {
        return $query->where('type', 'obstacle');
    }

    public function scopeChallenges($query)
    {
        return $query->where('type', 'challenge');
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
