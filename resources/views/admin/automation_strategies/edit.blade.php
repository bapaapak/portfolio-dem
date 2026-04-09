@extends('admin.layouts.app')

@section('title', 'Edit Strategi')

@section('content')
<div class="content-header">
    <div class="header-left">
        <h1>Edit Strategi</h1>
        <p class="subtitle">Perbarui strategi otomasi & digitalisasi</p>
    </div>
    <div class="header-actions">
        <a href="{{ route('admin.automation-strategies.index') }}" class="btn btn-outline">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
    </div>
</div>

<div class="form-card">
    <form action="{{ route('admin.automation-strategies.update', $automation_strategy) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="form-section">
            <h3 class="form-section-title">Informasi Strategi</h3>

            <div class="form-row">
                <div class="form-group">
                    <label for="term_type">Periode <span class="text-red-500">*</span></label>
                    <select id="term_type" name="term_type" class="form-control" required>
                        <option value="short" {{ old('term_type', $automation_strategy->term_type) == 'short' ? 'selected' : '' }}>Short Term Strategy</option>
                        <option value="middle" {{ old('term_type', $automation_strategy->term_type) == 'middle' ? 'selected' : '' }}>Middle Term Strategy</option>
                        <option value="long" {{ old('term_type', $automation_strategy->term_type) == 'long' ? 'selected' : '' }}>Long Term Strategy</option>
                    </select>
                    @error('term_type')
                    <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="category">Kategori <span class="text-red-500">*</span></label>
                    <select id="category" name="category" class="form-control" required>
                        <option value="manufacturing" {{ old('category', $automation_strategy->category) == 'manufacturing' ? 'selected' : '' }}>Manufacturing</option>
                        <option value="digitalization" {{ old('category', $automation_strategy->category) == 'digitalization' ? 'selected' : '' }}>Digitalization & Automation</option>
                    </select>
                    @error('category')
                    <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                    @enderror
                </div>
            </div>

            <div class="form-group">
                <label for="title">Judul</label>
                <input type="text" id="title" name="title" class="form-control" value="{{ old('title', $automation_strategy->title) }}" placeholder="Contoh: Develop Plant 1 for AEP, PES & AMRS (opsional)">
                @error('title')
                <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                @enderror
            </div>
        </div>

        <div class="form-section">
            <h3 class="form-section-title">Item Strategi</h3>
            <p style="color:#9ca3af;font-size:0.85rem;margin-bottom:12px;">Tambahkan item/bullet point untuk strategi ini</p>

            <div id="items-container">
                @php $items = old('items', $automation_strategy->items ?? []); @endphp
                @if(count($items) > 0)
                    @foreach($items as $item)
                    <div class="flex gap-2" style="margin-bottom:8px;">
                        <input type="text" name="items[]" class="form-control" value="{{ $item }}" placeholder="Item strategi...">
                        <button type="button" class="btn btn-danger btn-sm remove-item" onclick="this.closest('.flex').remove()">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    @endforeach
                @else
                    <div class="flex gap-2" style="margin-bottom:8px;">
                        <input type="text" name="items[]" class="form-control" placeholder="Item strategi...">
                        <button type="button" class="btn btn-danger btn-sm remove-item" onclick="if(document.querySelectorAll('#items-container .flex').length > 1) this.closest('.flex').remove()">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                @endif
            </div>
            <button type="button" id="add-item" class="btn btn-sm btn-secondary" style="margin-top:4px;">
                <i class="fas fa-plus"></i> Tambah Item
            </button>
        </div>

        <div class="form-section">
            <h3 class="form-section-title">Pengaturan</h3>

            <div class="form-row">
                <div class="form-group">
                    <label for="order">Urutan Tampil</label>
                    <input type="number" id="order" name="order" class="form-control" value="{{ old('order', $automation_strategy->order) }}" min="0">
                    <small style="color:#9ca3af;font-size:0.75rem;">Angka kecil ditampilkan lebih dulu</small>
                    @error('order')
                    <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                    @enderror
                </div>

                <div class="form-group" style="display:flex;align-items:center;padding-top:28px;">
                    <label style="display:flex;align-items:center;gap:8px;cursor:pointer;font-weight:500;">
                        <input type="checkbox" name="is_active" value="1" {{ old('is_active', $automation_strategy->is_active) ? 'checked' : '' }} style="width:18px;height:18px;">
                        Aktif
                    </label>
                </div>
            </div>
        </div>

        <div class="form-actions" style="display:flex;gap:12px;padding-top:8px;">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Simpan Perubahan
            </button>
            <a href="{{ route('admin.automation-strategies.index') }}" class="btn btn-outline">Batal</a>
        </div>
    </form>
</div>

@push('scripts')
<script>
var strategyMap = @json($strategyMap);
var currentId = {{ $automation_strategy->id }};

function navigateToStrategy() {
    var term = document.getElementById('term_type').value;
    var cat = document.getElementById('category').value;
    if (strategyMap[term] && strategyMap[term][cat]) {
        var targetId = strategyMap[term][cat];
        if (targetId !== currentId) {
            window.location.href = '/admin/automation-strategies/' + targetId + '/edit';
        }
    }
}

document.getElementById('term_type').addEventListener('change', navigateToStrategy);
document.getElementById('category').addEventListener('change', navigateToStrategy);

document.getElementById('add-item').addEventListener('click', function() {
    const container = document.getElementById('items-container');
    const div = document.createElement('div');
    div.className = 'flex gap-2';
    div.style.marginBottom = '8px';
    div.innerHTML = `
        <input type="text" name="items[]" class="form-control" placeholder="Item strategi...">
        <button type="button" class="btn btn-danger btn-sm remove-item" onclick="this.closest('.flex').remove()">
            <i class="fas fa-times"></i>
        </button>
    `;
    container.appendChild(div);
    div.querySelector('input').focus();
});
</script>
@endpush
@endsection
