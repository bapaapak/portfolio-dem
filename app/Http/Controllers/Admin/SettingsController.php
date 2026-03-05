<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SettingsController extends Controller
{
    public function index()
    {
        $profile = Profile::first();
        return view('admin.settings', compact('profile'));
    }

    public function update(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'website_title' => 'nullable|string|max:255',
            'title' => 'nullable|string|max:255',
            'bio' => 'nullable|string',
            'bio_id' => 'nullable|string',
            'story' => 'nullable|string',
            'email' => 'nullable|email|max:255',
            'phone' => 'nullable|string|max:50',
            'whatsapp' => 'nullable|string|max:50',
            'location' => 'nullable|string|max:255',
            'years_experience' => 'nullable|integer|min:0',
            'total_projects' => 'nullable|integer|min:0',
            'happy_clients' => 'nullable|integer|min:0',
            'awards' => 'nullable|integer|min:0',
            'social_links' => 'nullable|array',
            'social_links.*' => 'nullable|url',
            'career_aspiration' => 'nullable|string',
            'career_aspiration_id' => 'nullable|string',
            'career_milestones' => 'nullable|array',
            'career_milestones.*.year' => 'required_with:career_milestones|string',
            'career_milestones.*.title' => 'required_with:career_milestones|string',
            'career_milestones.*.description' => 'nullable|string',
            'show_cv_button' => 'nullable|boolean',
            'show_contact_button' => 'nullable|boolean',
        ]);

        $profile = Profile::first();

        // Handle checkboxes (boolean)
        $validated['show_cv_button'] = $request->has('show_cv_button');
        $validated['show_contact_button'] = $request->has('show_contact_button');

        if ($profile) {
            $profile->update($validated);
        } else {
            Profile::create($validated);
        }

        return back()->with('success', 'Pengaturan berhasil diperbarui!');
    }

    public function uploadCV(Request $request)
    {
        $request->validate([
            'cv_file' => 'required|mimes:pdf|max:5120',
        ]);

        $profile = Profile::first();

        if (!$profile) {
            $profile = Profile::create(['name' => 'Administrator']);
        }

        if ($profile->cv_file) {
            Storage::disk('public')->delete($profile->cv_file);
        }

        $path = $request->file('cv_file')->store('cv', 'public');
        $profile->update(['cv_file' => $path]);

        return back()->with('success', 'CV berhasil diupload!');
    }

    public function uploadPhoto(Request $request)
    {
        $request->validate([
            'photo' => 'required|file|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $profile = Profile::first();

        if (!$profile) {
            $profile = Profile::create(['name' => 'Administrator']);
        }

        if ($profile->photo) {
            Storage::disk('public')->delete($profile->photo);
        }

        $path = $request->file('photo')->store('profile', 'public');
        $profile->update(['photo' => $path]);

        return back()->with('success', 'Foto profil berhasil diupload!');
    }

    public function uploadFavicon(Request $request)
    {
        $request->validate([
            'favicon' => 'required|file|mimes:ico,png,jpg,svg|max:1024',
        ]);

        $profile = Profile::first();

        if (!$profile) {
            $profile = Profile::create(['name' => 'Administrator']);
        }

        if ($profile->favicon) {
            Storage::disk('public')->delete($profile->favicon);
        }

        $path = $request->file('favicon')->store('favicon', 'public');
        $profile->update(['favicon' => $path]);

        return back()->with('success', 'Favicon berhasil diupload!');
    }
}
