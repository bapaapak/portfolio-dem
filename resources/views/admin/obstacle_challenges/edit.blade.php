@extends('admin.layouts.app')

@section('title', 'Edit Obstacle/Challenge')

@section('content')
<div class="mb-6 flex justify-between items-center">
    <div>
        <h1 class="text-2xl font-bold text-gray-800">Edit Obstacle/Challenge</h1>
        <p class="text-gray-600 mt-1">Update the details of your obstacle or challenge.</p>
    </div>
    <a href="{{ route('admin.obstacle-challenges.index') }}" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg transition-colors flex items-center gap-2">
        <i class="fas fa-arrow-left"></i>
        <span>Kembali</span>
    </a>
</div>

<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
    <div class="p-6">
        <form action="{{ route('admin.obstacle-challenges.update', $obstacleChallenge) }}" method="POST">
            @csrf
            @method('PUT')
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div>
                    <label for="type" class="block text-sm font-medium text-gray-700 mb-2">Tipe <span class="text-red-500">*</span></label>
                    <select name="type" id="type" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('type') border-red-500 @enderror" required>
                        <option value="obstacle" {{ old('type', $obstacleChallenge->type) == 'obstacle' ? 'selected' : '' }}>Obstacle</option>
                        <option value="challenge" {{ old('type', $obstacleChallenge->type) == 'challenge' ? 'selected' : '' }}>Challenge</option>
                    </select>
                    @error('type')
                    <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>
                <div>
                    <label for="order" class="block text-sm font-medium text-gray-700 mb-2">Urutan</label>
                    <input type="number" name="order" id="order" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('order') border-red-500 @enderror" value="{{ old('order', $obstacleChallenge->order) }}" min="0">
                    @error('order')
                    <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>
            </div>
            
            <div class="mb-6">
                <label for="title" class="block text-sm font-medium text-gray-700 mb-2">Judul <span class="text-red-500">*</span></label>
                <input type="text" name="title" id="title" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('title') border-red-500 @enderror" value="{{ old('title', $obstacleChallenge->title) }}" required>
                @error('title')
                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                @enderror
            </div>
            
            <div class="mb-6">
                <label for="description" class="block text-sm font-medium text-gray-700 mb-2">Deskripsi</label>
                <textarea name="description" id="description" class="w-full rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow @error('description') border-red-500 @enderror" rows="3">{{ old('description', $obstacleChallenge->description) }}</textarea>
                @error('description')
                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                @enderror
            </div>
            
            <div class="mb-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">Detail Items</label>
                <div id="items-container" class="space-y-3 mb-3">
                    @if($obstacleChallenge->items && count($obstacleChallenge->items) > 0)
                        @foreach($obstacleChallenge->items as $item)
                        <div class="flex items-center gap-2 group">
                            <input type="text" name="items[]" class="flex-1 rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow" value="{{ $item }}" placeholder="Item detail...">
                            <button type="button" class="text-red-500 hover:text-red-700 p-2 opacity-50 hover:opacity-100 transition-opacity" onclick="this.closest('.flex').remove()">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                        @endforeach
                    @else
                        <div class="flex items-center gap-2 group">
                            <input type="text" name="items[]" class="flex-1 rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow" placeholder="Item detail...">
                            <button type="button" class="text-red-500 hover:text-red-700 p-2 opacity-50 hover:opacity-100 transition-opacity" onclick="this.closest('.flex').remove()">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    @endif
                </div>
                <button type="button" class="text-sm text-indigo-600 hover:text-indigo-800 font-medium flex items-center gap-1" onclick="addItem()">
                    <i class="fas fa-plus"></i>
                    <span>Tambah Item</span>
                </button>
            </div>
            
            <div class="mb-8">
                <div class="flex items-center">
                    <input type="checkbox" name="is_active" id="is_active" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-4 h-4" value="1" {{ old('is_active', $obstacleChallenge->is_active) ? 'checked' : '' }}>
                    <label for="is_active" class="ml-2 block text-sm text-gray-900">Aktif</label>
                </div>
            </div>
            
            <div class="flex items-center justify-end border-t border-gray-100 pt-6">
                <a href="{{ route('admin.obstacle-challenges.index') }}" class="mr-3 px-4 py-2 bg-white border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 transition-colors">Batal</a>
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-2 rounded-lg shadow-sm transition-colors flex items-center gap-2">
                    <i class="fas fa-save"></i>
                    <span>Simpan Perubahan</span>
                </button>
            </div>
        </form>
    </div>
</div>

<script>
function addItem() {
    const container = document.getElementById('items-container');
    const div = document.createElement('div');
    div.className = 'flex items-center gap-2 group';
    div.innerHTML = `
        <input type="text" name="items[]" class="flex-1 rounded-lg border-gray-300 bg-white text-gray-900 focus:border-indigo-500 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-shadow" placeholder="Item detail...">
        <button type="button" class="text-red-500 hover:text-red-700 p-2 opacity-50 hover:opacity-100 transition-opacity" onclick="this.closest('.flex').remove()">
            <i class="fas fa-times"></i>
        </button>
    `;
    container.appendChild(div);
}
</script>
@endsection
