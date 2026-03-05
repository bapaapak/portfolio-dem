@extends('admin.layouts.app')

@section('title', 'Edit Aktivitas Kepanitiaan')

@section('content')
<div class="content-header">
    <div class="header-left">
        <a href="{{ route('admin.committee-activities.index') }}" class="back-link">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
        <h1>Edit Aktivitas</h1>
        <p class="subtitle">Edit data aktivitas kepanitiaan</p>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <form action="{{ route('admin.committee-activities.update', $committee_activity) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            <div class="form-section">
                <h3 class="section-title">Informasi Dasar</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="title">Judul Aktivitas (ID) <span class="required">*</span></label>
                        <input type="text" id="title" name="title" value="{{ old('title', $committee_activity->title) }}" required>
                        @error('title')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="title_en">Judul Aktivitas (EN)</label>
                        <input type="text" id="title_en" name="title_en" value="{{ old('title_en', $committee_activity->title_en) }}">
                        @error('title_en')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="role">Peran/Jabatan (ID) <span class="required">*</span></label>
                        <input type="text" id="role" name="role" value="{{ old('role', $committee_activity->role) }}" required>
                        @error('role')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="role_en">Peran/Jabatan (EN)</label>
                        <input type="text" id="role_en" name="role_en" value="{{ old('role_en', $committee_activity->role_en) }}">
                        @error('role_en')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="organization">Organisasi</label>
                        <input type="text" id="organization" name="organization" value="{{ old('organization', $committee_activity->organization) }}">
                        @error('organization')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="location">Lokasi</label>
                        <input type="text" id="location" name="location" value="{{ old('location', $committee_activity->location) }}">
                        @error('location')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3 class="section-title">Tanggal Kegiatan</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="event_date">Tanggal Mulai</label>
                        <input type="date" id="event_date" name="event_date" value="{{ old('event_date', $committee_activity->event_date?->format('Y-m-d')) }}" class="datepicker">
                        @error('event_date')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="end_date">Tanggal Selesai</label>
                        <input type="date" id="end_date" name="end_date" value="{{ old('end_date', $committee_activity->end_date?->format('Y-m-d')) }}" class="datepicker">
                        <small class="form-hint">Biarkan kosong jika hanya 1 hari</small>
                        @error('end_date')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3 class="section-title">Deskripsi</h3>
                <div class="form-group">
                    <label for="description">Deskripsi (ID)</label>
                    <textarea id="description" name="description" rows="4">{{ old('description', $committee_activity->description) }}</textarea>
                    @error('description')
                        <span class="error-text">{{ $message }}</span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="description_en">Deskripsi (EN)</label>
                    <textarea id="description_en" name="description_en" rows="4">{{ old('description_en', $committee_activity->description_en) }}</textarea>
                    @error('description_en')
                        <span class="error-text">{{ $message }}</span>
                    @enderror
                </div>
            </div>

            <div class="form-section">
                <h3 class="section-title">Gambar & Pengaturan</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="image">Gambar Aktivitas</label>
                        @if($committee_activity->image)
                            <div class="current-image">
                                <img src="{{ asset('storage/' . $committee_activity->image) }}" alt="{{ $committee_activity->title }}">
                                <small>Gambar saat ini</small>
                            </div>
                        @endif
                        <input type="file" id="image" name="image" accept="image/*">
                        <small class="form-hint">Ukuran max: 2MB. Biarkan kosong jika tidak ingin mengubah.</small>
                        @error('image')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="order">Urutan Tampil</label>
                        <input type="number" id="order" name="order" value="{{ old('order', $committee_activity->order) }}" min="0">
                        <small class="form-hint">Angka kecil ditampilkan lebih dulu</small>
                        @error('order')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <div class="form-group">
                    <label class="checkbox-label">
                        <input type="checkbox" name="is_active" value="1" {{ old('is_active', $committee_activity->is_active) ? 'checked' : '' }}>
                        <span>Aktif</span>
                    </label>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Update
                </button>
                <a href="{{ route('admin.committee-activities.index') }}" class="btn btn-secondary">Batal</a>
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

    .current-image {
        margin-bottom: 10px;
    }

    .current-image img {
        width: 120px;
        height: 80px;
        border-radius: 8px;
        object-fit: cover;
        border: 2px solid #e2e8f0;
    }

    .current-image small {
        display: block;
        color: #718096;
        font-size: 12px;
        margin-top: 4px;
    }
</style>
@endpush
@endsection
