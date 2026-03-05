<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BusinessProcessFlow extends Model
{
    use HasFactory;

    protected $fillable = [
        'role',
        'action',
        'description',
        'badge_text',
        'badge_color',
        'step_order',
    ];
}
