@extends('admin.layouts.app')

@section('title', 'Obstacle & Challenge')

@section('content')
{{-- Page Header --}}
<div class="mb-6 flex flex-col sm:flex-row sm:justify-between sm:items-center gap-4">
    <div>
        <h1 class="text-2xl font-bold text-gray-800">Obstacle & Challenge</h1>
        <p class="text-gray-500 mt-1 text-sm">Kelola hambatan dan tantangan profesional yang pernah Anda hadapi.</p>
    </div>
    <a href="{{ route('admin.obstacle-challenges.create') }}" class="inline-flex items-center gap-2 bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg shadow-sm transition-colors text-sm font-medium">
        <i class="fas fa-plus"></i>
        <span>Tambah Item</span>
    </a>
</div>

{{-- Success Alert --}}
@if(session('success'))
<div x-data="{ show: true }" x-show="show" x-transition class="flex items-start gap-3 bg-green-50 border border-green-200 text-green-800 p-4 mb-6 rounded-lg relative" role="alert">
    <i class="fas fa-check-circle text-green-500 mt-0.5"></i>
    <span class="text-sm font-medium">{{ session('success') }}</span>
    <button @click="show = false" class="absolute top-3 right-3 text-green-400 hover:text-green-600">
        <i class="fas fa-times text-xs"></i>
    </button>
</div>
@endif

{{-- Summary Stats --}}
<div class="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-8">
    <div class="bg-white rounded-xl border border-gray-100 shadow-sm p-5 flex items-center gap-4">
        <div class="bg-red-100 p-3 rounded-xl">
            <i class="fas fa-exclamation-triangle text-red-600 text-lg"></i>
        </div>
        <div>
            <p class="text-xs text-gray-500 uppercase tracking-wider font-medium">Total Obstacles</p>
            <p class="text-2xl font-bold text-gray-800">{{ $obstacles->count() }}</p>
        </div>
    </div>
    <div class="bg-white rounded-xl border border-gray-100 shadow-sm p-5 flex items-center gap-4">
        <div class="bg-yellow-100 p-3 rounded-xl">
            <i class="fas fa-bolt text-yellow-600 text-lg"></i>
        </div>
        <div>
            <p class="text-xs text-gray-500 uppercase tracking-wider font-medium">Total Challenges</p>
            <p class="text-2xl font-bold text-gray-800">{{ $challenges->count() }}</p>
        </div>
    </div>
    <div class="bg-white rounded-xl border border-gray-100 shadow-sm p-5 flex items-center gap-4">
        <div class="bg-green-100 p-3 rounded-xl">
            <i class="fas fa-check-circle text-green-600 text-lg"></i>
        </div>
        <div>
            <p class="text-xs text-gray-500 uppercase tracking-wider font-medium">Total Aktif</p>
            <p class="text-2xl font-bold text-gray-800">{{ $totalActive }}</p>
        </div>
    </div>
</div>

