@extends('admin.layouts.app')

@section('title', 'Tambah Skill')

@section('content')
<div class="page-header">
    <div class="page-header-row">
        <div>
            <h1>Tambah Skill Baru</h1>
            <p>Tambahkan kategori skill baru untuk ditampilkan di portfolio.</p>
        </div>
        <a href="{{ route('admin.skills.index') }}" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
    </div>
</div>

<div class="form-container" style="background: var(--bg-card); padding: 24px; border-radius: 12px; border: 1px solid var(--border-color); max-width: 800px;">
    <form action="{{ route('admin.skills.store') }}" method="POST">
        @csrf

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="type" style="display: block; margin-bottom: 8px; font-weight: 500; color: var(--text-primary);">Type</label>
            <select name="type" id="type" class="form-control" style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary);">
                <option value="technical" style="background: #1f2937; color: #ffffff;">Technical Skill</option>
                <option value="soft" style="background: #1f2937; color: #ffffff;">Soft Skill</option>
            </select>
            @error('type')
                <p style="color: #ef4444; font-size: 13px; margin-top: 4px;">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="category" id="category-label" style="display: block; margin-bottom: 8px; font-weight: 500; color: var(--text-primary);">Category Name (e.g., Web Development)</label>
            <div style="display: flex; gap: 10px;">
                <input type="text" name="category" id="category" value="{{ old('category') }}" class="form-control" style="flex: 1; padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary);">
                <button type="button" id="auto-generate-btn" class="btn btn-secondary" style="white-space: nowrap;">
                    <i class="fas fa-magic"></i> Auto Generate
                </button>
            </div>
            @error('category')
                <p style="color: #ef4444; font-size: 13px; margin-top: 4px;">{{ $message }}</p>
            @enderror
        </div>
        
        <div class="form-group" style="margin-bottom: 20px;">
            <label for="category_en" id="category-en-label" style="display: block; margin-bottom: 8px; font-weight: 500; color: var(--text-primary);">Category Name (English) <span style="font-size: 0.8em; color: var(--text-secondary);">(Optional)</span></label>
            <input type="text" name="category_en" id="category_en" value="{{ old('category_en') }}" class="form-control" style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary);">
        </div>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="items" id="items-label" style="display: block; margin-bottom: 8px; font-weight: 500; color: var(--text-primary);">Skills (Comma separated, e.g., HTML, CSS, PHP)</label>
            <textarea name="items" id="items" rows="3" class="form-control" style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary);">{{ old('items') }}</textarea>
            @error('items')
                <p style="color: #ef4444; font-size: 13px; margin-top: 4px;">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="items_en" id="items-en-label" style="display: block; margin-bottom: 8px; font-weight: 500; color: var(--text-primary);">Skills (English) <span style="font-size: 0.8em; color: var(--text-secondary);">(Optional)</span></label>
            <textarea name="items_en" id="items_en" rows="3" class="form-control" style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary);">{{ old('items_en') }}</textarea>
        </div>

        <div class="form-group" style="margin-bottom: 20px;">
            <button type="button" id="translate-btn" class="btn btn-secondary" style="width: 100%; justify-content: center; gap: 8px;">
                <i class="fas fa-language"></i> Translate with AI
            </button>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Store used orders
                const usedOrders = {
                    technical: "{{ $usedOrdersTechnical ?? '' }}",
                    soft: "{{ $usedOrdersSoft ?? '' }}"
                };

                const typeSelect = document.getElementById('type');
                const orderHint = document.getElementById('used-orders-hint');
                const categoryLabel = document.getElementById('category-label');
                const itemsLabel = document.getElementById('items-label');
                const itemsInput = document.getElementById('items');

                function updateFormState() {
                    const type = typeSelect.value;
                    
                    // Update used orders logic
                    const used = usedOrders[type] || 'Belum ada data';
                    orderHint.textContent = used ? used : 'Belum ada data';

                    // Update Category and Items Label
                    if (type === 'soft') {
                        categoryLabel.textContent = 'Category Name (Optional)';
                        itemsLabel.textContent = 'Skills (Optional)';
                        itemsInput.removeAttribute('required');
                    } else {
                        categoryLabel.textContent = 'Category Name (e.g., Web Development)';
                        itemsLabel.textContent = 'Skills (Comma separated, e.g., HTML, CSS, PHP)';
                        itemsInput.setAttribute('required', 'required');
                    }
                }

                if(typeSelect) {
                    typeSelect.addEventListener('change', updateFormState);
                    // Initial call
                    updateFormState();
                }

                // Auto Generate Button
                const autoGenBtn = document.getElementById('auto-generate-btn');
                if(autoGenBtn) {
                    autoGenBtn.addEventListener('click', function() {
                        const items = document.getElementById('items').value;
                        if (!items) {
                            alert('Silakan isi kolom Skills terlebih dahulu.');
                            return;
                        }

                        const btn = this;
                        const originalText = btn.innerHTML;
                        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Generating...';
                        btn.disabled = true;

                        fetch('{{ route("admin.skills.generate-category") }}', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': '{{ csrf_token() }}'
                            },
                            body: JSON.stringify({ items: items })
                        })
                        .then(response => response.json())
                        .then(data => {
                            document.getElementById('category').value = data.category;
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('Gagal menggenerate kategori. ' + error);
                        })
                        .finally(() => {
                            btn.innerHTML = originalText;
                            btn.disabled = false;
                        });
                    });
                }

                // Translate button functionality
                const translateBtn = document.getElementById('translate-btn');
                if(translateBtn) {
                    translateBtn.addEventListener('click', function() {
                        const category = document.getElementById('category').value;
                        const items = document.getElementById('items').value;

                        if (!category && !items) {
                            alert('Mohon isi kategori atau skills terlebih dahulu');
                            return;
                        }

                        const btn = this;
                        const originalText = btn.innerHTML;
                        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Translating...';
                        btn.disabled = true;

                        fetch('{{ route("admin.skills.translate") }}', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': '{{ csrf_token() }}'
                            },
                            body: JSON.stringify({
                                category: category,
                                items: items
                            })
                        })
                        .then(response => {
                            if (!response.ok) throw new Error('Network response was not ok');
                            return response.json();
                        })
                        .then(data => {
                            if (data.category_en) document.getElementById('category_en').value = data.category_en;
                            if (data.items_en) document.getElementById('items_en').value = data.items_en;
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('Gagal menerjemahkan. Detail: ' + error.message);
                        })
                        .finally(() => {
                            btn.innerHTML = originalText;
                            btn.disabled = false;
                        });
                    });
                }
            });
        </script>
        
        <div class="form-group" style="margin-bottom: 20px;">
            <label for="order" style="display: block; margin-bottom: 8px; font-weight: 500; color: var(--text-primary);">Order</label>
            <input type="number" name="order" id="order" value="{{ old('order') }}" class="form-control" style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary);" placeholder="Contoh: 1">
            <p style="font-size: 12px; color: var(--text-secondary); margin-top: 4px;">
                Angka lebih kecil akan ditampilkan lebih dulu. <br>
                <strong>Nomor yang sudah digunakan:</strong> <span id="used-orders-hint"></span>
            </p>
            @error('order')
                <p style="color: #ef4444; font-size: 13px; margin-top: 4px;">{{ $message }}</p>
            @enderror
        </div>

        <div class="form-actions" style="margin-top: 32px; display: flex; justify-content: flex-end; gap: 12px;">
            <a href="{{ route('admin.skills.index') }}" class="btn btn-secondary">Batal</a>
            <button type="submit" class="btn btn-primary">Simpan Skill</button>
        </div>
    </form>
</div>
@endsection
