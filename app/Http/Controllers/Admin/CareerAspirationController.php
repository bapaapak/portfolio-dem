<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Schema;

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
            'aspiration_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:10240',
        ]);

        $profile = Profile::firstOrCreate([]);
        
        $milestones = array_filter($request->input('career_milestones', []), function($item) {
            return !empty($item['year']) || !empty($item['title']);
        });

        $updateData = [
            'career_aspiration' => $request->input('career_aspiration'),
            'career_milestones' => array_values($milestones),
        ];

        if ($request->hasFile('aspiration_image') && Schema::hasColumn('profiles', 'aspiration_image')) {
            if ($profile->aspiration_image) {
                Storage::disk('public')->delete($profile->aspiration_image);
            }
            $updateData['aspiration_image'] = $request->file('aspiration_image')->store('career_aspiration', 'public');
        }

        $profile->update($updateData);

        return redirect()->route('admin.career-aspiration.index')
            ->with('success', 'Career Aspiration updated successfully!');
    }
}
