<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ObstacleChallenge extends Model
{
    use HasFactory;

    protected $fillable = [
        'type',
        'title',
        'description',
        'items',
        'order',
        'is_active',
    ];

    protected $casts = [
        'items' => 'array',
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
