@extends('admin.layouts.app')

@section('title', 'Dashboard - Section Management')

@section('content')
<div class="page-header">
    <div class="header-title">
        <h1>Section Management</h1>
        <p>Show or hide sections on your homepage</p>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <form action="{{ route('admin.update-sections') }}" method="POST">
            @csrf
            <div class="section-toggle-grid" id="sectionsGrid">
                @foreach($sections as $key => $label)
                <div class="section-toggle-item" data-id="{{ $key }}">
                    <div class="toggle-content">
                        <div class="section-info">
                            <i class="fas fa-grip-vertical section-drag-handle"></i>
                            <h4 class="section-name">{{ $label }}</h4>
                            <span class="section-key">{{ $key }}</span>
                        </div>
                        <label class="toggle-switch">
                            <input type="checkbox" name="visible_sections[]" value="{{ $key }}" 
                                {{ in_array($key, $visibleSections) ? 'checked' : '' }}>
                            <span class="toggle-slider"></span>
                        </label>
                    </div>
                </div>
                @endforeach
            </div>
            <input type="hidden" name="section_order" id="sectionOrderInput">

            <div class="form-actions text-right mt-4">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Save Changes
                </button>
            </div>
        </form>
    </div>
</div>



@push('styles')
<style>
    .section-toggle-grid {
        display: grid;
        gap: 12px;
    }

    .section-toggle-item {
        background: #f9fafb;
        border: 1px solid #e5e7eb;
        border-radius: 12px;
        transition: all 0.3s ease, transform 0.2s;
        overflow: hidden;
    }

    .section-toggle-item.sortable-ghost {
        opacity: 0.4;
        background: #f3f4f6;
        border-style: dashed;
    }

    .section-toggle-item.sortable-drag {
        background: #ffffff;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        transform: scale(1.02);
        z-index: 100;
    }

    .section-toggle-item:hover {
        border-color: #5FCECE;
        box-shadow: 0 4px 12px rgba(95, 206, 206, 0.1);
    }

    .toggle-content {
        padding: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 16px;
    }

    .section-info {
        display: flex;
        align-items: center;
        gap: 12px;
        flex: 1;
    }

    .section-drag-handle {
        color: #9ca3af;
        cursor: grab;
        font-size: 16px;
        padding: 4px; /* Larger hit area */
    }
    
    .section-drag-handle:hover {
        color: #4b5563;
    }

    .section-name {
        font-size: 16px;
        font-weight: 600;
        color: #1f2937;
        margin: 0;
    }

    .section-key {
        font-size: 12px;
        color: #6b7280;
        background: #e5e7eb;
        padding: 4px 8px;
        border-radius: 6px;
        font-family: 'Courier New', monospace;
    }

    /* Toggle Switch Styles */
    .toggle-switch {
        position: relative;
        display: inline-block;
        width: 54px;
        height: 28px;
        flex-shrink: 0;
    }

    .toggle-switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .toggle-slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #cbd5e0;
        transition: 0.3s;
        border-radius: 28px;
    }

    .toggle-slider:before {
        position: absolute;
        content: "";
        height: 20px;
        width: 20px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: 0.3s;
        border-radius: 50%;
    }

    input:checked + .toggle-slider {
        background-color: #5FCECE;
    }

    input:checked + .toggle-slider:before {
        transform: translateX(26px);
    }

    input:focus + .toggle-slider {
        box-shadow: 0 0 1px #5FCECE;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .toggle-content {
            padding: 16px;
        }

        .section-name {
            font-size: 14px;
        }

        .section-key {
            display: none;
        }
    }
</style>
@endpush

@push('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var el = document.getElementById('sectionsGrid');
        var sortable = Sortable.create(el, {
            handle: '.section-drag-handle',
            animation: 150,
            ghostClass: 'sortable-ghost',
            dragClass: 'sortable-drag',
            onEnd: function (evt) {
                updateOrder();
            }
        });

        function updateOrder() {
            var order = sortable.toArray(); // Uses data-id
            document.getElementById('sectionOrderInput').value = JSON.stringify(order);
        }

        // Initialize order on load
        updateOrder();
    });
</script>
@endpush
@endsection
