<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Concerns\ClearsHomeCache;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Category extends Model
{
    use HasFactory, ClearsHomeCache;

    protected $fillable = [
        'name',
        'slug',
        'color',
        'icon',
    ];

    public function projects(): HasMany
    {
        return $this->hasMany(Project::class);
    }
}
