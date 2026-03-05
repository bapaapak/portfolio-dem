<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Profile;
use Illuminate\Http\Request;

class CareerAspirationController extends Controller
{
    public function index()
    {
        $profile = Profile::firstOrCreate([]);
        return view('admin.career_aspiration.index', compact('profile'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'career_aspiration' => 'nullable|string',
            'career_milestones' => 'nullable|array',
            'career_milestones.*.year' => 'nullable|string',
            'career_milestones.*.title' => 'required_with:career_milestones.*.year|string',
            'career_milestones.*.description' => 'nullable|string',
        ]);

        $profile = Profile::first();
        
        $milestones = array_filter($request->input('career_milestones', []), function($item) {
            return !empty($item['year']) || !empty($item['title']);
        });

        $profile->update([
            'career_aspiration' => $request->input('career_aspiration'),
            'career_milestones' => array_values($milestones),
        ]);

        return redirect()->route('admin.career-aspiration.index')
            ->with('success', 'Career Aspiration updated successfully!');
    }
}