{{-- Obstacles Section --}}
<div class="bg-white rounded-xl shadow-sm border border-gray-100 mb-6 overflow-hidden">
    <div class="flex items-center justify-between px-6 py-4 border-b border-gray-100 bg-gradient-to-r from-red-50 to-orange-50">
        <div class="flex items-center gap-3">
            <div class="bg-red-100 p-2 rounded-lg">
                <i class="fas fa-exclamation-triangle text-red-600"></i>
            </div>
            <div>
                <h2 class="text-base font-bold text-red-800">Obstacles</h2>
                <p class="text-xs text-red-500">Hambatan yang pernah dihadapi</p>
            </div>
        </div>
        <span class="bg-red-100 text-red-700 text-xs font-semibold px-2.5 py-1 rounded-full">{{ $obstacles->count() }} item</span>
    </div>
    
    @if($obstacles->count() > 0)
    <div class="overflow-x-auto">
        <table class="w-full text-left text-sm">
            <thead>
                <tr class="bg-gray-50 text-gray-500 text-xs uppercase tracking-wider border-b border-gray-100">
                    <th class="px-5 py-3 font-semibold w-16 text-center">#</th>
                    <th class="px-5 py-3 font-semibold">Judul</th>
                    <th class="px-5 py-3 font-semibold hidden md:table-cell">Deskripsi</th>
                    <th class="px-5 py-3 font-semibold hidden sm:table-cell w-20 text-center">Items</th>
                    <th class="px-5 py-3 font-semibold w-28 text-center">Status</th>
                    <th class="px-5 py-3 font-semibold w-24 text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @foreach($obstacles as $item)
                <tr class="hover:bg-gray-50/70 transition-colors group">
                    <td class="px-5 py-4 text-center">
                        <span class="inline-flex items-center justify-center w-7 h-7 bg-red-50 text-red-600 rounded-full text-xs font-bold">{{ $item->order ?? '—' }}</span>
                    </td>
                    <td class="px-5 py-4">
                        <div class="font-semibold text-gray-800 leading-tight">{{ $item->title }}</div>
                        @if($item->title_en)
                        <div class="text-xs text-gray-400 mt-0.5 italic">{{ $item->title_en }}</div>
                        @endif
                    </td>
                    <td class="px-5 py-4 hidden md:table-cell">
                        <p class="text-gray-500 text-xs leading-relaxed line-clamp-2">{{ Str::limit($item->description, 80) ?: '—' }}</p>
                    </td>
                    <td class="px-5 py-4 hidden sm:table-cell text-center">
                        @php $itemCount = is_array($item->items) ? count(array_filter($item->items)) : 0; @endphp
                        @if($itemCount > 0)
                        <span class="inline-flex items-center gap-1 text-xs font-medium text-indigo-600 bg-indigo-50 px-2 py-0.5 rounded-full">
                            <i class="fas fa-list-ul text-[10px]"></i> {{ $itemCount }}
                        </span>
                        @else
                        <span class="text-gray-300 text-xs">—</span>
                        @endif
                    </td>
                    <td class="px-5 py-4 text-center">
                        @if($item->is_active)
                        <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-700">
                            <span class="w-1.5 h-1.5 bg-green-500 rounded-full"></span> Aktif
                        </span>
                        @else
                        <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-500">
                            <span class="w-1.5 h-1.5 bg-gray-400 rounded-full"></span> Nonaktif
                        </span>
                        @endif
                    </td>
                    <td class="px-5 py-4 text-right">
                        <div class="flex justify-end items-center gap-1.5">
                            <a href="{{ route('admin.obstacle-challenges.edit', $item) }}" class="inline-flex items-center justify-center w-8 h-8 text-indigo-500 hover:text-white bg-indigo-50 hover:bg-indigo-500 rounded-lg transition-colors" title="Edit">
                                <i class="fas fa-edit text-xs"></i>
                            </a>
                            <form action="{{ route('admin.obstacle-challenges.destroy', $item) }}" method="POST" onsubmit="return confirm('Yakin ingin menghapus item ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="inline-flex items-center justify-center w-8 h-8 text-red-500 hover:text-white bg-red-50 hover:bg-red-500 rounded-lg transition-colors" title="Hapus">
                                    <i class="fas fa-trash text-xs"></i>
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
    <div class="text-center py-14">
        <div class="inline-flex items-center justify-center w-14 h-14 bg-gray-50 rounded-full mb-3 text-gray-300">
            <i class="fas fa-folder-open text-2xl"></i>
        </div>
        <p class="text-gray-400 font-medium text-sm">Belum ada data Obstacle.</p>
        <a href="{{ route('admin.obstacle-challenges.create') }}" class="inline-flex items-center gap-1.5 mt-3 text-sm text-indigo-600 hover:underline">
            <i class="fas fa-plus text-xs"></i> Tambah sekarang
        </a>
    </div>
    @endif
</div>

