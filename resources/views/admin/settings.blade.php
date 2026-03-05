@extends('admin.layouts.app')

@section('title', 'Pengaturan')

@section('content')
<div class="page-header">
    <h1>Pengaturan Profil</h1>
    <p>Kelola informasi profil dan pengaturan website</p>
</div>

<div class="settings-grid">
    <div class="form-card">
        <form action="{{ route('admin.settings.update') }}" method="POST">
            @csrf
            @method('PUT')
            
            <div class="form-section">
                <h3>Informasi Pribadi</h3>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="name">Nama Lengkap *</label>
                        <input type="text" id="name" name="name" class="form-control" value="{{ old('name', $profile->name ?? '') }}" required>
                    </div>
                    <div class="form-group">
                        <label for="website_title">Judul Website</label>
                        <input type="text" id="website_title" name="website_title" class="form-control" value="{{ old('website_title', $profile->website_title ?? '') }}" placeholder="Tubagus | Portofolio">
                    </div>
                    <div class="form-group">
                        <label for="title">Jabatan / Title (Pisahkan koma untuk animasi)</label>
                        <input type="text" id="title" name="title" class="form-control" value="{{ old('title', $profile->title ?? '') }}" placeholder="Developer, Designer">
                    </div>
                </div>

                <div class="form-group">
                    <label for="bio">Bio Singkat (EN)</label>
                    <textarea id="bio" name="bio" class="form-control" rows="3" placeholder="Short description about you...">{{ old('bio', $profile->bio ?? '') }}</textarea>
                </div>

                <div class="form-group">
                    <label for="bio_id">Bio Singkat (ID)</label>
                    <textarea id="bio_id" name="bio_id" class="form-control" rows="3" placeholder="Deskripsi singkat tentang Anda...">{{ old('bio_id', $profile->bio_id ?? '') }}</textarea>
                </div>

                <div class="form-group">
                    <label for="story">Cerita Saya</label>
                    <textarea id="story" name="story" class="form-control" rows="4" placeholder="Perjalanan karir Anda...">{{ old('story', $profile->story ?? '') }}</textarea>
                </div>
            </div>

            <div class="form-section">
                <h3>Informasi Kontak</h3>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" class="form-control" value="{{ old('email', $profile->email ?? '') }}">
                    </div>
                    <div class="form-group">
                        <label for="phone">Nomor Telepon</label>
                        <input type="text" id="phone" name="phone" class="form-control" value="{{ old('phone', $profile->phone ?? '') }}">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="whatsapp">WhatsApp (tanpa +)</label>
                        <input type="text" id="whatsapp" name="whatsapp" class="form-control" value="{{ old('whatsapp', $profile->whatsapp ?? '') }}" placeholder="6281234567890">
                    </div>
                    <div class="form-group">
                        <label for="location">Lokasi</label>
                        <input type="text" id="location" name="location" class="form-control" value="{{ old('location', $profile->location ?? '') }}" placeholder="Jakarta, Indonesia">
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3>Social Media</h3>
                <div class="form-row">
                    <div class="form-group">
                        <label for="linkedin">LinkedIn URL</label>
                        <input type="url" id="linkedin" name="social_links[linkedin]" class="form-control" value="{{ old('social_links.linkedin', $profile->social_links['linkedin'] ?? '') }}" placeholder="https://linkedin.com/in/username">
                    </div>
                    <div class="form-group">
                        <label for="github">Github URL</label>
                        <input type="url" id="github" name="social_links[github]" class="form-control" value="{{ old('social_links.github', $profile->social_links['github'] ?? '') }}" placeholder="https://github.com/username">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="instagram">Instagram URL</label>
                        <input type="url" id="instagram" name="social_links[instagram]" class="form-control" value="{{ old('social_links.instagram', $profile->social_links['instagram'] ?? '') }}" placeholder="https://instagram.com/username">
                    </div>
                    <div class="form-group">
                        <label for="facebook">Facebook URL</label>
                        <input type="url" id="facebook" name="social_links[facebook]" class="form-control" value="{{ old('social_links.facebook', $profile->social_links['facebook'] ?? '') }}" placeholder="https://facebook.com/username">
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3>Career Aspiration & Milestones</h3>
                
                <div class="form-group">
                    <label for="career_aspiration">Career Aspiration (EN)</label>
                    <textarea id="career_aspiration" name="career_aspiration" class="form-control" rows="3" placeholder="Describe your career aspirations...">{{ old('career_aspiration', $profile->career_aspiration ?? '') }}</textarea>
                </div>

                <div class="form-group">
                    <label for="career_aspiration_id">Career Aspiration (ID)</label>
                    <textarea id="career_aspiration_id" name="career_aspiration_id" class="form-control" rows="3" placeholder="Deskripsikan aspirasi karir Anda...">{{ old('career_aspiration_id', $profile->career_aspiration_id ?? '') }}</textarea>
                </div>

                <div class="form-group">
                    <label>Milestones</label>
                    <div id="milestones-container">
                        @php
                            $milestones = old('career_milestones', $profile->career_milestones ?? []);
                        @endphp
                        @foreach($milestones as $index => $milestone)
                            <div class="milestone-item form-row align-items-end mb-3" data-index="{{ $index }}">
                                <div class="form-group col-md-2">
                                    <label>Year</label>
                                    <input type="text" name="career_milestones[{{ $index }}][year]" class="form-control" value="{{ $milestone['year'] ?? '' }}" placeholder="2024">
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Title</label>
                                    <input type="text" name="career_milestones[{{ $index }}][title]" class="form-control" value="{{ $milestone['title'] ?? '' }}" placeholder="Tech Lead">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Description</label>
                                    <input type="text" name="career_milestones[{{ $index }}][description]" class="form-control" value="{{ $milestone['description'] ?? '' }}" placeholder="Achieved goal...">
                                </div>
                                <div class="form-group col-md-1">
                                    <button type="button" class="btn btn-danger btn-sm remove-milestone"><i class="fas fa-trash"></i></button>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <button type="button" id="add-milestone" class="btn btn-secondary btn-sm mt-2"><i class="fas fa-plus"></i> Add Milestone</button>
                </div>
            </div>

            <div class="form-section">
                <h3>Pengaturan Tombol Homepage</h3>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="d-flex align-items-center" style="gap: 10px; cursor: pointer;">
                            <input type="checkbox" name="show_cv_button" value="1" {{ old('show_cv_button', $profile->show_cv_button ?? true) ? 'checked' : '' }} style="width: 20px; height: 20px;">
                            <span>Tampilkan Tombol "Unduh CV"</span>
                        </label>
                        <small class="text-muted d-block mt-1">Jika dicentang, tombol Unduh CV akan muncul di Hero section.</small>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="d-flex align-items-center" style="gap: 10px; cursor: pointer;">
                            <input type="checkbox" name="show_contact_button" value="1" {{ old('show_contact_button', $profile->show_contact_button ?? true) ? 'checked' : '' }} style="width: 20px; height: 20px;">
                            <span>Tampilkan Tombol "Hubungi Saya"</span>
                        </label>
                        <small class="text-muted d-block mt-1">Jika dicentang, tombol Hubungi Saya akan muncul di Hero section.</small>
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3>Statistik</h3>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="years_experience">Tahun Pengalaman</label>
                        <input type="number" id="years_experience" name="years_experience" class="form-control" value="{{ old('years_experience', $profile->years_experience ?? 0) }}" min="0">
                    </div>
                    <div class="form-group">
                        <label for="total_projects">Total Proyek</label>
                        <input type="number" id="total_projects" name="total_projects" class="form-control" value="{{ old('total_projects', $profile->total_projects ?? 0) }}" min="0">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="happy_clients">Happy Clients</label>
                        <input type="number" id="happy_clients" name="happy_clients" class="form-control" value="{{ old('happy_clients', $profile->happy_clients ?? 0) }}" min="0">
                    </div>
                    <div class="form-group">
                        <label for="awards">Penghargaan</label>
                        <input type="number" id="awards" name="awards" class="form-control" value="{{ old('awards', $profile->awards ?? 0) }}" min="0">
                    </div>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Simpan Pengaturan
                </button>
            </div>
        </form>
    </div>

    <div>
        <!-- Favicon Upload -->
        <div class="photo-upload-card" style="margin-bottom: 24px;">
            <div class="current-photo" style="border-radius: 12px; width: 80px; height: 80px; margin: 0 auto 16px;">
                @if($profile && $profile->favicon)
                    <img src="{{ asset('storage/' . $profile->favicon) }}" alt="Favicon" style="width: 100%; height: 100%; object-fit: contain;">
                @else
                    <div style="width: 100%; height: 100%; background: rgba(255, 255, 255, 0.1); display: flex; align-items: center; justify-content: center; border-radius: 12px;">
                        <i class="fas fa-globe" style="font-size: 24px; color: var(--text-secondary);"></i>
                    </div>
                @endif
            </div>
            <h4 style="margin-bottom: 8px;">Favicon</h4>
            <p style="color: var(--text-secondary); font-size: 14px; margin-bottom: 16px;">Format .ICO, .PNG, .SVG. Maksimal 1MB.</p>
            <form action="{{ route('admin.settings.upload-favicon') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="file" name="favicon" id="favicon" accept=".ico,.png,.jpg,.jpeg,.svg" style="display: none;" onchange="this.form.submit()">
                <label for="favicon" class="btn btn-outline" style="cursor: pointer;">
                    <i class="fas fa-camera"></i> Ganti Favicon
                </label>
            </form>
        </div>

        <!-- Profile Photo -->
        <div class="photo-upload-card" style="margin-bottom: 24px;">
            <div class="current-photo">
                @if($profile && $profile->photo)
                    <img src="{{ asset('storage/' . $profile->photo) }}" alt="Profile Photo">
                @else
                    <img src="{{ asset('images/profile.png') }}" alt="Default Profile">
                @endif
            </div>
            <h4 style="margin-bottom: 8px;">Foto Profil</h4>
            <p style="color: var(--text-secondary); font-size: 14px; margin-bottom: 16px;">Usahakan background transparan dan format .SVG. Maksimal 2MB.</p>
            <form action="{{ route('admin.settings.upload-photo') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="file" name="photo" id="photo" accept="image/*,.svg" style="display: none;" onchange="this.form.submit()">
                <label for="photo" class="btn btn-outline" style="cursor: pointer;">
                    <i class="fas fa-camera"></i> Ganti Foto
                </label>
            </form>
        </div>

        <!-- CV Upload -->
        <div class="photo-upload-card">
            <div style="width: 80px; height: 80px; background: rgba(0, 180, 216, 0.2); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px;">
                <i class="fas fa-file-pdf" style="font-size: 32px; color: var(--primary);"></i>
            </div>
            <h4 style="margin-bottom: 8px;">CV / Resume</h4>
            @if($profile && $profile->cv_file)
                <p style="color: var(--accent-green); font-size: 14px; margin-bottom: 16px;">
                    <i class="fas fa-check-circle"></i> CV uploaded
                </p>
            @else
                <p style="color: var(--text-secondary); font-size: 14px; margin-bottom: 16px;">PDF. Maksimal 5MB.</p>
            @endif
            <form action="{{ route('admin.settings.upload-cv') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="file" name="cv_file" id="cv_file" accept=".pdf" style="display: none;" onchange="this.form.submit()">
                <label for="cv_file" class="btn btn-outline" style="cursor: pointer;">
                    <i class="fas fa-upload"></i> {{ $profile && $profile->cv_file ? 'Ganti CV' : 'Upload CV' }}
                </label>
            </form>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const container = document.getElementById('milestones-container');
        const addButton = document.getElementById('add-milestone');
        
        addButton.addEventListener('click', function() {
            const index = container.children.length;
            const template = `
                <div class="milestone-item form-row align-items-end mb-3" data-index="${index}">
                    <div class="form-group col-md-2">
                        <label>Year</label>
                        <input type="text" name="career_milestones[${index}][year]" class="form-control" placeholder="2024">
                    </div>
                    <div class="form-group col-md-3">
                        <label>Title</label>
                        <input type="text" name="career_milestones[${index}][title]" class="form-control" placeholder="Tech Lead">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Description</label>
                        <input type="text" name="career_milestones[${index}][description]" class="form-control" placeholder="Achieved goal...">
                    </div>
                    <div class="form-group col-md-1">
                        <button type="button" class="btn btn-danger btn-sm remove-milestone"><i class="fas fa-trash"></i></button>
                    </div>
                </div>
            `;
            container.insertAdjacentHTML('beforeend', template);
        });

        container.addEventListener('click', function(e) {
            if (e.target.closest('.remove-milestone')) {
                e.target.closest('.milestone-item').remove();
                // Re-index inputs? Not strictly necessary if backend handles indices loosely, 
                // but good practice if using array index-based validation. 
                // For simplified implementation, we'll assume standard POST handling.
            }
        });
    });
</script>
@endpush
