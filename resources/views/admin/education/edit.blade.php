@extends('admin.layouts.app')

@section('title', 'Edit Education')

@section('content')
<div class="page-header">
    <h1>Edit Education</h1>
    <p>Update academic background details.</p>
</div>

<div class="form-card">
    <form action="{{ route('admin.education.update', $education) }}" method="POST">
        @csrf
        @method('PUT')
        
        <div class="form-row">
            <div class="form-group">
                <label for="institution">Institution *</label>
                <input type="text" id="institution" name="institution" class="form-control" value="{{ old('institution', $education->institution) }}" required>
            </div>
            <div class="form-group">
                <label for="degree">Degree/Major *</label>
                <input type="text" id="degree" name="degree" class="form-control" value="{{ old('degree', $education->degree) }}" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" class="form-control" value="{{ old('location', $education->location) }}" placeholder="Jakarta, Indonesia">
            </div>
            <div class="form-group">
                <label for="is_current" style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                    <input type="checkbox" id="is_current" name="is_current" value="1" {{ old('is_current', $education->is_current) ? 'checked' : '' }} style="width: auto; cursor: pointer;">
                    <span>Sedang Berjalan (Currently Studying)</span>
                </label>
                <small class="form-text" style="color: var(--text-secondary); margin-top: 4px;">Centang jika pendidikan masih berlangsung</small>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Date Display Format</label>
                <div style="display: flex; gap: 15px; margin-top: 5px;">
                    <label style="cursor: pointer;">
                        <input type="radio" name="date_format" value="F Y" {{ old('date_format', $education->date_format ?? 'Y') == 'F Y' ? 'checked' : '' }}> Month & Year (e.g. Jan 2024)
                    </label>
                    <label style="cursor: pointer;">
                        <input type="radio" name="date_format" value="Y" {{ old('date_format', $education->date_format ?? 'Y') == 'Y' ? 'checked' : '' }}> Year Only (e.g. 2024)
                    </label>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="start_date">Start Date *</label>
                <input type="date" id="start_date" name="start_date" class="form-control" value="{{ old('start_date', $education->start_date->format('Y-m-d')) }}" required>
            </div>
            <div class="form-group">
                <label for="end_date">End Date</label>
                <input type="date" id="end_date" name="end_date" class="form-control" value="{{ old('end_date', optional($education->end_date)->format('Y-m-d')) }}">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="gpa">GPA</label>
                <input type="text" id="gpa" name="gpa" class="form-control" value="{{ old('gpa', $education->gpa) }}">
            </div>
            <div class="form-group">
                <label for="order">Sort Order</label>
                <input type="number" id="order" name="order" class="form-control" value="{{ old('order', $education->order) }}" min="0">
            </div>
        </div>

        <div class="form-group">
            <label for="description">Description (Optional)</label>
            <textarea id="description" name="description" class="form-control" rows="4">{{ old('description', $education->description) }}</textarea>
            <div class="form-help" style="margin-top: 5px; color: #666; font-size: 0.9em;">
                <i class="fas fa-info-circle"></i> Tip: Gunakan tanda strip (-) di awal baris untuk membuat bullet points.
            </div>
        </div>

        <div class="form-actions">
            <a href="{{ route('admin.education.index') }}" class="btn btn-outline">Cancel</a>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Update Education
            </button>
        </div>
    </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const isCurrentCheckbox = document.getElementById('is_current');
    const endDateInput = document.getElementById('end_date');
    
    function toggleEndDate() {
        if (isCurrentCheckbox.checked) {
            endDateInput.value = '';
            endDateInput.disabled = true;
            endDateInput.style.opacity = '0.5';
            endDateInput.style.cursor = 'not-allowed';
        } else {
            endDateInput.disabled = false;
            endDateInput.style.opacity = '1';
            endDateInput.style.cursor = 'text';
        }
    }
    
    isCurrentCheckbox.addEventListener('change', toggleEndDate);
    toggleEndDate(); // Initial state
});
</script>
@endsection
