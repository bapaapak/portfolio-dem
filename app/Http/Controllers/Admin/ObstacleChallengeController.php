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
        
        return view('admin.obstacle_challenges.index', compact('obstacles', 'challenges'));
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
            'description' => 'nullable|string',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
        ]);

        $validated['items'] = array_filter($validated['items'] ?? []);
        $validated['is_active'] = $request->has('is_active');

        ObstacleChallenge::create($validated);

        return redirect()->route('admin.obstacle-challenges.index')
            ->with('success', 'Item berhasil ditambahkan!');
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
            'description' => 'nullable|string',
            'items' => 'nullable|array',
            'items.*' => 'nullable|string',
            'order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
        ]);

        $validated['items'] = array_filter($validated['items'] ?? []);
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
