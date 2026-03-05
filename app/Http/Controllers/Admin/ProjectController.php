<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ProjectController extends Controller
{
    public function index(Request $request)
    {
        $query = Project::with('category');

        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('title', 'like', "%{$search}%")
                    ->orWhere('client', 'like', "%{$search}%");
            });
        }

        if ($request->filled('category') && $request->category !== 'all') {
            $query->where('category_id', $request->category);
        }

        if ($request->filled('status') && $request->status !== 'all') {
            $query->where('status', $request->status);
        }

        $sortField = $request->get('sort', 'created_at');
        $sortDir = $request->get('dir', 'desc');
        $query->orderBy($sortField, $sortDir);

        $projects = $query->paginate(10);
        $categories = Category::all();

        return view('admin.projects.index', compact('projects', 'categories'));
    }

    public function create()
    {
        $categories = Category::all();
        return view('admin.projects.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'category_id' => 'required|exists:categories,id',
            'client' => 'nullable|string|max:255',
            'role' => 'nullable|string|max:255',
            'timeline' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'challenge' => 'nullable|string',
            'solution' => 'nullable|string',
            'images' => 'nullable|array',
            'images.*' => 'image|max:2048',
            'tags' => 'nullable|string',
            'tools' => 'nullable|string',
            'live_url' => 'nullable|url',
            'code_url' => 'nullable|url',
            'status' => 'required|in:published,draft',
            'featured' => 'nullable|boolean',
        ]);

        $validated['slug'] = Str::slug($validated['title']);
        $validated['tags'] = $request->tags ? array_map('trim', explode(',', $request->tags)) : null;
        $validated['tools'] = $request->tools ? array_map('trim', explode(',', $request->tools)) : null;
        $validated['featured'] = $request->has('featured');

        if ($request->hasFile('images')) {
            $imagesPaths = [];
            foreach ($request->file('images') as $index => $file) {
                $path = $file->store('projects', 'public');
                $imagesPaths[] = $path;

                // Set the first uploaded new image as the main thumbnail
                if ($index === 0) {
                    $validated['thumbnail'] = $path;
                }
            }
            $validated['images'] = $imagesPaths;
        }

        Project::create($validated);

        return redirect()->route('admin.projects.index')->with('success', 'Proyek berhasil ditambahkan!');
    }

    public function edit(Project $project)
    {
        $categories = Category::all();
        return view('admin.projects.edit', compact('project', 'categories'));
    }

    public function update(Request $request, Project $project)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'category_id' => 'required|exists:categories,id',
            'client' => 'nullable|string|max:255',
            'role' => 'nullable|string|max:255',
            'timeline' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'challenge' => 'nullable|string',
            'solution' => 'nullable|string',
            'images' => 'nullable|array',
            'images.*' => 'image|max:2048',
            'existing_images' => 'nullable|array',
            'existing_images.*' => 'string',
            'tags' => 'nullable|string',
            'tools' => 'nullable|string',
            'live_url' => 'nullable|url',
            'code_url' => 'nullable|url',
            'status' => 'required|in:published,draft',
            'featured' => 'nullable|boolean',
        ]);

        $validated['slug'] = Str::slug($validated['title']);
        $validated['tags'] = $request->tags ? array_map('trim', explode(',', $request->tags)) : null;
        $validated['tools'] = $request->tools ? array_map('trim', explode(',', $request->tools)) : null;
        $validated['featured'] = $request->has('featured');

        $existingImagesPassed = $request->input('existing_images', []);

        $oldImages = $project->images ?: [];
        if ($project->thumbnail && !in_array($project->thumbnail, $oldImages)) {
            $oldImages[] = $project->thumbnail;
        }

        foreach ($oldImages as $oldImg) {
            if (!in_array($oldImg, $existingImagesPassed)) {
                Storage::disk('public')->delete($oldImg);
            }
        }

        $imagesPaths = $existingImagesPassed;

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $file) {
                $path = $file->store('projects', 'public');
                $imagesPaths[] = $path;
            }
        }

        if (count($imagesPaths) > 0) {
            $validated['thumbnail'] = $imagesPaths[0];
            $validated['images'] = $imagesPaths;
        } else {
            $validated['thumbnail'] = null;
            $validated['images'] = null;
        }

        unset($validated['existing_images']);

        $project->update($validated);

        return redirect()->route('admin.projects.index')->with('success', 'Proyek berhasil diperbarui!');
    }

    public function destroy(Project $project)
    {
        if ($project->thumbnail) {
            Storage::disk('public')->delete($project->thumbnail);
        }
        if (!empty($project->images)) {
            foreach ($project->images as $image) {
                Storage::disk('public')->delete($image);
            }
        }

        $project->delete();

        return redirect()->route('admin.projects.index')->with('success', 'Proyek berhasil dihapus!');
    }
}
