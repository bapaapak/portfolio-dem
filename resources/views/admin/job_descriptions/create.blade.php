@extends('admin.layouts.app')

@section('title', 'Tambah Job Description/Activity')

@section('content')
<div class="page-header">
    <div class="header-title">
        <h1>Tambah Job Description/Activity</h1>
        <p>Tambahkan job description atau activity job baru.</p>
    </div>
    <div class="header-actions">
        <a href="{{ route('admin.job-descriptions.index') }}" class="btn btn-outline">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
    </div>
</div>

<div class="form-card">
    <form action="{{ route('admin.job-descriptions.store') }}" method="POST">
        @csrf
        
        <div class="form-section">
            <h3 class="form-section-title">Informasi Dasar</h3>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="type">Tipe <span class="text-red-500">*</span></label>
                    <select name="type" id="type" class="form-control @error('type') border-red-500 @enderror" required>
                        <option value="description" {{ old('type') == 'description' ? 'selected' : '' }}>Job Description</option>
                        <option value="activity" {{ old('type') == 'activity' ? 'selected' : '' }}>Activity Job</option>
                    </select>
                    @error('type')
                    <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="order">Urutan</label>
                    <input type="number" name="order" id="order" class="form-control @error('order') border-red-500 @enderror" value="{{ old('order', 0) }}" min="0">
                    @error('order')
                    <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                    @enderror
                </div>
            </div>
            
            <div class="form-group">
                <label for="title">Judul <span class="text-red-500">*</span></label>
                <input type="text" name="title" id="title" class="form-control @error('title') border-red-500 @enderror" value="{{ old('title') }}" required>
                @error('title')
                <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                @enderror
            </div>
            
            <div class="form-group">
                <label for="description">Deskripsi</label>
                <textarea name="description" id="description" class="form-control @error('description') border-red-500 @enderror" rows="3">{{ old('description') }}</textarea>
                @error('description')
                <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                @enderror
            </div>
            
            <div class="form-group">
                <label>Detail Items</label>
                <div id="items-container" class="space-y-2 mb-3">
                    <div class="flex gap-2">
                        <input type="text" name="items[]" class="form-control" placeholder="Item detail...">
                        <button type="button" class="btn btn-danger remove-item" onclick="this.closest('.flex').remove()">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <button type="button" class="btn btn-outline" onclick="addItem()">
                    <i class="fas fa-plus"></i> Tambah Item Detail
                </button>
            </div>
            
            <div class="form-group">
                <label class="form-check flex items-center gap-2 cursor-pointer">
                    <input type="checkbox" name="is_active" id="is_active" class="rounded border-gray-300 text-blue-600 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50" value="1" {{ old('is_active', true) ? 'checked' : '' }}>
                    <span>Aktif</span>
                </label>
            </div>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Simpan
            </button>
            <a href="{{ route('admin.job-descriptions.index') }}" class="btn btn-outline">Batal</a>
        </div>
    </form>
</div>

<script>
function addItem() {
    const container = document.getElementById('items-container');
    const div = document.createElement('div');
    div.className = 'flex gap-2';
    div.innerHTML = `
        <input type="text" name="items[]" class="form-control" placeholder="Item detail...">
        <button type="button" class="btn btn-danger remove-item" onclick="this.closest('.flex').remove()">
            <i class="fas fa-times"></i>
        </button>
    `;
    container.appendChild(div);
}
</script>
@endsection