{{-- Challenges Section --}}
<div class="bg-white rounded-xl shadow-sm border border-gray-100 mb-6 overflow-hidden">
    <div class="flex items-center justify-between px-6 py-4 border-b border-gray-100 bg-gradient-to-r from-yellow-50 to-amber-50">
        <div class="flex items-center gap-3">
            <div class="bg-yellow-100 p-2 rounded-lg">
                <i class="fas fa-bolt text-yellow-600"></i>
            </div>
            <div>
                <h2 class="text-base font-bold text-yellow-800">Challenges</h2>
                <p class="text-xs text-yellow-600">Tantangan yang berhasil diatasi</p>
            </div>
        </div>
        <span class="bg-yellow-100 text-yellow-700 text-xs font-semibold px-2.5 py-1 rounded-full">{{ $challenges->count() }} item</span>
    </div>
    
    @if($challenges->count() > 0)
    <div class="overflow-x-auto">
        <table class="w-full text-left text-sm">
            <thead>
                <tr class="bg-gray-50 text-gray-500 text-xs uppercase tracking-wider border-b border-gray-100">
                    <th class="px-5 py-3 font-semibold w-16 text-center">#</th>
                    <th class="px-5 py-3 font-semibold">Judul</th>
                    <th class="px-5 py-3 font-semibold hidden md:table-cell">Deskripsi</th>
                    <th class="px-5 py-3 font-semibold hidden sm:table-cell w-20 text-center">Items</th>
                    <th class="px-5 py-3 font-semibold w-28 text-center">Status</th>
                    <th class="px-5 py-3 font-semibold w-24 text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-50">
                @foreach($challenges as $item)
                <tr class="hover:bg-gray-50/70 transition-colors group">
                    <td class="px-5 py-4 text-center">
                        <span class="inline-flex items-center justify-center w-7 h-7 bg-yellow-50 text-yellow-600 rounded-full text-xs font-bold">{{ $item->order ?? '—' }}</span>
                    </td>
                    <td class="px-5 py-4">
                        <div class="font-semibold text-gray-800 leading-tight">{{ $item->title }}</div>
                        @if($item->title_en)
                        <div class="text-xs text-gray-400 mt-0.5 italic">{{ $item->title_en }}</div>
                        @endif
                    </td>
                    <td class="px-5 py-4 hidden md:table-cell">
                        <p class="text-gray-500 text-xs leading-relaxed line-clamp-2">{{ Str::limit($item->description, 80) ?: '—' }}</p>
                    </td>
                    <td class="px-5 py-4 hidden sm:table-cell text-center">
                        @php $itemCount = is_array($item->items) ? count(array_filter($item->items)) : 0; @endphp
                        @if($itemCount > 0)
                        <span class="inline-flex items-center gap-1 text-xs font-medium text-indigo-600 bg-indigo-50 px-2 py-0.5 rounded-full">
                            <i class="fas fa-list-ul text-[10px]"></i> {{ $itemCount }}
                        </span>
                        @else
                        <span class="text-gray-300 text-xs">—</span>
                        @endif
                    </td>
                    <td class="px-5 py-4 text-center">
                        @if($item->is_active)
                        <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-700">
                            <span class="w-1.5 h-1.5 bg-green-500 rounded-full"></span> Aktif
                        </span>
                        @else
                        <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-500">
                            <span class="w-1.5 h-1.5 bg-gray-400 rounded-full"></span> Nonaktif
                        </span>
                        @endif
                    </td>
                    <td class="px-5 py-4 text-right">
                        <div class="flex justify-end items-center gap-1.5">
                            <a href="{{ route('admin.obstacle-challenges.edit', $item) }}" class="inline-flex items-center justify-center w-8 h-8 text-indigo-500 hover:text-white bg-indigo-50 hover:bg-indigo-500 rounded-lg transition-colors" title="Edit">
                                <i class="fas fa-edit text-xs"></i>
                            </a>
                            <form action="{{ route('admin.obstacle-challenges.destroy', $item) }}" method="POST" onsubmit="return confirm('Yakin ingin menghapus item ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="inline-flex items-center justify-center w-8 h-8 text-red-500 hover:text-white bg-red-50 hover:bg-red-500 rounded-lg transition-colors" title="Hapus">
                                    <i class="fas fa-trash text-xs"></i>
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
    <div class="text-center py-14">
        <div class="inline-flex items-center justify-center w-14 h-14 bg-gray-50 rounded-full mb-3 text-gray-300">
            <i class="fas fa-folder-open text-2xl"></i>
        </div>
        <p class="text-gray-400 font-medium text-sm">Belum ada data Challenge.</p>
        <a href="{{ route('admin.obstacle-challenges.create') }}" class="inline-flex items-center gap-1.5 mt-3 text-sm text-indigo-600 hover:underline">
            <i class="fas fa-plus text-xs"></i> Tambah sekarang
        </a>
    </div>
    @endif
</div>
@endsection


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
