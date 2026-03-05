@extends('admin.layouts.app')

@section('title', 'Edit Strategi')

@section('content')
<div class="content-header">
    <div class="header-left">
        <a href="{{ route('admin.automation-strategies.index') }}" class="back-link">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
        <h1>Edit Strategi</h1>
        <p class="subtitle">Perbarui strategi otomasi & digitalisasi</p>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <form action="{{ route('admin.automation-strategies.update', $automation_strategy) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="form-section">
                <h3 class="section-title">Informasi Strategi</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="term_type">Periode <span class="required">*</span></label>
                        <select id="term_type" name="term_type" required>
                            <option value="short" {{ old('term_type', $automation_strategy->term_type) == 'short' ? 'selected' : '' }}>Short Term Strategy</option>
                            <option value="middle" {{ old('term_type', $automation_strategy->term_type) == 'middle' ? 'selected' : '' }}>Middle Term Strategy</option>
                            <option value="long" {{ old('term_type', $automation_strategy->term_type) == 'long' ? 'selected' : '' }}>Long Term Strategy</option>
                        </select>
                        @error('term_type')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="category">Kategori <span class="required">*</span></label>
                        <select id="category" name="category" required>
                            <option value="manufacturing" {{ old('category', $automation_strategy->category) == 'manufacturing' ? 'selected' : '' }}>Manufacturing</option>
                            <option value="digitalization" {{ old('category', $automation_strategy->category) == 'digitalization' ? 'selected' : '' }}>Digitalization & Automation</option>
                        </select>
                        @error('category')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group full-width">
                        <label for="title">Judul</label>
                        <input type="text" id="title" name="title" value="{{ old('title', $automation_strategy->title) }}" placeholder="Contoh: Develop Plant 1 for AEP, PES & AMRS (Opsional)">
                        @error('title')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3 class="section-title">Item Strategi</h3>
                <p class="form-hint mb-3">Tambahkan item/bullet point untuk strategi ini</p>
                
                <div id="items-container">
                    @php
                        $items = old('items', $automation_strategy->items ?? []);
                    @endphp
                    @if(count($items) > 0)
                        @foreach($items as $item)
                            <div class="item-row">
                                <input type="text" name="items[]" value="{{ $item }}" placeholder="Item strategi...">
                                <button type="button" class="btn btn-sm btn-danger remove-item"><i class="fas fa-times"></i></button>
                            </div>
                        @endforeach
                    @else
                        <div class="item-row">
                            <input type="text" name="items[]" placeholder="Item strategi...">
                            <button type="button" class="btn btn-sm btn-danger remove-item"><i class="fas fa-times"></i></button>
                        </div>
                    @endif
                </div>
                <button type="button" id="add-item" class="btn btn-sm btn-secondary mt-2">
                    <i class="fas fa-plus"></i> Tambah Item
                </button>
            </div>

            <div class="form-section">
                <h3 class="section-title">Pengaturan</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="order">Urutan Tampil</label>
                        <input type="number" id="order" name="order" value="{{ old('order', $automation_strategy->order) }}" min="0">
                        <small class="form-hint">Angka kecil ditampilkan lebih dulu</small>
                        @error('order')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label class="checkbox-label">
                            <input type="checkbox" name="is_active" value="1" {{ old('is_active', $automation_strategy->is_active) ? 'checked' : '' }}>
                            <span>Aktif</span>
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Simpan Perubahan
                </button>
                <a href="{{ route('admin.automation-strategies.index') }}" class="btn btn-secondary">Batal</a>
            </div>
        </form>
    </div>
</div>

@push('styles')
<style>
    .form-section {
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 1px solid #e2e8f0;
    }
    .form-section:last-of-type {
        border-bottom: none;
    }
    .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #2d3748;
        margin-bottom: 16px;
    }
    .form-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
    }
    .full-width {
        grid-column: 1 / -1;
    }
    @media (max-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr;
        }
    }
    .form-hint {
        color: #718096;
        font-size: 12px;
        margin-top: 4px;
        display: block;
    }
    .checkbox-label {
        display: flex;
        align-items: center;
        gap: 8px;
        cursor: pointer;
    }
    .checkbox-label input {
        width: 18px;
        height: 18px;
    }
    .required {
        color: #e53e3e;
    }
    .error-text {
        color: #e53e3e;
        font-size: 12px;
        margin-top: 4px;
        display: block;
    }
    .item-row {
        display: flex;
        gap: 10px;
        margin-bottom: 10px;
    }
    .item-row input {
        flex: 1;
    }
    .mb-3 {
        margin-bottom: 12px;
    }
    .mt-2 {
        margin-top: 8px;
    }
</style>
@endpush

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const container = document.getElementById('items-container');
        const addBtn = document.getElementById('add-item');

        addBtn.addEventListener('click', function() {
            const row = document.createElement('div');
            row.className = 'item-row';
            row.innerHTML = `
                <input type="text" name="items[]" placeholder="Item strategi...">
                <button type="button" class="btn btn-sm btn-danger remove-item"><i class="fas fa-times"></i></button>
            `;
            container.appendChild(row);
        });

        container.addEventListener('click', function(e) {
            if (e.target.closest('.remove-item')) {
                const rows = container.querySelectorAll('.item-row');
                if (rows.length > 1) {
                    e.target.closest('.item-row').remove();
                }
            }
        });
    });
</script>
@endpush
@endsection
