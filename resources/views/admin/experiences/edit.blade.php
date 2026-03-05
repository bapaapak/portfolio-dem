@extends('admin.layouts.app')

@section('title', 'Edit Experience')

@section('content')
<div class="page-header">
    <h1>Edit Experience</h1>
    <p>Update work experience details.</p>
</div>

<div class="form-card">
    <form action="{{ route('admin.experiences.update', $experience) }}" method="POST">
        @csrf
        @method('PUT')
        
        <div class="form-row">
            <div class="form-group">
                <label for="title">Job Title *</label>
                <input type="text" id="title" name="title" class="form-control" value="{{ old('title', $experience->title) }}" required>
            </div>
            <div class="form-group">
                <label for="company">Company Name *</label>
                <input type="text" id="company" name="company" class="form-control" value="{{ old('company', $experience->company) }}" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="type">Type</label>
                <input type="text" id="type" name="type" class="form-control" value="{{ old('type', $experience->type) }}">
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" class="form-control" value="{{ old('location', $experience->location) }}" placeholder="e.g. Remote, Jakarta">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="order">Sort Order</label>
                <input type="number" id="order" name="order" class="form-control" value="{{ old('order', $experience->order) }}" min="0">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Date Display Format</label>
                <div style="display: flex; gap: 15px; margin-top: 5px;">
                    <label style="cursor: pointer;">
                        <input type="radio" name="date_format" value="F Y" {{ old('date_format', $experience->date_format ?? 'F Y') == 'F Y' ? 'checked' : '' }}> Month & Year (e.g. Jan 2024)
                    </label>
                    <label style="cursor: pointer;">
                        <input type="radio" name="date_format" value="Y" {{ old('date_format', $experience->date_format ?? 'F Y') == 'Y' ? 'checked' : '' }}> Year Only (e.g. 2024)
                    </label>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="start_date">Start Date *</label>
                <input type="text" id="start_date" name="start_date" class="form-control datepicker" value="{{ old('start_date', $experience->start_date) }}" required placeholder="YYYY-MM-DD">
            </div>
            <div class="form-group">
                <label for="end_date">End Date</label>
                <input type="text" id="end_date" name="end_date" class="form-control datepicker" value="{{ old('end_date', $experience->end_date) }}" placeholder="Leave blank if current job">
            </div>
        </div>

        <div class="form-group">
            <label class="form-check">
                <input type="checkbox" name="featured" value="1" {{ old('featured', $experience->featured) ? 'checked' : '' }}>
                <span>Tampilkan di halaman utama (Featured)</span>
            </label>
            <label class="form-check" style="margin-left: 15px;">
                <input type="checkbox" name="show_description" value="1" {{ old('show_description', $experience->show_description) ? 'checked' : '' }}>
                <span>Show Description</span>
            </label>
            <label class="form-check" style="margin-left: 15px;">
                <input type="checkbox" name="show_tags" value="1" {{ old('show_tags', $experience->show_tags) ? 'checked' : '' }}>
                <span>Show Tags/Badges</span>
            </label>
        </div>

        <div class="form-group">
            <label for="technologies">Technologies (Badges)</label>
            <input type="text" id="technologies" name="technologies" class="form-control" 
                   value="{{ old('technologies', is_array($experience->technologies) ? implode(', ', $experience->technologies) : $experience->technologies) }}">
            <small class="form-text" style="color: var(--text-secondary);">Pisahkan dengan koma</small>
            
            @if(isset($availableSkills) && count($availableSkills) > 0)
                <div style="margin-top: 10px;">
                    <small style="display: block; margin-bottom: 5px; font-weight: 500;">Quick Add from Skills:</small>
                    <div style="display: flex; flex-wrap: wrap; gap: 8px;">
                        @foreach($availableSkills as $skill)
                            <span onclick="addTech('{{ $skill }}')" 
                                  style="
                                    background: #eef2f7; 
                                    color: #4b5563; 
                                    padding: 4px 10px; 
                                    border-radius: 9999px; 
                                    font-size: 0.85em; 
                                    cursor: pointer; 
                                    border: 1px solid #d1d5db;
                                    transition: all 0.2s;
                                  "
                                  onmouseover="this.style.background='#d1d5db'"
                                  onmouseout="this.style.background='#eef2f7'"
                            >
                                + {{ $skill }}
                            </span>
                        @endforeach
                    </div>
                </div>
            @endif
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Global function for badge click
                window.addTech = function(tech) {
                    const input = document.getElementById('technologies');
                    let current = input.value.split(',').map(s => s.trim()).filter(s => s);
                    
                    if (!current.includes(tech)) {
                        current.push(tech);
                        input.value = current.join(', ');
                    }
                };
            });
        </script>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="description" style="display: block; margin-bottom: 8px; font-weight: 500; color: var(--text-primary);">Description (Optional)</label>
            <div style="position: relative;">
                <textarea name="description" id="description" rows="5" class="form-control" style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary);">{{ old('description', $experience->description) }}</textarea>
                 <button type="button" id="generate-desc-btn" class="btn btn-sm btn-secondary" style="position: absolute; right: 10px; top: 10px; font-size: 12px; padding: 4px 8px;">
                    <i class="fas fa-magic"></i> Generate with AI
                </button>
            </div>
            <p style="font-size: 12px; color: var(--text-secondary); margin-top: 4px;">
                <i class="fas fa-info-circle"></i> Tip: Gunakan tanda strip (-) di awal baris untuk membuat bullet points.
            </p>
            @error('description')
                <p style="color: #ef4444; font-size: 13px; margin-top: 4px;">{{ $message }}</p>
            @enderror
        </div>

        <!-- English Translation Section -->
        <div class="form-group" style="margin-bottom: 20px; padding: 15px; background: rgba(0,0,0,0.02); border-radius: 8px; border: 1px dashed #cbd5e1;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                <h3 style="font-size: 16px; margin: 0; color: #4b5563;">
                    <i class="fas fa-language"></i> English Translation (Optional)
                </h3>
                <button type="button" id="translate-btn" class="btn btn-sm btn-primary">
                    <i class="fas fa-globe"></i> Translate with AI
                </button>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="title_en">Job Title (EN)</label>
                    <input type="text" id="title_en" name="title_en" class="form-control" value="{{ old('title_en', $experience->title_en) }}" placeholder="e.g. Senior Frontend Engineer">
                </div>
                <div class="form-group">
                    <label for="company_en">Company (EN)</label>
                    <input type="text" id="company_en" name="company_en" class="form-control" value="{{ old('company_en', $experience->company_en) }}" placeholder="e.g. TechStart Inc">
                </div>
            </div>

             <div class="form-row">
                <div class="form-group">
                    <label for="location_en">Location (EN)</label>
                    <input type="text" id="location_en" name="location_en" class="form-control" value="{{ old('location_en', $experience->location_en) }}" placeholder="e.g. Jakarta, Indonesia">
                </div>
            </div>

            <div class="form-group">
                <label for="technologies_en">Technologies (Badges - EN)</label>
                <input type="text" id="technologies_en" name="technologies_en" class="form-control" value="{{ old('technologies_en', is_array($experience->technologies_en) ? implode(', ', $experience->technologies_en) : $experience->technologies_en) }}" placeholder="React, TypeScript, Laravel">
                <small class="form-text" style="color: var(--text-secondary);">English translation for badges</small>
            </div>

            <div class="form-group">
                <label for="description_en">Description (EN)</label>
                <textarea name="description_en" id="description_en" rows="5" class="form-control" style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary);">{{ old('description_en', $experience->description_en) }}</textarea>
                <small class="form-text" style="color: var(--text-secondary);">English version of the description.</small>
            </div>
        </div>

        <script>
            // Translation Script
            document.getElementById('translate-btn').addEventListener('click', function() {
                const btn = this;
                const originalText = btn.innerHTML;
                
                const title = document.getElementById('title').value;
                const company = document.getElementById('company').value;
                const location = document.getElementById('location').value;
                const description = document.getElementById('description').value;
                const technologies = document.getElementById('technologies').value;

                if (!title) {
                    alert('Please fill the Indonesian Title first.');
                    return;
                }

                btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Translating...';
                btn.disabled = true;

                fetch('{{ route("admin.experiences.translate") }}', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: JSON.stringify({ 
                        title: title,
                        company: company,
                        location: location,
                        description: description,
                        technologies: technologies
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        document.getElementById('title_en').value = data.title_en || title;
                        document.getElementById('company_en').value = data.company_en || company;
                        document.getElementById('location_en').value = data.location_en || location;
                        document.getElementById('description_en').value = data.description_en || '';
                        if(data.technologies_en) {
                            document.getElementById('technologies_en').value = data.technologies_en;
                        }
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Translation failed.');
                })
                .finally(() => {
                    btn.innerHTML = originalText;
                    btn.disabled = false;
                });
            });

            document.getElementById('generate-desc-btn').addEventListener('click', function() {
                const title = document.getElementById('title').value;
                if (!title) {
                    alert('Silakan isi Job Title terlebih dahulu untuk menggunakan fitur ini.');
                    return;
                }

                const btn = this;
                const originalText = btn.innerHTML;
                const textarea = document.getElementById('description');
                
                if (textarea.value && !confirm('Deskripsi sudah terisi. Apakah Anda ingin menimpanya dengan hasil generative AI?')) {
                    return;
                }

                btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Generating...';
                btn.disabled = true;

                fetch('{{ route("admin.experiences.generate-description") }}', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: JSON.stringify({ title: title })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.description) {
                        textarea.value = data.description;
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Gagal menggenerate deskripsi. Silakan coba lagi.');
                })
                .finally(() => {
                    btn.innerHTML = originalText;
                    btn.disabled = false;
                });
            });
        </script>

        <div class="form-actions">
            <a href="{{ route('admin.experiences.index') }}" class="btn btn-outline">Cancel</a>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Update Experience
            </button>
        </div>
    </form>
</div>
@endsection
