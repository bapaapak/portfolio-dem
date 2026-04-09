<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Concerns\ClearsHomeCache;

class CompanyProfile extends Model
{
    use ClearsHomeCache;

    protected $fillable = [
        'name',
        'logo',
        'logo_data',
        'slogan',
        'description',
        'plant_1_name',
        'plant_1_image',
        'plant_1_image_data',
        'plant_2_name',
        'plant_2_image',
        'plant_2_image_data',
        'employees_cikarang',
        'employees_cirebon',
        'business_model_title',
        'business_models',
        'director_name',
        'director_title',
        'director_image',
        'director_image_data',
        'footer_text',
        'triputra_dna_image',
        'triputra_dna_image_data',
    ];

    protected $casts = [
        'business_models' => 'array',
    ];
}
