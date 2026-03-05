@extends('admin.layouts.app')

@section('title', 'Tambah Aktivitas Kepanitiaan')

@section('content')
<div class="content-header">
    <div class="header-left">
        <a href="{{ route('admin.committee-activities.index') }}" class="back-link">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
        <h1>Tambah Aktivitas</h1>
        <p class="subtitle">Tambahkan aktivitas kepanitiaan baru</p>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <form action="{{ route('admin.committee-activities.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-section">
                <h3 class="section-title">Informasi Dasar</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="title">Judul Aktivitas (ID) <span class="required">*</span></label>
                        <input type="text" id="title" name="title" value="{{ old('title') }}" required placeholder="Contoh: Panitia Pameran Teknologi 2024">
                        @error('title')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="title_en">Judul Aktivitas (EN)</label>
                        <input type="text" id="title_en" name="title_en" value="{{ old('title_en') }}" placeholder="Example: Technology Exhibition Committee 2024">
                        @error('title_en')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="role">Peran/Jabatan (ID) <span class="required">*</span></label>
                        <input type="text" id="role" name="role" value="{{ old('role') }}" required placeholder="Contoh: Ketua Panitia">
                        @error('role')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="role_en">Peran/Jabatan (EN)</label>
                        <input type="text" id="role_en" name="role_en" value="{{ old('role_en') }}" placeholder="Example: Committee Chairman">
                        @error('role_en')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="organization">Organisasi</label>
                        <input type="text" id="organization" name="organization" value="{{ old('organization') }}" placeholder="Contoh: Himpunan Mahasiswa Teknik">
                        @error('organization')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="location">Lokasi</label>
                        <input type="text" id="location" name="location" value="{{ old('location') }}" placeholder="Contoh: Jakarta Convention Center">
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
                        <input type="date" id="event_date" name="event_date" value="{{ old('event_date') }}" class="datepicker">
                        @error('event_date')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="end_date">Tanggal Selesai</label>
                        <input type="date" id="end_date" name="end_date" value="{{ old('end_date') }}" class="datepicker">
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
                    <textarea id="description" name="description" rows="4" placeholder="Deskripsi singkat tentang kegiatan dan tanggung jawab...">{{ old('description') }}</textarea>
                    @error('description')
                        <span class="error-text">{{ $message }}</span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="description_en">Deskripsi (EN)</label>
                    <textarea id="description_en" name="description_en" rows="4" placeholder="Brief description about the activity and responsibilities...">{{ old('description_en') }}</textarea>
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
                        <input type="file" id="image" name="image" accept="image/*">
                        <small class="form-hint">Ukuran max: 2MB. Format: JPG, PNG, GIF</small>
                        @error('image')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="order">Urutan Tampil</label>
                        <input type="number" id="order" name="order" value="{{ old('order', 0) }}" min="0">
                        <small class="form-hint">Angka kecil ditampilkan lebih dulu</small>
                        @error('order')
                            <span class="error-text">{{ $message }}</span>
                        @enderror
                    </div>
                </div>

                <div class="form-group">
                    <label class="checkbox-label">
                        <input type="checkbox" name="is_active" value="1" {{ old('is_active', true) ? 'checked' : '' }}>
                        <span>Aktif</span>
                    </label>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Simpan
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
</style>
@endpush
@endsection
