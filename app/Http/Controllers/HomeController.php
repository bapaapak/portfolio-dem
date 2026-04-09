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
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class HomeController extends Controller
{
    public function index()
    {
        $payload = $this->loadPayload();

        extract($payload);

        // Default Sections List (Canonical)
        $defaultSections = [
            'hero', 'stats', 'about', 'experience', 'education', 'quote',
            'tech_stack', 'skills', 'certifications', 'committee_activities', 'career_aspiration',
            'automation_strategy', 'obstacle_challenge', 'job_description', 'company_profile',
            'organization_structure', 'business_process_flow', 'projects', 'contact', 'social'
        ];

        // Get visible sections (null-safe for missing profile)
        $visibleSections = ($profile?->visible_sections) ?? $defaultSections;

        // Get section order (null-safe for missing profile)
        $sectionOrder = ($profile?->section_order) ?? $defaultSections;

        // Ensure completeness of order
        $sectionOrder = array_unique(array_merge($sectionOrder, $defaultSections));

        return view('home', compact(
            'profile',
            'categories',
            'experiences',
            'educations',
            'technologies',
            'featuredProjects',
            'allProjects',
            'technicalSkills',
            'softSkills',
            'certifications',
            'committeeActivities',
            'companyProfile',
            'organizationMembers',
            'automationStrategies',
            'obstacles',
            'challenges',
            'jobDescriptions',
            'jobActivities',
            'businessFlows',
            'visibleSections',
            'sectionOrder'
        ));
    }

    private function loadPayload(): array
    {
        try {
            return Cache::remember('home_index_payload_v1', now()->addMinutes(2), function () {
                return $this->fetchAllData();
            });
        } catch (\Throwable $e) {
            Log::error('HomeController cache/load failed: ' . $e->getMessage(), [
                'file' => $e->getFile(),
                'line' => $e->getLine(),
            ]);
            // Clear bad cache entry so next request tries fresh
            Cache::forget('home_index_payload_v1');
            // Attempt a fresh fetch without caching
            try {
                return $this->fetchAllData();
            } catch (\Throwable $e2) {
                Log::error('HomeController fetchAllData failed: ' . $e2->getMessage());
                return $this->emptyPayload();
            }
        }
    }

    private function fetchAllData(): array
    {
        $profile = Profile::first();
        $categories = $this->tryQuery(fn() => Category::all(), collect());

        $experiences = $this->tryQuery(
            fn() => Experience::featured()->orderBy('start_date', 'desc')->get(),
            collect()
        );

        $educations = $this->tryQuery(
            fn() => Education::orderBy('order')->orderBy('start_date', 'desc')->get(),
            collect()
        );

        $technologies = $this->tryQuery(
            fn() => Technology::active()->featured()->orderBy('order')->orderBy('name')->get(),
            collect()
        );

        $featuredProjects = $this->tryQuery(
            fn() => Project::with('category')->published()->featured()->latest()->take(6)->get(),
            collect()
        );

        $allProjects = $featuredProjects;

        $technicalSkills = $this->tryQuery(
            fn() => \App\Models\Skill::where('type', 'technical')->orderBy('order')->get(),
            collect()
        );

        $softSkills = $this->tryQuery(
            fn() => \App\Models\Skill::where('type', 'soft')->orderBy('order')->get(),
            collect()
        );

        $certifications = $this->tryQuery(
            fn() => \App\Models\Certification::orderBy('issued_at', 'desc')->get(),
            collect()
        );

        $committeeActivities = $this->tryQuery(function () {
            return CommitteeActivity::active()
                ->select([
                    'id', 'title', 'title_en', 'role', 'role_en',
                    'description', 'description_en', 'organization',
                    'event_date', 'end_date', 'location', 'image',
                    'order', 'is_active', 'created_at', 'updated_at',
                ])
                ->selectRaw("(image_data IS NOT NULL AND image_data != '') as has_image_data")
                ->orderBy('event_date', 'desc')
                ->orderBy('order')
                ->get()
                ->groupBy(function ($activity) {
                    if ($activity->event_date) {
                        return $activity->event_date->format('Y');
                    }
                    if (preg_match('/\b(20\d{2})\b/', $activity->title, $matches)) {
                        return $matches[1];
                    }
                    return 'Other';
                })
                ->sortBy(fn($items, $key) => is_numeric($key) ? (9999 - (int) $key) : 99999);
        }, collect());

        $companyProfile = $this->tryQuery(fn() => CompanyProfile::first(), null);

        $organizationMembers = $this->tryQuery(
            fn() => OrganizationStructure::topLevel()->active()->with('descendants')->orderBy('order')->get(),
            collect()
        );

        $automationStrategies = $this->tryQuery(function () {
            return AutomationStrategy::active()
                ->orderBy('term_type')->orderBy('category')->orderBy('order')
                ->get()
                ->groupBy('term_type');
        }, collect());

        $obstacles = $this->tryQuery(
            fn() => \App\Models\ObstacleChallenge::obstacles()->active()->ordered()->get(),
            collect()
        );

        $challenges = $this->tryQuery(
            fn() => \App\Models\ObstacleChallenge::challenges()->active()->ordered()->get(),
            collect()
        );

        $jobDescriptions = $this->tryQuery(
            fn() => \App\Models\JobDescription::descriptions()->active()->ordered()->get(),
            collect()
        );

        $jobActivities = $this->tryQuery(function () {
            return \App\Models\JobDescription::activities()->active()->ordered()->get()
                ->groupBy(fn($a) => $a->year_label)
                ->map(fn($items) => $items->sortBy('order')->values());
        }, collect());

        $businessFlows = $this->tryQuery(
            fn() => \App\Models\BusinessProcessFlow::orderBy('step_order')->get(),
            collect()
        );

        return compact(
            'profile', 'categories', 'experiences', 'educations', 'technologies',
            'featuredProjects', 'allProjects', 'technicalSkills', 'softSkills',
            'certifications', 'committeeActivities', 'companyProfile',
            'organizationMembers', 'automationStrategies', 'obstacles', 'challenges',
            'jobDescriptions', 'jobActivities', 'businessFlows'
        );
    }

    private function tryQuery(callable $query, mixed $fallback): mixed
    {
        try {
            return $query();
        } catch (\Throwable $e) {
            Log::warning('HomeController query failed: ' . $e->getMessage());
            return $fallback;
        }
    }

    private function emptyPayload(): array
    {
        $empty = collect();
        return [
            'profile'              => null,
            'categories'           => $empty,
            'experiences'          => $empty,
            'educations'           => $empty,
            'technologies'         => $empty,
            'featuredProjects'     => $empty,
            'allProjects'          => $empty,
            'technicalSkills'      => $empty,
            'softSkills'           => $empty,
            'certifications'       => $empty,
            'committeeActivities'  => $empty,
            'companyProfile'       => null,
            'organizationMembers'  => $empty,
            'automationStrategies' => $empty,
            'obstacles'            => $empty,
            'challenges'           => $empty,
            'jobDescriptions'      => $empty,
            'jobActivities'        => $empty,
            'businessFlows'        => $empty,
        ];
    }
}
