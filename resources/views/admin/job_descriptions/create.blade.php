@extends('admin.layouts.app')

@section('title', 'Tambah Job Description/Activity')

@section('content')
<div class="content-header">
    <div class="header-left">
        <h1>Tambah Job Description/Activity</h1>
        <p class="subtitle">Tambahkan job description atau activity job baru.</p>
    </div>
    <div class="header-actions">
        <a href="{{ route('admin.job-descriptions.index') }}" class="btn btn-outline">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
    </div>
</div>

<div class="form-card">
    <form action="{{ route('admin.job-descriptions.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        
        <div class="form-section">
            <h3 class="form-section-title">Informasi Dasar</h3>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="type">Tipe <span class="text-red-500">*</span></label>
                    <select name="type" id="type" class="form-control @error('type') border-red-500 @enderror" required onchange="toggleYearField(this.value)">
                        <option value="description" {{ old('type') == 'description' ? 'selected' : '' }}>Job Description</option>
                        <option value="activity" {{ old('type') == 'activity' ? 'selected' : '' }}>Activity Job</option>
                    </select>
                    @error('type')
                    <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group" id="year-field" style="display: {{ old('type') == 'activity' ? 'block' : 'none' }}">
                    <label for="year">Tahun Mulai</label>
                    <input type="number" name="year" id="year" class="form-control @error('year') border-red-500 @enderror" value="{{ old('year', date('Y')) }}" min="2000" max="2099">
                    @error('year')
                    <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group" id="year-end-field" style="display: {{ old('type') == 'activity' ? 'block' : 'none' }}">
                    <label for="year_end">Tahun Selesai</label>
                    <div style="display:flex; align-items:center; gap:12px;">
                        <input type="number" name="year_end" id="year_end" class="form-control @error('year_end') border-red-500 @enderror" value="{{ old('year_end') }}" min="2000" max="2099" placeholder="Kosongkan jika masih berlangsung" style="flex:1;">
                        <label style="display:flex;align-items:center;gap:6px;cursor:pointer;white-space:nowrap;font-weight:500;">
                            <input type="checkbox" id="until_now" name="until_now" value="1" onchange="toggleUntilNow(this)" {{ old('until_now') ? 'checked' : '' }} style="width:16px;height:16px;">
                            Sampai Sekarang
                        </label>
                    </div>
                    @error('year_end')
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
                <label for="title">Judul (ID) <span class="text-red-500">*</span></label>
                <input type="text" name="title" id="title" class="form-control @error('title') border-red-500 @enderror" value="{{ old('title') }}" required>
                @error('title')
                <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="title_en">Judul (EN)</label>
                <input type="text" name="title_en" id="title_en" class="form-control @error('title_en') border-red-500 @enderror" value="{{ old('title_en') }}" placeholder="English title (optional)">
                @error('title_en')
                <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                @enderror
            </div>
            
            <div class="form-group">
                <label for="description">Deskripsi (ID)</label>
                <textarea name="description" id="description" class="form-control @error('description') border-red-500 @enderror" rows="3">{{ old('description') }}</textarea>
                @error('description')
                <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="description_en">Deskripsi (EN)</label>
                <textarea name="description_en" id="description_en" class="form-control @error('description_en') border-red-500 @enderror" rows="3" placeholder="English description (optional)">{{ old('description_en') }}</textarea>
                @error('description_en')
                <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                @enderror
            </div>
            
            <div class="form-group">
                <label>Detail Items (ID)</label>
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
                <label>Detail Items (EN)</label>
                <div id="items-en-container" class="space-y-2 mb-3">
                    <div class="flex gap-2">
                        <input type="text" name="items_en[]" class="form-control" placeholder="Item detail (English)...">
                        <button type="button" class="btn btn-danger remove-item" onclick="this.closest('.flex').remove()">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <button type="button" class="btn btn-outline" onclick="addItemEn()">
                    <i class="fas fa-plus"></i> Tambah Item Detail (EN)
                </button>
            </div>
            
            <div class="form-group">
                <label class="form-check flex items-center gap-2 cursor-pointer">
                    <input type="checkbox" name="is_active" id="is_active" class="rounded border-gray-300 text-blue-600 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50" value="1" {{ old('is_active', true) ? 'checked' : '' }}>
                    <span>Aktif</span>
                </label>
            </div>

            <div class="form-group" id="illustration-field" style="display: {{ old('type') == 'activity' ? 'block' : 'none' }}">
                <label>Gambar Ilustrasi</label>
                <input type="file" name="illustration_image" id="illustration_image" class="form-control" accept="image/*">
                <small style="display:block;margin-top:4px;color:#9ca3af;">Format: JPG, PNG, GIF, WebP. Jika file besar, sistem akan kompres otomatis sebelum upload.</small>
                @error('illustration_image')
                <div class="text-sm text-red-500 mt-1">{{ $message }}</div>
                @enderror
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
function toggleYearField(type) {
    const show = type === 'activity';
    document.getElementById('year-field').style.display = show ? 'block' : 'none';
    document.getElementById('year-end-field').style.display = show ? 'block' : 'none';
    document.getElementById('illustration-field').style.display = show ? 'block' : 'none';
}

