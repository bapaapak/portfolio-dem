<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ObstacleChallenge;
use Illuminate\Http\Request;

class ObstacleChallengeController extends Controller
{
    public function index()
    {
        $obstacles = ObstacleChallenge::obstacles()->ordered()->get();
        $challenges = ObstacleChallenge::challenges()->ordered()->get();
        $totalActive = ObstacleChallenge::where('is_active', true)->count();
        
        return view('admin.obstacle_challenges.index', compact('obstacles', 'challenges', 'totalActive'));
    }

    public function create()
    {
        return view('admin.obstacle_challenges.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'type' => 'required|in:obstacle,challenge',
            'title' => 'required|string|max:255',
            'title_en' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'description_en' => 'nullable|string',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'items_en' => 'nullable|array',
            'items_en.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
        ]);

        $validated['items'] = array_filter($validated['items'] ?? []);
        $validated['items_en'] = array_filter($validated['items_en'] ?? []);
        $validated['is_active'] = $request->has('is_active');

        ObstacleChallenge::create($validated);

        return redirect()->route('admin.obstacle-challenges.index')
            ->with('success', 'Item berhasil ditambahkan!');
    }

    public function show(ObstacleChallenge $obstacleChallenge)
    {
        return redirect()->route('admin.obstacle-challenges.edit', $obstacleChallenge);
    }

    public function edit(ObstacleChallenge $obstacleChallenge)
    {
        return view('admin.obstacle_challenges.edit', compact('obstacleChallenge'));
    }

    public function update(Request $request, ObstacleChallenge $obstacleChallenge)
    {
        $validated = $request->validate([
            'type' => 'required|in:obstacle,challenge',
            'title' => 'required|string|max:255',
            'title_en' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'description_en' => 'nullable|string',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'items_en' => 'nullable|array',
            'items_en.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
        ]);

        $validated['items'] = array_filter($validated['items'] ?? []);
        $validated['items_en'] = array_filter($validated['items_en'] ?? []);
        $validated['is_active'] = $request->has('is_active');

        $obstacleChallenge->update($validated);

        return redirect()->route('admin.obstacle-challenges.index')
            ->with('success', 'Item berhasil diperbarui!');
    }

    public function destroy(ObstacleChallenge $obstacleChallenge)
    {
        $obstacleChallenge->delete();

        return redirect()->route('admin.obstacle-challenges.index')
            ->with('success', 'Item berhasil dihapus!');
    }
}
