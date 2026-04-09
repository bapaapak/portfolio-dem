<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Concerns\ClearsHomeCache;

class Skill extends Model
{
    use HasFactory, ClearsHomeCache;

    protected $fillable = [
        'category',
        'category_en',
        'items',
        'items_en',
        'type',
        'order',
    ];
}
