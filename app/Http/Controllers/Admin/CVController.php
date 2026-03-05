<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Certification;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Profile;
use App\Models\Skill;

class CVController extends Controller
{
    public function index()
    {
        $profile = Profile::first();
        $experiences = Experience::orderBy('start_date', 'desc')->get();
        $educations = Education::orderBy('start_date', 'desc')->get();
        $technicalSkills = Skill::where('type', 'technical')->orderBy('order')->get();
        $softSkills = Skill::where('type', 'soft')->orderBy('order')->get();
        $certifications = Certification::orderBy('issued_at', 'desc')->get();

        return view('admin.cv.index', compact(
            'profile',
            'experiences',
            'educations',
            'technicalSkills',
            'softSkills',
            'certifications'
        ));
    }

    public function preview()
    {
        $profile = Profile::first();
        $experiences = Experience::orderBy('start_date', 'desc')->get();
        $educations = Education::orderBy('start_date', 'desc')->get();
        $technicalSkills = Skill::where('type', 'technical')->orderBy('order')->get();
        $softSkills = Skill::where('type', 'soft')->orderBy('order')->get();
        $certifications = Certification::orderBy('issued_at', 'desc')->get();

        return view('admin.cv.preview', compact(
            'profile',
            'experiences',
            'educations',
            'technicalSkills',
            'softSkills',
            'certifications'
        ));
    }
}
