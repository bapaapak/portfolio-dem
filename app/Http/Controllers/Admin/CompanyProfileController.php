<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class CompanyProfileController extends Controller
{
    public function index()
    {
        $profile = \App\Models\CompanyProfile::firstOrNew();
        return view('admin.company_profile.index', compact('profile'));
    }

    public function update(Request $request)
    {
        $profile = \App\Models\CompanyProfile::firstOrNew();

        $data = $request->validate([
            'name' => 'required|string|max:255',
            'logo' => 'nullable|image|max:2048',
            'slogan' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'plant_1_name' => 'nullable|string|max:255',
            'plant_1_image' => 'nullable|image|max:2048',
            'plant_2_name' => 'nullable|string|max:255',
            'plant_2_image' => 'nullable|image|max:2048',
            'employees_cikarang' => 'nullable|integer',
            'employees_cirebon' => 'nullable|integer',
            'business_model_title' => 'nullable|string|max:255',
            'director_name' => 'nullable|string|max:255',
            'director_title' => 'nullable|string|max:255',
            'footer_text' => 'nullable|string|max:500',
            'director_image' => 'nullable|image|max:2048',
            'triputra_dna_image' => 'nullable|image|max:2048',
            'business_models' => 'nullable|array',
            'business_models.*.title' => 'nullable|string',
            'business_models.*.description' => 'nullable|string',
        ]);

        // Helper to upload file with extension handling
        $upload = function($key, $path) use ($request, $profile) {
            if ($request->hasFile($key)) {
                $file = $request->file($key);
                $ext = strtolower($file->getClientOriginalExtension());
                
                // Validate it's an image
                if (!in_array($ext, ['jpg', 'jpeg', 'png', 'webp', 'gif', 'jfif'])) {
                    return $profile->$key;
                }

                // Delete old file if exists
                if ($profile->$key && Storage::exists('public/' . $profile->$key)) {
                    Storage::delete('public/' . $profile->$key);
                }
                
                // If jfif, convert extension to jpg
                if ($ext === 'jfif') {
                    $filename = Str::random(40) . '.jpg';
                    return $file->storeAs($path, $filename, 'public');
                }
                
                return $file->store($path, 'public');
            }
            return $profile->$key;
        };

        $data['logo'] = $upload('logo', 'company/misc');
        $data['plant_1_image'] = $upload('plant_1_image', 'company/plants');
        $data['plant_2_image'] = $upload('plant_2_image', 'company/plants');
        $data['director_image'] = $upload('director_image', 'company/directors');
        $data['triputra_dna_image'] = $upload('triputra_dna_image', 'company/misc');

        // Handle Business Models with Images
        $businessModels = [];
        $inputModels = $request->input('business_models', []);
        $allFiles = $request->allFiles();
        
        foreach ($inputModels as $index => $modelData) {
            $model = [
                'title' => $modelData['title'] ?? '',
                'description' => $modelData['description'] ?? '',
                'image' => $modelData['existing_image'] ?? null, // Start with existing image
            ];
            
            // Check if a new image was uploaded for this index
            if (isset($allFiles['business_models'][$index]['image'])) {
                $file = $allFiles['business_models'][$index]['image'];
                if ($file->isValid()) {
                    $ext = strtolower($file->getClientOriginalExtension());
                    if (in_array($ext, ['jpg', 'jpeg', 'png', 'webp', 'gif'])) {
                        // Create directory if not exists
                        Storage::disk('public')->makeDirectory('company/business_models');
                        $path = $file->store('company/business_models', 'public');
                        $model['image'] = $path;
                    }
                }
            }
            
            $businessModels[] = $model;
        }
        
        $data['business_models'] = $businessModels;
        
        // Ensure non-nullable fields with defaults have values
        $data['business_model_title'] = $data['business_model_title'] ?? 'BISNIS MODEL DEM';
        $data['employees_cikarang'] = $data['employees_cikarang'] ?? 0;
        $data['employees_cirebon'] = $data['employees_cirebon'] ?? 0;
        $data['footer_text'] = $data['footer_text'] ?? 'Knowledge & Technology Transformation for Employee Engagement';
        $data['name'] = $data['name'] ?? 'PT DHARMA ELECTRINDO MFG.';
        
        // Save
        $profile->fill($data);
        $profile->save();

        return redirect()->route('admin.company-profile.index')->with('success', 'Company Profile updated successfully.');
    }
}
