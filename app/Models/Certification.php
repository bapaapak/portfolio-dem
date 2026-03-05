<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Certification extends Model
{
    protected $fillable = [
        'name',
        'name_en',
        'issuer',
        'issuer_en',
        'issued_at',
        'expiration_date',
        'credential_url',
        'description',
        'description_en',
    ];

    protected $casts = [
        'issued_at' => 'date',
        'expiration_date' => 'date',
    ];

    public function getFormattedIssuedAtAttribute()
    {
        return $this->issued_at ? $this->issued_at->format('M Y') : null;
    }
    
    public function getFormattedExpirationDateAttribute()
    {
        return $this->expiration_date ? $this->expiration_date->format('M Y') : 'No Expiration';
    }
}
