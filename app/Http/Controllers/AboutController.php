<?php

namespace App\Http\Controllers;

use App\Models\Experience;
use App\Models\Profile;
use App\Models\Skill;
use Illuminate\Support\Facades\Storage;

class AboutController extends Controller
{
    public function index()
    {
        $profile = Profile::first();
        $skills = Skill::orderBy('order')->get();
        $experiences = Experience::orderBy('order')->get();

        return view('about', compact('profile', 'skills', 'experiences'));
    }

    public function downloadCV()
    {
        $profile = Profile::first();
        
        if ($profile && $profile->cv_file && Storage::disk('public')->exists($profile->cv_file)) {
            return Storage::disk('public')->download($profile->cv_file, 'CV-' . str_replace(' ', '-', $profile->name) . '.pdf');
        }

        return back()->with('error', 'CV file not available.');
    }
}
