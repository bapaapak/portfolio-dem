@extends('admin.layouts.app')

@section('title', 'Tambah Proyek Baru')

@section('content')
    <div class="page-header">
        <div class="page-header-row">
            <div>
                <h1>Tambah Proyek Baru</h1>
                <p>Isi detail proyek yang ingin ditambahkan ke portofolio</p>
            </div>
            <a href="{{ route('admin.projects.index') }}" class="btn btn-outline">
                <i class="fas fa-arrow-left"></i> Kembali
            </a>
        </div>
    </div>

    <form action="{{ route('admin.projects.store') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div class="form-card">
            <div class="form-section">
                <h3>Informasi Dasar</h3>

                <div class="form-row">
                    <div class="form-group">
                        <label for="title">Judul Proyek *</label>
                        <input type="text" id="title" name="title" class="form-control" placeholder="E-Commerce Redesign"
                            value="{{ old('title') }}" required>
                        @error('title')
                            <div class="form-help" style="color: var(--accent-red);">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="category_id">Kategori *</label>
                        <select id="category_id" name="category_id" class="form-control" required>
                            <option value="">Pilih Kategori</option>
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="client">Nama Klien</label>
                        <input type="text" id="client" name="client" class="form-control" placeholder="Brand X Corp"
                            value="{{ old('client') }}">
                    </div>
                    <div class="form-group">
                        <label for="role">Role / Posisi</label>
                        <input type="text" id="role" name="role" class="form-control" placeholder="Lead Designer"
                            value="{{ old('role') }}">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="timeline">Timeline</label>
                        <input type="text" id="timeline" name="timeline" class="form-control" placeholder="4 Weeks"
                            value="{{ old('timeline') }}">
                    </div>
                    <div class="form-group">
                        <label for="status">Status *</label>
                        <select id="status" name="status" class="form-control" required>
                            <option value="draft" {{ old('status') == 'draft' ? 'selected' : '' }}>Draft</option>
                            <option value="published" {{ old('status') == 'published' ? 'selected' : '' }}>Published</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Deskripsi Singkat</label>
                    <textarea id="description" name="description" class="form-control" rows="3"
                        placeholder="Deskripsi singkat tentang proyek...">{{ old('description') }}</textarea>
                </div>
            </div>

            <div class="form-section">
                <h3>Case Study</h3>

                <div class="form-group">
                    <label for="challenge">The Challenge</label>
                    <textarea id="challenge" name="challenge" class="form-control" rows="4"
                        placeholder="Jelaskan tantangan atau masalah yang dihadapi...">{{ old('challenge') }}</textarea>
                </div>

                <div class="form-group">
                    <label for="solution">The Solution</label>
                    <textarea id="solution" name="solution" class="form-control" rows="4"
                        placeholder="Jelaskan solusi yang Anda berikan...">{{ old('solution') }}</textarea>
                </div>
            </div>

            <div class="form-section">
                <h3>Media & Links</h3>

                <div class="form-group">
                    <label for="images">Thumbnail Images</label>
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
                            placeholder="https://example.com" value="{{ old('live_url') }}">
                    </div>
                    <div class="form-group">
                        <label for="code_url">Code Repository URL</label>
                        <input type="url" id="code_url" name="code_url" class="form-control"
                            placeholder="https://github.com/..." value="{{ old('code_url') }}">
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3>Tags & Tools</h3>

                <div class="form-row">
                    <div class="form-group">
                        <label for="tags">Tags</label>
                        <input type="text" id="tags" name="tags" class="form-control" placeholder="UI/UX, Mobile, React"
                            value="{{ old('tags') }}">
                        <div class="form-help">Pisahkan dengan koma</div>
                    </div>
                    <div class="form-group">
                        <label for="tools">Tools / Technologies</label>
                        <input type="text" id="tools" name="tools" class="form-control" placeholder="Figma, React, Node.js"
                            value="{{ old('tools') }}">
                        <div class="form-help">Pisahkan dengan koma</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-check">
                        <input type="checkbox" name="featured" value="1" {{ old('featured') ? 'checked' : '' }}>
                        <span>Tampilkan di halaman utama (Featured)</span>
                    </label>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Simpan Proyek
                </button>
                <a href="{{ route('admin.projects.index') }}" class="btn btn-outline">Batal</a>
            </div>
        </div>
    </form>
@endsection