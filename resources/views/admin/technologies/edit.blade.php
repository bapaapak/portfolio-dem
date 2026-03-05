@extends('admin.layouts.app')

@section('title', 'Edit Technology')

@section('content')
<div class="page-header">
    <h1>Edit Technology</h1>
    <p>Update technology details.</p>
</div>

<div class="form-card">
    <form action="{{ route('admin.technologies.update', $technology) }}" method="POST">
        @csrf
        @method('PUT')
        
        <div class="form-row">
            <div class="form-group">
                <label for="name">Technology Name *</label>
                <input type="text" id="name" name="name" class="form-control" value="{{ old('name', $technology->name) }}" required>
            </div>
            <div class="form-group">
                <label for="icon">Icon Class *</label>
                <input type="text" id="icon" name="icon" class="form-control" value="{{ old('icon', $technology->icon) }}" required placeholder="e.g. fab fa-js-square">
                <small class="form-text">Font Awesome class. Find icons at <a href="https://fontawesome.com/icons" target="_blank">fontawesome.com</a></small>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="order">Display Order</label>
                <input type="number" id="order" name="order" class="form-control" value="{{ old('order', $technology->order) }}" min="0">
                <small class="form-text">Lower numbers appear first</small>
            </div>
            <div class="form-group">
                <label for="is_active" style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                    <input type="checkbox" id="is_active" name="is_active" value="1" {{ old('is_active', $technology->is_active) ? 'checked' : '' }} style="width: auto; cursor: pointer;">
                    <span>Active (Show on homepage)</span>
                </label>
                <small class="form-text" style="color: var(--text-secondary); margin-top: 4px;">Uncheck to hide from homepage</small>
            </div>
        </div>

        <div class="form-group">
            <label class="form-check">
                <input type="checkbox" name="featured" value="1" {{ old('featured', $technology->featured) ? 'checked' : '' }}>
                <span>Tampilkan di halaman utama (Featured)</span>
            </label>
        </div>

        <div class="form-group">
            <label>Icon Preview</label>
            <div id="icon-preview" style="font-size: 48px; color: var(--primary); padding: 20px; text-align: center; background: var(--surface-color); border-radius: 8px;">
                <i id="preview-icon" class="{{ $technology->icon }}"></i>
            </div>
        </div>

        <div class="form-actions">
            <a href="{{ route('admin.technologies.index') }}" class="btn btn-outline">Cancel</a>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Update Technology
            </button>
        </div>
    </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const iconInput = document.getElementById('icon');
    const previewIcon = document.getElementById('preview-icon');
    
    iconInput.addEventListener('input', function() {
        const iconClass = this.value.trim();
        if (iconClass) {
            previewIcon.className = iconClass;
        } else {
            previewIcon.className = 'fab fa-question-circle';
        }
    });
});
</script>
@endsection
