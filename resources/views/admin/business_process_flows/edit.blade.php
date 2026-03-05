@extends('admin.layouts.app')

@section('title', 'Edit Business Process Step')

@section('content')
    <div class="page-header">
        <div class="page-header-row">
            <div class="header-title">
                <h1>Edit Business Process Step</h1>
                <p>Update existing flow step.</p>
            </div>
            <div class="header-actions">
                <a href="{{ route('admin.business-process-flows.index') }}" class="btn btn-outline">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
            </div>
        </div>
    </div>

    <form action="{{ route('admin.business-process-flows.update', $businessProcessFlow->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="form-card">
            <div class="form-section">
                <h3>Step Details</h3>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="step_order">Step Order *</label>
                        <input type="number" name="step_order" id="step_order" class="form-control" value="{{ old('step_order', $businessProcessFlow->step_order) }}" required>
                        <div class="form-help">Urutan langkah dalam flow</div>
                    </div>
                    <div class="form-group">
                        <label for="role">Role *</label>
                        <input type="text" name="role" id="role" class="form-control" value="{{ old('role', $businessProcessFlow->role) }}" placeholder="e.g. CUSTOMER" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="action">Action / Content *</label>
                    <textarea name="action" id="action" class="form-control" rows="3" required placeholder="Isi teks utama yang akan muncul di box">{{ old('action', $businessProcessFlow->action) }}</textarea>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="badge_text">Badge Text (Optional)</label>
                        <input type="text" name="badge_text" id="badge_text" class="form-control" value="{{ old('badge_text', $businessProcessFlow->badge_text) }}" placeholder="e.g. MAGANG">
                    </div>
                    <div class="form-group">
                        <label for="badge_color">Badge Color (Optional)</label>
                        <select name="badge_color" id="badge_color" class="form-control">
                            <option value="">None</option>
                            <option value="blue" {{ old('badge_color', $businessProcessFlow->badge_color) == 'blue' ? 'selected' : '' }}>Blue (Default)</option>
                            <option value="green" {{ old('badge_color', $businessProcessFlow->badge_color) == 'green' ? 'selected' : '' }}>Green (Success)</option>
                            <option value="gray" {{ old('badge_color', $businessProcessFlow->badge_color) == 'gray' ? 'selected' : '' }}>Gray (Neutral)</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Bottom Description (Optional)</label>
                    <textarea name="description" id="description" class="form-control" rows="2" placeholder="Teks tambahan yang muncul di bawah panah (arrow)">{{ old('description', $businessProcessFlow->description) }}</textarea>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Update Step
                </button>
                <a href="{{ route('admin.business-process-flows.index') }}" class="btn btn-outline">Cancel</a>
            </div>
        </div>
    </form>
@endsection
