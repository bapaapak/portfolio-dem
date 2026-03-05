@extends('admin.layouts.app')

@section('title', 'Struktur Organisasi')

@section('content')
<div class="mb-6 flex justify-between items-center">
    <div>
        <h1 class="text-2xl font-bold text-gray-800">Struktur Organisasi</h1>
        <p class="text-gray-600 mt-1">Kelola struktur organisasi perusahaan</p>
    </div>
    <a href="{{ route('admin.organization-structure.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg shadow-sm transition-colors flex items-center gap-2">
        <i class="fas fa-plus"></i>
        <span>Tambah Anggota</span>
    </a>
</div>

{{-- Organization Chart Preview with Tree Hierarchy --}}
@if($topLevelMembers->count() > 0)
<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden mb-6">
    <div class="px-6 py-4 border-b border-gray-100 bg-gray-50/50">
        <h3 class="text-lg font-semibold text-gray-800 flex items-center gap-2">
            <i class="fas fa-sitemap text-indigo-600"></i>
            <span>Preview Struktur Organisasi</span>
        </h3>
    </div>
    <div class="p-6 overflow-x-auto bg-gray-50 bg-opacity-30">
        @php
            $levelColors = [
                'board_of_director' => 'bg-gradient-to-r from-indigo-600 to-purple-600',
                'division' => 'bg-gradient-to-r from-blue-500 to-indigo-500',
                'department' => 'bg-gradient-to-r from-teal-500 to-blue-500',
                'section' => 'bg-gradient-to-r from-green-500 to-teal-500',
                'staff' => 'bg-gradient-to-r from-amber-500 to-orange-500',
                'admin' => 'bg-gradient-to-r from-gray-500 to-gray-600',
            ];
            $levelBorderColors = [
                'board_of_director' => 'border-indigo-300 bg-indigo-50',
                'division' => 'border-blue-300 bg-blue-50',
                'department' => 'border-teal-300 bg-teal-50',
                'section' => 'border-green-300 bg-green-50',
                'staff' => 'border-amber-300 bg-amber-50',
                'admin' => 'border-gray-400 bg-gray-100',
            ];
        @endphp
        <div class="tree min-w-max mx-auto py-8">
            <ul class="flex justify-center">
                @foreach($topLevelMembers as $member)
                    @include('admin.organization_structure.partials.tree-node-hierarchy', [
                        'member' => $member, 
                        'levelColors' => $levelColors, 
                        'levelBorderColors' => $levelBorderColors
                    ])
                @endforeach
            </ul>
        </div>
    </div>
</div>
@endif

{{-- Members Table --}}
<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
    <div class="px-6 py-4 border-b border-gray-100 bg-gray-50/50">
        <h3 class="text-lg font-semibold text-gray-800 flex items-center gap-2">
            <i class="fas fa-users text-indigo-600"></i>
            <span>Daftar Anggota</span>
        </h3>
    </div>
    <div class="p-0">
        @if($members->count() > 0)
        <div class="overflow-x-auto">
            <table class="w-full text-left">
                <thead>
                    <tr class="bg-gray-50 border-b border-gray-100 text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        <th class="px-6 py-3">Foto</th>
                        <th class="px-6 py-3">Nama</th>
                        <th class="px-6 py-3">Jabatan</th>
                        <th class="px-6 py-3">Departemen</th>
                        <th class="px-6 py-3">Level</th>
                        <th class="px-6 py-3">Atasan</th>
                        <th class="px-6 py-3">Urutan</th>
                        <th class="px-6 py-3">Status</th>
                        <th class="px-6 py-3 text-right">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @foreach($members as $member)
                    <tr class="hover:bg-gray-50 transition-colors">
                        <td class="px-6 py-4 whitespace-nowrap">
                            @if($member->photo)
                                <img src="{{ asset('storage/' . $member->photo) }}" alt="{{ $member->name }}" class="w-10 h-10 rounded-full object-cover border border-gray-200">
                            @else
                                <div class="w-10 h-10 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-500">
                                    <i class="fas fa-user"></i>
                                </div>
                            @endif
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="font-medium text-gray-900">{{ $member->name }}</span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-gray-600">{{ $member->position }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-gray-600">{{ $member->department ?? '-' }}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="px-2.5 py-0.5 rounded-full text-xs font-medium bg-indigo-100 text-indigo-800 border border-indigo-200">
                                {{ \App\Models\OrganizationStructure::LEVELS[$member->level] ?? $member->level }}
                            </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-gray-600">{{ $member->parent?->name ?? '-' }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-gray-600 font-mono">{{ $member->order }}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            @if($member->is_active)
                                <span class="px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800 border border-green-200">Aktif</span>
                            @else
                                <span class="px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800 border border-gray-200">Nonaktif</span>
                            @endif
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <div class="flex items-center justify-end gap-2">
                                <a href="{{ route('admin.organization-structure.edit', $member) }}" class="p-2 text-indigo-600 hover:bg-indigo-50 rounded-lg transition-colors" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="{{ route('admin.organization-structure.destroy', $member) }}" method="POST" class="inline-block" onsubmit="return confirm('Yakin ingin menghapus anggota ini?')">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="p-2 text-red-600 hover:bg-red-50 rounded-lg transition-colors" title="Hapus">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        @else
        <div class="flex flex-col items-center justify-center py-12 text-center">
            <div class="w-16 h-16 bg-indigo-50 rounded-full flex items-center justify-center mb-4">
                <i class="fas fa-sitemap text-2xl text-indigo-500"></i>
            </div>
            <h3 class="text-lg font-medium text-gray-900">Belum ada anggota</h3>
            <p class="text-gray-500 mt-1 mb-6">Mulai dengan menambahkan anggota struktur organisasi.</p>
            <a href="{{ route('admin.organization-structure.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg shadow-sm transition-colors flex items-center gap-2">
                <i class="fas fa-plus"></i>
                <span>Tambah Anggota Pertama</span>
            </a>
        </div>
        @endif
    </div>
