@extends('admin.layouts.app')

@section('title', 'Edit Aktivitas Kepanitiaan')

@section('content')
<div class="page-header">
    <div class="page-header-row">
        <div>
            <h1><i class="fas fa-users" style="margin-right: 8px; color: var(--primary);"></i>Edit Aktivitas Kepanitiaan</h1>
            <p>Perbarui data aktivitas kepanitiaan</p>
        </div>
        <div class="page-header-actions">
            <a href="{{ route('admin.committee-activities.index') }}" class="btn btn-outline btn-sm">
                <i class="fas fa-arrow-left"></i> Kembali
            </a>
        </div>
    </div>
</div>

@if($errors->any())
<div class="alert alert-error" style="margin-bottom: 24px;">
    <i class="fas fa-exclamation-circle"></i>
    <div>
        <strong>Terdapat kesalahan:</strong>
        <ul style="margin: 4px 0 0 16px;">
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
</div>
@endif

<form action="{{ route('admin.committee-activities.update', $committee_activity) }}" method="POST" enctype="multipart/form-data">
    @csrf
    @method('PUT')

    {{-- Informasi Dasar --}}
    <div class="form-card" style="margin-bottom: 24px;">
        <div class="form-section">
            <h3><i class="fas fa-info-circle" style="margin-right: 8px; color: var(--primary);"></i>Informasi Dasar</h3>

            <div class="form-row">
                <div class="form-group">
                    <label for="title">Judul Aktivitas (ID) <span style="color: #e53e3e;">*</span></label>
                    <input type="text" id="title" name="title" class="form-control" value="{{ old('title', $committee_activity->title) }}" required placeholder="Contoh: Panitia HUT RI ke-79">
                    @error('title')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="title_en">Judul Aktivitas (EN)</label>
                    <input type="text" id="title_en" name="title_en" class="form-control" value="{{ old('title_en', $committee_activity->title_en) }}" placeholder="English title (optional)">
                    @error('title_en')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="role">Peran / Jabatan (ID) <span style="color: #e53e3e;">*</span></label>
                    <input type="text" id="role" name="role" class="form-control" value="{{ old('role', $committee_activity->role) }}" required placeholder="Contoh: Ketua Panitia">
                    @error('role')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="role_en">Peran / Jabatan (EN)</label>
                    <input type="text" id="role_en" name="role_en" class="form-control" value="{{ old('role_en', $committee_activity->role_en) }}" placeholder="English role (optional)">
                    @error('role_en')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="organization">Organisasi</label>
                    <input type="text" id="organization" name="organization" class="form-control" value="{{ old('organization', $committee_activity->organization) }}" placeholder="Nama organisasi penyelenggara">
                    @error('organization')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="location">Lokasi</label>
                    <input type="text" id="location" name="location" class="form-control" value="{{ old('location', $committee_activity->location) }}" placeholder="Lokasi kegiatan">
                    @error('location')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>
            </div>
        </div>
    </div>

    {{-- Tanggal Kegiatan --}}
    <div class="form-card" style="margin-bottom: 24px;">
        <div class="form-section">
            <h3><i class="fas fa-calendar-alt" style="margin-right: 8px; color: var(--primary);"></i>Tanggal Kegiatan</h3>

            <div class="form-row">
                <div class="form-group">
                    <label for="event_date">Tanggal Mulai</label>
                    <input type="date" id="event_date" name="event_date" class="form-control" value="{{ old('event_date', $committee_activity->event_date?->format('Y-m-d')) }}">
                    @error('event_date')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="end_date">Tanggal Selesai</label>
                    <input type="date" id="end_date" name="end_date" class="form-control" value="{{ old('end_date', $committee_activity->end_date?->format('Y-m-d')) }}">
                    <small class="form-help">Kosongkan jika hanya 1 hari</small>
                    @error('end_date')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>
            </div>
        </div>
    </div>

    {{-- Deskripsi --}}
    <div class="form-card" style="margin-bottom: 24px;">
        <div class="form-section">
            <h3><i class="fas fa-align-left" style="margin-right: 8px; color: var(--primary);"></i>Deskripsi</h3>

            <div class="form-group">
                <label for="description">Deskripsi (ID)</label>
                <textarea id="description" name="description" class="form-control" rows="4" placeholder="Jelaskan kegiatan kepanitiaan...">{{ old('description', $committee_activity->description) }}</textarea>
                @error('description')
                    <small style="color: #e53e3e;">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="description_en">Deskripsi (EN)</label>
                <textarea id="description_en" name="description_en" class="form-control" rows="4" placeholder="Describe the committee activity...">{{ old('description_en', $committee_activity->description_en) }}</textarea>
                @error('description_en')
                    <small style="color: #e53e3e;">{{ $message }}</small>
                @enderror
            </div>
        </div>
    </div>

    {{-- Gambar & Pengaturan --}}
    <div class="form-card" style="margin-bottom: 24px;">
        <div class="form-section">
            <h3><i class="fas fa-image" style="margin-right: 8px; color: var(--primary);"></i>Gambar & Pengaturan</h3>

            <div class="form-row">
                <div class="form-group">
                    <label for="image">Gambar Aktivitas</label>
                    @if(!empty($committee_activity->image_data) || $committee_activity->image)
                        <div style="margin-bottom: 12px; display: inline-block;">
                            @if(!empty($committee_activity->image_data))
                                <img src="/dbimg/committee/image_data/{{ $committee_activity->id }}"
                                    alt="{{ $committee_activity->title }}"
                                    style="width: 180px; height: 120px; object-fit: cover; border-radius: 10px; border: 2px solid var(--border-color); background: var(--bg-primary);">
                            @else
                                <img src="{{ '/media/' . ltrim($committee_activity->image, '/') }}"
                                    alt="{{ $committee_activity->title }}"
                                    style="width: 180px; height: 120px; object-fit: cover; border-radius: 10px; border: 2px solid var(--border-color); background: var(--bg-primary);"
                                    onerror="this.style.display='none'">
                            @endif
                            <div style="margin-top: 6px;">
                                <small style="color: var(--text-secondary);"><i class="fas fa-check-circle" style="color: #48bb78;"></i> Gambar saat ini</small>
                            </div>
                        </div>
                    @else
                        <div style="margin-bottom: 12px; width: 180px; height: 120px; border-radius: 10px; border: 2px dashed var(--border-color); display: flex; align-items: center; justify-content: center; background: var(--bg-primary);">
                            <i class="fas fa-image" style="font-size: 32px; color: var(--text-secondary); opacity: 0.4;"></i>
                        </div>
                    @endif
                    <input type="file" id="image" name="image" class="form-control" accept="image/*">
                    <small class="form-help">Max 2MB (JPEG, PNG, WebP). Kosongkan jika tidak ingin mengubah.</small>
                    @error('image')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="order">Urutan Tampil</label>
                    <input type="number" id="order" name="order" class="form-control" value="{{ old('order', $committee_activity->order) }}" min="0">
                    <small class="form-help">Angka kecil tampil lebih dulu</small>
                    @error('order')
                        <small style="color: #e53e3e;">{{ $message }}</small>
                    @enderror

                    <div style="margin-top: 24px;">
                        <label for="is_active" class="form-check" style="cursor: pointer;">
                            <input type="checkbox" id="is_active" name="is_active" value="1" {{ old('is_active', $committee_activity->is_active) ? 'checked' : '' }}>
                            <span>Aktif ditampilkan di website</span>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Actions --}}
    <div class="form-card">
        <div class="form-actions" style="border-top: none; padding-top: 0;">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Update Aktivitas
            </button>
            <a href="{{ route('admin.committee-activities.index') }}" class="btn btn-outline">
                <i class="fas fa-times"></i> Batal
            </a>
        </div>
    </div>
</form>

@push('styles')
<script>
async function compressCommitteeImage(file, maxBytes = 1200 * 1024) {
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
    const baseName = (file.name || 'committee').replace(/\.[^/.]+$/, '');
    return new File([blob], baseName + '.jpg', { type: 'image/jpeg' });
}

document.getElementById('image')?.addEventListener('change', async function () {
    const file = this.files && this.files[0] ? this.files[0] : null;
    if (!file) return;

    const compressed = await compressCommitteeImage(file);
    if (compressed !== file) {
        const dt = new DataTransfer();
        dt.items.add(compressed);
        this.files = dt.files;
    }
});
</script>
@endpush
@endsection
