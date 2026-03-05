<?php

namespace App\Http\Controllers;

use App\Models\AutomationStrategy;
use App\Models\Category;
use App\Models\CommitteeActivity;
use App\Models\CompanyProfile;
use App\Models\Education;
use App\Models\Experience;
use App\Models\OrganizationStructure;
use App\Models\Profile;
use App\Models\Project;
use App\Models\Technology;

class HomeController extends Controller
{
    public function index()
    {
        $profile = Profile::first();
        $categories = Category::all();
        
        // Only show featured experiences
        $experiences = Experience::featured()->orderBy('start_date', 'desc')->get();
        
        $educations = Education::orderBy('order')->orderBy('start_date', 'desc')->get();
        
        // Only show featured technologies that are also active
        $technologies = Technology::active()->featured()->orderBy('order')->orderBy('name')->get();
        
        // Get featured projects
        $featuredProjects = Project::with('category')
            ->published()
            ->featured()
            ->latest()
            ->take(6)
            ->get();
            
        // For project filtering, get all published projects
        $allProjects = Project::with('category')
            ->published()
            ->featured()  // Only featured projects
            ->latest()
            ->take(6)
            ->get();

        // Fetch skills
        $technicalSkills = \App\Models\Skill::where('type', 'technical')->orderBy('order')->get();
        $softSkills = \App\Models\Skill::where('type', 'soft')->orderBy('order')->get();

        // Fetch certifications
        $certifications = \App\Models\Certification::orderBy('issued_at', 'desc')->get();

        // Fetch committee activities
        $committeeActivities = CommitteeActivity::active()
            ->orderBy('order')
            ->orderBy('event_date', 'desc')
            ->get();

        // Fetch company profile
        $companyProfile = CompanyProfile::first();

        // Fetch organization structure (top level with hierarchy)
        $organizationMembers = OrganizationStructure::topLevel()
            ->active()
            ->with('descendants')
            ->orderBy('order')
            ->get();

        // Fetch automation strategies grouped by term type
        $automationStrategies = AutomationStrategy::active()
            ->orderBy('term_type')
            ->orderBy('category')
            ->orderBy('order')
            ->get()
            ->groupBy('term_type');

        // Fetch obstacles and challenges
        $obstacles = \App\Models\ObstacleChallenge::obstacles()->active()->ordered()->get();
        $challenges = \App\Models\ObstacleChallenge::challenges()->active()->ordered()->get();

        // Fetch job descriptions and activities
        $jobDescriptions = \App\Models\JobDescription::descriptions()->active()->ordered()->get();
        $jobActivities = \App\Models\JobDescription::activities()->active()->ordered()->get();

        // Fetch Business Process Flows
        $businessFlows = \App\Models\BusinessProcessFlow::orderBy('step_order')->get();

        // Default Sections List (Canonical)
        $defaultSections = [
            'hero', 'stats', 'about', 'experience', 'education', 'quote', 
            'tech_stack', 'skills', 'certifications', 'committee_activities', 'career_aspiration',
            'automation_strategy', 'obstacle_challenge', 'job_description', 'company_profile', 
            'organization_structure', 'business_process_flow', 'projects', 'contact', 'social'
        ];

        // Get visible sections
        $visibleSections = $profile->visible_sections ?? $defaultSections;

        // Get section order
        $sectionOrder = $profile->section_order ?? $defaultSections;

        // Ensure completeness of order
        $sectionOrder = array_unique(array_merge($sectionOrder, $defaultSections));

        return view('home', compact(
            'profile', 'categories', 'experiences', 'educations', 'technologies', 
            'featuredProjects', 'allProjects', 'technicalSkills', 'softSkills', 
            'certifications', 'committeeActivities', 'companyProfile', 
            'organizationMembers', 'automationStrategies', 'obstacles', 'challenges', 
            'jobDescriptions', 'jobActivities', 'businessFlows', 'visibleSections', 'sectionOrder'
        ));
    }
}