</div>

@push('styles')
<style>
/* CSS Tree for Organization Chart */
.tree ul {
    padding-top: 20px;
    position: relative;
    display: flex;
    justify-content: center;
}

.tree li {
    text-align: center;
    list-style-type: none;
    position: relative;
    padding: 20px 2px 0 2px; /* Rapat seperti di home */
    display: flex;
    flex-direction: column;
    align-items: center;
}

/* Connectors */
.tree li::before, .tree li::after {
    content: '';
    position: absolute; top: 0; right: 50%;
    border-top: 2px solid #cbd5e1;
    width: 50%; height: 20px;
}
.tree li::after {
    right: auto; left: 50%;
    border-left: 2px solid #cbd5e1;
}

/* Remove connectors from single/first/last */
.tree li:only-child::after, .tree li:only-child::before {
    display: none;
}
.tree li:only-child {
    padding-top: 0;
}

/* FIX: Deep Drop Single Child needs the vertical line */
.tree li.deep-drop:only-child {
    padding-top: 150px !important; 
}
.tree li.deep-drop:only-child::after {
    display: block !important;
    border-top: none;
    height: 150px !important;
}

.tree li:first-child::before, .tree li:last-child::after {
    border: 0 none;
}

/* Add back the vertical connector for the first and last nodes */
.tree li:last-child::before {
    border-right: 2px solid #cbd5e1;
    border-radius: 0 5px 0 0;
}
.tree li:first-child::after {
    border-radius: 5px 0 0 0;
}

/* Downward connector from parent to children */
.tree ul ul::before {
    content: '';
    position: absolute; top: 0; left: 50%;
    border-left: 2px solid #cbd5e1;
    width: 0; height: 20px;
}

/* Deep Drop & Flex adjustments */
.tree li.deep-drop {
    padding-top: 150px !important;
}
.tree li.deep-drop::before, 
.tree li.deep-drop::after {
    height: 150px !important;
}

/* ========== ORG CARD STYLES (matching frontend) ========== */
.org-card {
    background: linear-gradient(145deg, #eef2ff 0%, #e0e7ff 100%);
    border-radius: 16px;
    box-shadow: 0 4px 6px -1px rgba(79, 70, 229, 0.12), 0 0 0 2px rgba(79, 70, 229, 0.15);
    overflow: hidden;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    padding: 12px 8px;
}
.org-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px -4px rgba(79, 70, 229, 0.15), 0 0 0 2px rgba(79, 70, 229, 0.2);
}
.org-card .org-card-accent {
    background: #6366f1;
}
.org-card .org-avatar-icon {
    background: linear-gradient(135deg, #c7d2fe 0%, #a5b4fc 100%);
    color: #4338ca;
    box-shadow: 0 4px 12px rgba(67, 56, 202, 0.25);
}
.org-card .org-position-badge {
    color: #92400e;
    background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
    border-color: rgba(234, 179, 8, 0.3);
}

/* Tubagus Imran green highlight */
.tree li[data-member-name*="Tubagus" i] > .org-card {
    background: linear-gradient(145deg, #f0fdf4 0%, #dcfce7 100%) !important;
    box-shadow: 0 4px 6px -1px rgba(34, 197, 94, 0.1), 0 0 0 2px rgba(34, 197, 94, 0.2) !important;
}
.tree li[data-member-name*="Tubagus" i] > .org-card .org-card-accent {
    background: linear-gradient(90deg, #22c55e, #16a34a, #15803d) !important;
}
.tree li[data-member-name*="Tubagus" i] > .org-card .org-avatar-icon {
    background: linear-gradient(135deg, #bbf7d0 0%, #86efac 100%) !important;
    color: #16a34a !important;
    box-shadow: 0 4px 12px rgba(34, 197, 94, 0.2) !important;
}
.tree li[data-member-name*="Tubagus" i] > .org-card .org-position-badge {
    color: #92400e !important;
    background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%) !important;
    border-color: rgba(234, 179, 8, 0.3) !important;
}
</style>
@endpush
@endsection
