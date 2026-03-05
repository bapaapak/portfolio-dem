@extends('admin.layouts.app')

@section('title', 'Obstacle & Challenge')

@section('content')
<div class="mb-6 flex justify-between items-center">
    <div>
        <h1 class="text-2xl font-bold text-gray-800">Obstacle & Challenge</h1>
        <p class="text-gray-600 mt-1">Manage your professional obstacles and the challenges you've overcome.</p>
    </div>
    <a href="{{ route('admin.obstacle-challenges.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg shadow-sm transition-colors flex items-center gap-2">
        <i class="fas fa-plus"></i>
        <span>Tambah Item</span>
    </a>
</div>

@if(session('success'))
<div x-data="{ show: true }" x-show="show" class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6 relative rounded-r" role="alert">
    <span class="block sm:inline">{{ session('success') }}</span>
    <button @click="show = false" class="absolute top-0 bottom-0 right-0 px-4 py-3">
        <i class="fas fa-times"></i>
    </button>
</div>
@endif

<!-- Obstacles Section -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 mb-8 overflow-hidden">
    <div class="bg-red-50 px-6 py-4 border-b border-red-100 flex items-center gap-3">
        <div class="bg-red-100 p-2 rounded-lg text-red-600">
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        <h2 class="text-lg font-bold text-red-800">Obstacles</h2>
    </div>
    
    <div class="p-0">
        @if($obstacles->count() > 0)
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-gray-50 text-gray-600 text-sm uppercase tracking-wider border-b border-gray-200">
                        <th class="px-6 py-3 font-semibold w-24">Order</th>
                        <th class="px-6 py-3 font-semibold">Judul & Deskripsi</th>
                        <th class="px-6 py-3 font-semibold w-32">Status</th>
                        <th class="px-6 py-3 font-semibold text-right w-32">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @foreach($obstacles as $item)
                    <tr class="hover:bg-gray-50 transition-colors">
                        <td class="px-6 py-4 text-gray-500 font-medium">
                            #{{ $item->order }}
                        </td>
                        <td class="px-6 py-4">
                            <div class="text-gray-900 font-bold mb-1">{{ $item->title }}</div>
                            <div class="text-gray-600 text-sm leading-relaxed">{{ Str::limit($item->description, 100) }}</div>
                        </td>
                        <td class="px-6 py-4">
                            @if($item->is_active)
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                <span class="w-1.5 h-1.5 bg-green-500 rounded-full mr-1.5"></span>
                                Aktif
                            </span>
                            @else
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800">
                                <span class="w-1.5 h-1.5 bg-gray-500 rounded-full mr-1.5"></span>
                                Nonaktif
                            </span>
                            @endif
                        </td>
                        <td class="px-6 py-4 text-right">
                            <div class="flex justify-end items-center gap-2">
                                <a href="{{ route('admin.obstacle-challenges.edit', $item) }}" class="text-orange-500 hover:text-orange-700 bg-orange-50 hover:bg-orange-100 p-2 rounded-lg transition-colors" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="{{ route('admin.obstacle-challenges.destroy', $item) }}" method="POST" class="d-inline" onsubmit="return confirm('Yakin ingin menghapus item ini?')">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="text-red-500 hover:text-red-700 bg-red-50 hover:bg-red-100 p-2 rounded-lg transition-colors" title="Hapus">
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
        <div class="text-center py-12">
            <div class="bg-gray-50 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-3 text-gray-400">
                <i class="fas fa-folder-open text-2xl"></i>
            </div>
            <p class="text-gray-500 font-medium">Belum ada data Obstacle.</p>
        </div>
        @endif
    </div>
</div>

<!-- Challenges Section -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 mb-8 overflow-hidden">
    <div class="bg-yellow-50 px-6 py-4 border-b border-yellow-100 flex items-center gap-3">
        <div class="bg-yellow-100 p-2 rounded-lg text-yellow-600">
            <i class="fas fa-bolt"></i>
        </div>
        <h2 class="text-lg font-bold text-yellow-800">Challenges</h2>
    </div>
    
    <div class="p-0">
        @if($challenges->count() > 0)
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-gray-50 text-gray-600 text-sm uppercase tracking-wider border-b border-gray-200">
                        <th class="px-6 py-3 font-semibold w-24">Order</th>
                        <th class="px-6 py-3 font-semibold">Judul & Deskripsi</th>
                        <th class="px-6 py-3 font-semibold w-32">Status</th>
                        <th class="px-6 py-3 font-semibold text-right w-32">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @foreach($challenges as $item)
                    <tr class="hover:bg-gray-50 transition-colors">
                        <td class="px-6 py-4 text-gray-500 font-medium">
                            #{{ $item->order }}
                        </td>
                        <td class="px-6 py-4">
                            <div class="text-gray-900 font-bold mb-1">{{ $item->title }}</div>
                            <div class="text-gray-600 text-sm leading-relaxed">{{ Str::limit($item->description, 100) }}</div>
                        </td>
                        <td class="px-6 py-4">
                            @if($item->is_active)
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                <span class="w-1.5 h-1.5 bg-green-500 rounded-full mr-1.5"></span>
                                Aktif
                            </span>
                            @else
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800">
                                <span class="w-1.5 h-1.5 bg-gray-500 rounded-full mr-1.5"></span>
                                Nonaktif
                            </span>
                            @endif
                        </td>
                        <td class="px-6 py-4 text-right">
                            <div class="flex justify-end items-center gap-2">
                                <a href="{{ route('admin.obstacle-challenges.edit', $item) }}" class="text-orange-500 hover:text-orange-700 bg-orange-50 hover:bg-orange-100 p-2 rounded-lg transition-colors" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="{{ route('admin.obstacle-challenges.destroy', $item) }}" method="POST" class="d-inline" onsubmit="return confirm('Yakin ingin menghapus item ini?')">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="text-red-500 hover:text-red-700 bg-red-50 hover:bg-red-100 p-2 rounded-lg transition-colors" title="Hapus">
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
        <div class="text-center py-12">
            <div class="bg-gray-50 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-3 text-gray-400">
                <i class="fas fa-folder-open text-2xl"></i>
            </div>
            <p class="text-gray-500 font-medium">Belum ada data Challenge.</p>
        </div>
        @endif
    </div>
</div>
@endsection
