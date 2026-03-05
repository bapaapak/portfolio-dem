<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class OrganizationStructure extends Model
{
    // 6 Level Organization Structure
    public const LEVELS = [
        'board_of_director' => 'Board Of Director',
        'division' => 'Level Division',
        'department' => 'Level Department',
        'section' => 'Level Section',
        'staff' => 'Level Staff',
        'admin' => 'Level Admin',
    ];

    protected $fillable = [
        'name',
        'position',
        'department',
        'level',
        'photo',
        'parent_id',
        'order',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    /**
     * Get the parent (supervisor) of this person
     */
    public function parent(): BelongsTo
    {
        return $this->belongsTo(OrganizationStructure::class, 'parent_id');
    }

    /**
     * Get the children (subordinates) of this person
     */
    public function children(): HasMany
    {
        return $this->hasMany(OrganizationStructure::class, 'parent_id')->orderBy('order');
    }

    /**
     * Get all descendants recursively
     */
    public function descendants(): HasMany
    {
        return $this->children()->with('descendants');
    }

    /**
     * Scope to get only top-level members (no parent)
     */
    public function scopeTopLevel($query)
    {
        return $query->whereNull('parent_id');
    }

    /**
     * Scope to get only active members
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}
