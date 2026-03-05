@extends('admin.layouts.app')

@section('title', 'Edit Proyek')

@section('content')
    <div class="page-header">
        <div class="page-header-row">
            <div>
                <h1>Edit Proyek</h1>
                <p>Perbarui detail proyek {{ $project->title }}</p>
            </div>
            <a href="{{ route('admin.projects.index') }}" class="btn btn-outline">
                <i class="fas fa-arrow-left"></i> Kembali
            </a>
        </div>
    </div>

    <form action="{{ route('admin.projects.update', $project) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div class="form-card">
            <div class="form-section">
                <h3>Informasi Dasar</h3>

                <div class="form-row">
                    <div class="form-group">
                        <label for="title">Judul Proyek *</label>
                        <input type="text" id="title" name="title" class="form-control"
                            value="{{ old('title', $project->title) }}" required>
                        @error('title')
                            <div class="form-help" style="color: var(--accent-red);">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="category_id">Kategori *</label>
                        <select id="category_id" name="category_id" class="form-control" required>
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}" {{ old('category_id', $project->category_id) == $category->id ? 'selected' : '' }}>
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="client">Nama Klien</label>
                        <input type="text" id="client" name="client" class="form-control"
                            value="{{ old('client', $project->client) }}">
                    </div>
                    <div class="form-group">
                        <label for="role">Role / Posisi</label>
                        <input type="text" id="role" name="role" class="form-control"
                            value="{{ old('role', $project->role) }}">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="timeline">Timeline</label>
                        <input type="text" id="timeline" name="timeline" class="form-control"
                            value="{{ old('timeline', $project->timeline) }}">
                    </div>
                    <div class="form-group">
                        <label for="status">Status *</label>
                        <select id="status" name="status" class="form-control" required>
                            <option value="draft" {{ old('status', $project->status) == 'draft' ? 'selected' : '' }}>Draft
                            </option>
                            <option value="published" {{ old('status', $project->status) == 'published' ? 'selected' : '' }}>
                                Published</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Deskripsi Singkat</label>
                    <textarea id="description" name="description" class="form-control"
                        rows="3">{{ old('description', $project->description) }}</textarea>
                </div>
            </div>

            <div class="form-section">
                <h3>Case Study</h3>

                <div class="form-group">
                    <label for="challenge">The Challenge</label>
                    <textarea id="challenge" name="challenge" class="form-control"
                        rows="4">{{ old('challenge', $project->challenge) }}</textarea>
                </div>

                <div class="form-group">
                    <label for="solution">The Solution</label>
                    <textarea id="solution" name="solution" class="form-control"
                        rows="4">{{ old('solution', $project->solution) }}</textarea>
                </div>
            </div>

            <div class="form-section">
                <h3>Media & Links</h3>

                @if(!empty($project->images) || $project->thumbnail)
                    <div class="form-group">
                        <label>Thumbnail Saat Ini (Urutan pertama akan jadi gambar utama)</label>
                        <div id="existing-images-container" style="margin-top: 8px; display: flex; gap: 10px; flex-wrap: wrap;">
                            @php
                                $allImages = !empty($project->images) ? $project->images : ($project->thumbnail ? [$project->thumbnail] : []);
                            @endphp
                            @foreach($allImages as $index => $img)
                                <div class="existing-image-item" style="position: relative; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 4px rgba(0,0,0,0.1); width: 150px; height: 100px; display: flex; align-items: center; justify-content: center; background: #f8fafc;">
                                    <img src="{{ asset('storage/' . $img) }}" alt="Current thumbnail" style="width: 100%; height: 100%; object-fit: cover;">
                                    <input type="hidden" name="existing_images[]" value="{{ $img }}" class="existing-image-input">
                                    <div class="image-actions" style="position: absolute; bottom: 0; left: 0; right: 0; background: rgba(0,0,0,0.6); display: flex; justify-content: space-between; padding: 4px;">
                                        <button type="button" onclick="moveImage(this, -1)" style="color: white; border: none; background: transparent; cursor: pointer; padding: 2px 6px;" title="Geser Kiri"><i class="fas fa-chevron-left"></i></button>
                                        <button type="button" onclick="removeImage(this)" style="color: #fca5a5; border: none; background: transparent; cursor: pointer; padding: 2px 6px;" title="Hapus"><i class="fas fa-trash"></i></button>
                                        <button type="button" onclick="moveImage(this, 1)" style="color: white; border: none; background: transparent; cursor: pointer; padding: 2px 6px;" title="Geser Kanan"><i class="fas fa-chevron-right"></i></button>
                                    </div>
                                    @if($index === 0)
                                        <div class="main-badge" style="position: absolute; top: 4px; left: 4px; background: var(--primary-color, #4f46e5); color: white; font-size: 10px; padding: 2px 6px; border-radius: 4px; font-weight: bold;">Utama</div>
                                    @endif
                                </div>
                            @endforeach
                        </div>
                        <div class="form-help" style="margin-top: 5px;">Gunakan tombol <i class="fas fa-chevron-left"></i> <i class="fas fa-chevron-right"></i> pada masing-masing gambar untuk mengubah urutannya. Gambar yang berlabel "Utama" akan tampil di halaman depan (Home).</div>
                    </div>
                @endif

                <div class="form-group">
                    <label
                        for="images">{{ $project->thumbnail || !empty($project->images) ? 'Tambah/Ganti Thumbnails' : 'Thumbnail Images' }}</label>
                    <label class="file-upload" id="thumbnail-upload-area">
                        <input type="file" id="images" name="images[]" accept="image/*" multiple
                            onchange="document.getElementById('thumbnail-filename').innerText = this.files.length > 0 ? this.files.length + ' gambar dipilih' : 'Klik untuk upload gambar (Maks. 2MB/file)'">
                        <i class="fas fa-images"></i>
                        <p id="thumbnail-filename">Klik untuk upload gambar (Bisa pilih lebih dari 1 sekaligus)</p>
                    </label>
                    @error('images')
                        <div class="form-help" style="color: #ef4444; margin-top: 5px;">{{ $message }}</div>
                    @enderror
                    @error('images.*')
                        <div class="form-help" style="color: #ef4444; margin-top: 5px;">{{ $message }}</div>
                    @enderror
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="live_url">Live URL</label>
                        <input type="url" id="live_url" name="live_url" class="form-control"
                            value="{{ old('live_url', $project->live_url) }}">
                    </div>
                    <div class="form-group">
                        <label for="code_url">Code Repository URL</label>
                        <input type="url" id="code_url" name="code_url" class="form-control"
                            value="{{ old('code_url', $project->code_url) }}">
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3>Tags & Tools</h3>

                <div class="form-row">
                    <div class="form-group">
                        <label for="tags">Tags</label>
                        <input type="text" id="tags" name="tags" class="form-control"
                            value="{{ old('tags', is_array($project->tags) ? implode(', ', $project->tags) : $project->tags) }}">
                        <div class="form-help">Pisahkan dengan koma</div>
                    </div>
                    <div class="form-group">
                        <label for="tools">Tools / Technologies</label>
                        <input type="text" id="tools" name="tools" class="form-control"
                            value="{{ old('tools', is_array($project->tools) ? implode(', ', $project->tools) : $project->tools) }}">
                        <div class="form-help">Pisahkan dengan koma</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-check">
                        <input type="checkbox" name="featured" value="1" {{ old('featured', $project->featured) ? 'checked' : '' }}>
                        <span>Tampilkan di halaman utama (Featured)</span>
                    </label>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Simpan Perubahan
                </button>
                <a href="{{ route('admin.projects.index') }}" class="btn btn-outline">Batal</a>
            </div>
        </div>
    </form>

    @push('scripts')
    <script>
        function updateBadges() {
            const container = document.getElementById('existing-images-container');
            const items = container.querySelectorAll('.existing-image-item');
            
            items.forEach((item, index) => {
                let badge = item.querySelector('.main-badge');
                if (index === 0) {
                    if (!badge) {
                        badge = document.createElement('div');
                        badge.className = 'main-badge';
                        badge.style.cssText = 'position: absolute; top: 4px; left: 4px; background: var(--primary-color, #4f46e5); color: white; font-size: 10px; padding: 2px 6px; border-radius: 4px; font-weight: bold;';
                        badge.innerText = 'Utama';
                        item.appendChild(badge);
                    }
                } else {
                    if (badge) {
                        badge.remove();
                    }
                }
            });
        }

        function moveImage(btn, direction) {
            const item = btn.closest('.existing-image-item');
            const container = item.parentNode;
            const siblings = Array.from(container.children);
            const index = siblings.indexOf(item);
            
            if (direction === -1 && index > 0) {
                container.insertBefore(item, siblings[index - 1]);
                updateBadges();
            } else if (direction === 1 && index < siblings.length - 1) {
                container.insertBefore(item, siblings[index + 2] || null);
                updateBadges();
            }
        }

        function removeImage(btn) {
            if (confirm('Hapus gambar ini dari proyek?')) {
                const item = btn.closest('.existing-image-item');
                item.remove();
                updateBadges();
            }
        }
    </script>
    @endpush
@endsection