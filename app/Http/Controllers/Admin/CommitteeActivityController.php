<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CommitteeActivity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CommitteeActivityController extends Controller
{
    public function index()
    {
        $activities = CommitteeActivity::orderBy('order')
            ->orderBy('event_date', 'desc')
            ->get();
        
        return view('admin.committee_activities.index', compact('activities'));
    }

    public function create()
    {
        return view('admin.committee_activities.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'title_en' => 'nullable|string|max:255',
            'role' => 'required|string|max:255',
            'role_en' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'description_en' => 'nullable|string',
            'organization' => 'nullable|string|max:255',
            'event_date' => 'nullable|date',
            'end_date' => 'nullable|date|after_or_equal:event_date',
            'location' => 'nullable|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'order' => 'nullable|integer',
            'is_active' => 'boolean',
        ]);

        if ($request->hasFile('image')) {
            $validated['image'] = $request->file('image')->store('committee', 'public');
        }

        $validated['is_active'] = $request->has('is_active');
        $validated['order'] = $validated['order'] ?? 0;

        CommitteeActivity::create($validated);

        return redirect()->route('admin.committee-activities.index')
            ->with('success', 'Aktivitas kepanitiaan berhasil ditambahkan!');
    }

    public function edit(CommitteeActivity $committee_activity)
    {
        return view('admin.committee_activities.edit', compact('committee_activity'));
    }

    public function update(Request $request, CommitteeActivity $committee_activity)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'title_en' => 'nullable|string|max:255',
            'role' => 'required|string|max:255',
            'role_en' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'description_en' => 'nullable|string',
            'organization' => 'nullable|string|max:255',
            'event_date' => 'nullable|date',
            'end_date' => 'nullable|date|after_or_equal:event_date',
            'location' => 'nullable|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'order' => 'nullable|integer',
            'is_active' => 'boolean',
        ]);

        if ($request->hasFile('image')) {
            // Delete old image
            if ($committee_activity->image) {
                Storage::disk('public')->delete($committee_activity->image);
            }
            $validated['image'] = $request->file('image')->store('committee', 'public');
        }

        $validated['is_active'] = $request->has('is_active');
        $validated['order'] = $validated['order'] ?? 0;

        $committee_activity->update($validated);

        return redirect()->route('admin.committee-activities.index')
            ->with('success', 'Aktivitas kepanitiaan berhasil diperbarui!');
    }

    public function destroy(CommitteeActivity $committee_activity)
    {
        // Delete image if exists
        if ($committee_activity->image) {
            Storage::disk('public')->delete($committee_activity->image);
        }

        $committee_activity->delete();

        return redirect()->route('admin.committee-activities.index')
            ->with('success', 'Aktivitas kepanitiaan berhasil dihapus!');
    }
}
