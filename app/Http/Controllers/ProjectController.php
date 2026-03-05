<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Project;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    // Index method removed as it referenced a missing view and had no route.


    public function show($slug)
    {
        $project = Project::with('category')->where('slug', $slug)->firstOrFail();
        $nextProject = Project::published()
            ->where('id', '!=', $project->id)
            ->inRandomOrder()
            ->first();

        return view('projects.show', compact('project', 'nextProject'));
    }
}
