<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'website_title',
        'title',
        'bio',
        'bio_id',
        'story',
        'photo',
        'favicon',
        'email',
        'phone',
        'whatsapp',
        'location',
        'cv_file',
        'years_experience',
        'total_projects',
        'happy_clients',
        'awards',
        'hobbies',
        'social_links',
        'visible_sections',
        'visible_sidebar_menus',
        'career_aspiration',
        'career_aspiration_id',
        'career_milestones',
        'aspiration_image',
        'section_order',
        'show_cv_button',
        'show_contact_button',
    ];

    protected $casts = [
        'hobbies' => 'array',
        'social_links' => 'array',
        'visible_sections' => 'array',
        'visible_sidebar_menus' => 'array',
        'career_milestones' => 'array',
        'section_order' => 'array',
        'show_cv_button' => 'boolean',
        'show_contact_button' => 'boolean',
    ];

    public function getAspirationImageUrlAttribute(): ?string
    {
        if (!$this->aspiration_image) {
            return null;
        }

        $path = ltrim($this->aspiration_image, '/');

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        if (str_starts_with($path, 'storage/')) {
            $path = substr($path, strlen('storage/'));
        }

        return '/media/' . ltrim($path, '/');
    }

    public function getAspirationImageFallbackUrlAttribute(): ?string
    {
        if (!$this->aspiration_image) {
            return null;
        }

        $path = ltrim($this->aspiration_image, '/');

        if (preg_match('#^https?://#', $path)) {
            return $path;
        }

        if (str_starts_with($path, 'storage/')) {
            return '/' . $path;
        }

        return '/storage/' . ltrim($path, '/');
    }
}
