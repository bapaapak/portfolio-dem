<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\OrganizationStructure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class OrganizationStructureController extends Controller
{
    public function index()
    {
        $members = OrganizationStructure::with('parent')
            ->orderBy('order')
            ->orderBy('name')
            ->get();
        
        $topLevelMembers = OrganizationStructure::topLevel()
            ->with('descendants')
            ->orderBy('order')
            ->get();
        
        // Group members by level for level-based chart display
        $levelOrder = array_keys(OrganizationStructure::LEVELS);
        $membersByLevel = OrganizationStructure::with('parent')
            ->active()
            ->orderBy('order')
            ->orderBy('name')
            ->get()
            ->groupBy('level')
            ->sortBy(function ($members, $level) use ($levelOrder) {
                return array_search($level, $levelOrder);
            });
        
        return view('admin.organization_structure.index', compact('members', 'topLevelMembers', 'membersByLevel'));
    }

    public function create()
    {
        $parents = OrganizationStructure::orderBy('name')->get();
        return view('admin.organization_structure.create', compact('parents'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'position' => 'required|string|max:255',
            'department' => 'nullable|string|max:255',
            'level' => 'required|string|in:' . implode(',', array_keys(OrganizationStructure::LEVELS)),
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'parent_id' => 'nullable|exists:organization_structures,id',
            'order' => 'nullable|integer',
            'is_active' => 'boolean',
        ]);

        if ($request->hasFile('photo')) {
            $validated['photo'] = $request->file('photo')->store('organization', 'public');
        }

        $validated['is_active'] = $request->has('is_active');
        $validated['order'] = $validated['order'] ?? 0;

        OrganizationStructure::create($validated);

        return redirect()->route('admin.organization-structure.index')
            ->with('success', 'Anggota struktur organisasi berhasil ditambahkan!');
    }

    public function edit(OrganizationStructure $organization_structure)
    {
        $parents = OrganizationStructure::where('id', '!=', $organization_structure->id)
            ->orderBy('name')
            ->get();
        
        return view('admin.organization_structure.edit', compact('organization_structure', 'parents'));
    }

    public function update(Request $request, OrganizationStructure $organization_structure)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'position' => 'required|string|max:255',
            'department' => 'nullable|string|max:255',
            'level' => 'required|string|in:' . implode(',', array_keys(OrganizationStructure::LEVELS)),
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'parent_id' => 'nullable|exists:organization_structures,id',
            'order' => 'nullable|integer',
            'is_active' => 'boolean',
        ]);

        if ($request->hasFile('photo')) {
            // Delete old photo
            if ($organization_structure->photo) {
                Storage::disk('public')->delete($organization_structure->photo);
            }
            $validated['photo'] = $request->file('photo')->store('organization', 'public');
        }

        $validated['is_active'] = $request->has('is_active');
        $validated['order'] = $validated['order'] ?? 0;

        $organization_structure->update($validated);

        return redirect()->route('admin.organization-structure.index')
            ->with('success', 'Anggota struktur organisasi berhasil diperbarui!');
    }

    public function destroy(OrganizationStructure $organization_structure)
    {
        // Delete photo if exists
        if ($organization_structure->photo) {
            Storage::disk('public')->delete($organization_structure->photo);
        }

        $organization_structure->delete();

        return redirect()->route('admin.organization-structure.index')
            ->with('success', 'Anggota struktur organisasi berhasil dihapus!');
    }
}
