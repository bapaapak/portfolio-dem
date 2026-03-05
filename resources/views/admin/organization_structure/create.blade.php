@extends('admin.layouts.app')

@section('title', 'Tambah Anggota Struktur Organisasi')

@section('content')
<div class="mb-6 flex justify-between items-center">
    <div>
        <h1 class="text-2xl font-bold text-gray-800">Tambah Anggota</h1>
        <p class="text-gray-600 mt-1">Tambahkan anggota baru ke struktur organisasi</p>
    </div>
    <a href="{{ route('admin.organization-structure.index') }}" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg transition-colors flex items-center gap-2">
        <i class="fas fa-arrow-left"></i>
        <span>Kembali</span>
    </a>
</div>

<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
    <div class="p-6">
        <form action="{{ route('admin.organization-structure.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div>
                    <label for="name" class="block text-sm font-medium text-gray-700 mb-2">Nama <span class="text-red-500">*</span></label>
                    <input type="text" id="name" name="name" value="{{ old('name') }}" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('name') border-red-500 @enderror" required>
                    @error('name')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="position" class="block text-sm font-medium text-gray-700 mb-2">Jabatan <span class="text-red-500">*</span></label>
                    <input type="text" id="position" name="position" value="{{ old('position') }}" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('position') border-red-500 @enderror" required>
                    @error('position')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="department" class="block text-sm font-medium text-gray-700 mb-2">Departemen</label>
                    <input type="text" id="department" name="department" value="{{ old('department') }}" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('department') border-red-500 @enderror">
                    @error('department')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="level" class="block text-sm font-medium text-gray-700 mb-2">Level Organisasi <span class="text-red-500">*</span></label>
                    <select id="level" name="level" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('level') border-red-500 @enderror" required>
                        @foreach(\App\Models\OrganizationStructure::LEVELS as $key => $label)
                            <option value="{{ $key }}" {{ old('level') == $key ? 'selected' : '' }}>{{ $label }}</option>
                        @endforeach
                    </select>
                    @error('level')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="parent_id" class="block text-sm font-medium text-gray-700 mb-2">Atasan (Reports To)</label>
                    <select id="parent_id" name="parent_id" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('parent_id') border-red-500 @enderror">
                        <option value="">-- Tidak Ada (Top Level) --</option>
                        @foreach($parents as $parent)
                            <option value="{{ $parent->id }}" {{ old('parent_id') == $parent->id ? 'selected' : '' }}>
                                {{ $parent->name }} - {{ $parent->position }}
                            </option>
                        @endforeach
                    </select>
                    @error('parent_id')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="order" class="block text-sm font-medium text-gray-700 mb-2">Urutan Tampil</label>
                    <input type="number" id="order" name="order" value="{{ old('order', 0) }}" min="0" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('order') border-red-500 @enderror">
                    <p class="mt-1 text-xs text-gray-500">Angka kecil ditampilkan lebih dulu</p>
                    @error('order')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="photo" class="block text-sm font-medium text-gray-700 mb-2">Foto</label>
                    <input type="file" id="photo" name="photo" accept="image/*" class="w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 focus:outline-none file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100">
                    <p class="mt-1 text-xs text-gray-500">Ukuran max: 2MB. Format: JPG, PNG</p>
                    @error('photo')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>
            </div>

            <div class="mb-8">
                <div class="flex items-center">
                    <input type="checkbox" name="is_active" value="1" {{ old('is_active', true) ? 'checked' : '' }} class="rounded border-gray-300 text-indigo-600 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-4 h-4">
                    <label class="ml-2 block text-sm text-gray-900">Aktif</label>
                </div>
            </div>

            <div class="flex items-center justify-end border-t border-gray-100 pt-6">
                <a href="{{ route('admin.organization-structure.index') }}" class="mr-3 px-4 py-2 bg-white border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 transition-colors">Batal</a>
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-2 rounded-lg shadow-sm transition-colors flex items-center gap-2">
                    <i class="fas fa-save"></i>
                    <span>Simpan</span>
                </button>
            </div>
        </form>
    </div>
</div>
@endsection
