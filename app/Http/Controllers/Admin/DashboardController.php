<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Project;
use App\Models\Skill;
use App\Models\Technology;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $profile = \App\Models\Profile::first();
        
        // Define all available sections (Home Page Sections)
        $sections = [
            'hero' => 'Hero Section',
            'stats' => 'Statistics',
            'about' => 'About Me',
            'experience' => 'Professional Experience',
            'education' => 'Education',
            'quote' => 'Quote Section',
            'tech_stack' => 'Tech Stack',
            'skills' => 'Additional Information (Skills)',
            'certifications' => 'Certifications',
            'committee_activities' => 'Committee Activities',
            'career_aspiration' => 'Career Aspiration & Milestones',
            'automation_strategy' => 'Automation & Digitalization Strategy',
            'obstacle_challenge' => 'Obstacle & Challenge',
            'job_description' => 'Job Description & Activity',
            'business_process_flow' => 'Flow Process Bisnis',
            'company_profile' => 'Company Profile',
            'organization_structure' => 'Organization Structure',
            'projects' => 'Featured Projects',
            'contact' => 'Contact Section',
            'social' => 'Find Me On (Social Links)',
        ];
        
        // Get current visibility settings (default all visible)
        $visibleSections = $profile->visible_sections ?? array_keys($sections);
        
        // Get section order (default to defined order)
        $sectionOrder = $profile->section_order ?? array_keys($sections);

        // Ensure all defined sections are in the order array (in case new ones added)
        $missingSections = array_diff(array_keys($sections), $sectionOrder);
        $sectionOrder = array_merge($sectionOrder, $missingSections);

        // Sort sections array based on sectionOrder
        $orderedSections = [];
        foreach ($sectionOrder as $key) {
            if (isset($sections[$key])) {
                $orderedSections[$key] = $sections[$key];
            }
        }
        // Append any remaining that might have been missed
        foreach ($sections as $key => $label) {
            if (!isset($orderedSections[$key])) {
                $orderedSections[$key] = $label;
            }
        }
        $sections = $orderedSections;

        // Define all available sidebar menus (Admin Panel Navigation)
        $sidebarMenus = [
            'dashboard' => ['label' => 'Dashboard', 'icon' => 'fa-th-large'],
            'projects' => ['label' => 'Projects', 'icon' => 'fa-folder-open'],
            'experience' => ['label' => 'Experience', 'icon' => 'fa-briefcase'],
            'education' => ['label' => 'Education', 'icon' => 'fa-graduation-cap'],
            'tech_stack' => ['label' => 'Tech Stack', 'icon' => 'fa-code'],
            'skills' => ['label' => 'Skills', 'icon' => 'fa-list-ul'],
            'certifications' => ['label' => 'Certifications', 'icon' => 'fa-certificate'],
            'company_profile' => ['label' => 'Profil Perusahaan', 'icon' => 'fa-building'],
            'organization_structure' => ['label' => 'Struktur Organisasi', 'icon' => 'fa-sitemap'],
            'committee_activities' => ['label' => 'Aktivitas Kepanitiaan', 'icon' => 'fa-calendar-check'],
            'career_aspiration' => ['label' => 'Career Aspiration', 'icon' => 'fa-rocket'],
            'automation_strategy' => ['label' => 'Strategi Otomasi', 'icon' => 'fa-cogs'],
            'obstacle_challenge' => ['label' => 'Obstacle & Challenge', 'icon' => 'fa-exclamation-triangle'],
            'job_description' => ['label' => 'Job Description', 'icon' => 'fa-clipboard-list'],
            'business_process_flows' => ['label' => 'Flow Process Bisnis', 'icon' => 'fa-project-diagram'],
            'settings' => ['label' => 'Settings', 'icon' => 'fa-cog'],
        ];

        // Get current sidebar menu visibility settings (default all visible)
        $visibleSidebarMenus = $profile->visible_sidebar_menus ?? array_keys($sidebarMenus);

        return view('admin.dashboard', compact('sections', 'visibleSections', 'sidebarMenus', 'visibleSidebarMenus', 'profile', 'sectionOrder'));
    }

    public function updateSections(\Illuminate\Http\Request $request)
    {
        $profile = \App\Models\Profile::first();
        
        if (!$profile) {
            return redirect()->back()->with('error', 'Profile not found.');
        }

        $visibleSections = $request->input('visible_sections', []);
        
        // Handle section order
        $sectionOrder = $request->input('section_order');
        if (is_string($sectionOrder)) {
            $sectionOrder = json_decode($sectionOrder, true);
        }
        
        $profile->update([
            'visible_sections' => $visibleSections,
            'section_order' => $sectionOrder
        ]);

        return redirect()->route('admin.dashboard')->with('success', 'Section settings updated successfully!');
    }

    public function updateSidebarMenus(\Illuminate\Http\Request $request)
    {
        $profile = \App\Models\Profile::first();
        
        if (!$profile) {
            return redirect()->back()->with('error', 'Profile not found.');
        }

        $visibleSidebarMenus = $request->input('visible_sidebar_menus', []);
        $profile->update(['visible_sidebar_menus' => $visibleSidebarMenus]);

        return redirect()->route('admin.dashboard')->with('success', 'Sidebar menu visibility updated successfully!');
    }
}