function toggleUntilNow(checkbox) {
    const yearEndInput = document.getElementById('year_end');
    yearEndInput.disabled = checkbox.checked;
    if (checkbox.checked) yearEndInput.value = '';
}

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

function addItemEn() {
    const container = document.getElementById('items-en-container');
    const div = document.createElement('div');
    div.className = 'flex gap-2';
    div.innerHTML = `
        <input type="text" name="items_en[]" class="form-control" placeholder="Item detail (English)...">
        <button type="button" class="btn btn-danger remove-item" onclick="this.closest('.flex').remove()">
            <i class="fas fa-times"></i>
        </button>
    `;
    container.appendChild(div);
}

async function compressImageFile(file, maxBytes = 1200 * 1024) {
    if (!file || !file.type.startsWith('image/')) return file;
    if (file.size <= maxBytes) return file;

    const dataUrl = await new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.onload = () => resolve(reader.result);
        reader.onerror = reject;
        reader.readAsDataURL(file);
    });

    const img = await new Promise((resolve, reject) => {
        const image = new Image();
        image.onload = () => resolve(image);
        image.onerror = reject;
        image.src = dataUrl;
    });

    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');

    const maxDimension = 1600;
    let width = img.width;
    let height = img.height;
    if (width > maxDimension || height > maxDimension) {
        const ratio = Math.min(maxDimension / width, maxDimension / height);
        width = Math.round(width * ratio);
        height = Math.round(height * ratio);
    }

    canvas.width = width;
    canvas.height = height;
    ctx.drawImage(img, 0, 0, width, height);

    let quality = 0.82;
    let blob = await new Promise((resolve) => canvas.toBlob(resolve, 'image/jpeg', quality));
    while (blob && blob.size > maxBytes && quality > 0.4) {
        quality -= 0.1;
        blob = await new Promise((resolve) => canvas.toBlob(resolve, 'image/jpeg', quality));
    }

    if (!blob) return file;
    const baseName = (file.name || 'illustration').replace(/\.[^/.]+$/, '');
    return new File([blob], baseName + '.jpg', { type: 'image/jpeg' });
}

document.getElementById('illustration_image')?.addEventListener('change', async function () {
    const file = this.files && this.files[0] ? this.files[0] : null;
    if (!file) return;

    const originalSize = file.size;
    const compressed = await compressImageFile(file);

    if (compressed !== file) {
        const dt = new DataTransfer();
        dt.items.add(compressed);
        this.files = dt.files;

        const beforeMB = (originalSize / (1024 * 1024)).toFixed(2);
        const afterMB = (compressed.size / (1024 * 1024)).toFixed(2);
        alert('Gambar dikompres otomatis dari ' + beforeMB + 'MB menjadi ' + afterMB + 'MB agar upload tidak macet di server.');
    }
});
</script>
@endsection
