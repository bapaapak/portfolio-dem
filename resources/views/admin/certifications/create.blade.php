@extends('admin.layouts.app')

@section('title', 'Add Certification')

@section('content')
<div class="page-header">
    <div class="header-title">
        <a href="{{ route('admin.certifications.index') }}" class="back-link">
            <i class="fas fa-arrow-left"></i> Back
        </a>
        <h1>Add Certification</h1>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <form action="{{ route('admin.certifications.store') }}" method="POST">
            @csrf
            
            <div class="row">
                <div class="col-md-6">
                    <h5 class="mb-3">Indonesian (Original)</h5>
                    <div class="form-group">
                        <label for="name" class="required">Certification Name (ID)</label>
                        <input type="text" id="name" name="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}" required>
                        @error('name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="issuer" class="required">Issuer (ID)</label>
                        <input type="text" id="issuer" name="issuer" class="form-control @error('issuer') is-invalid @enderror" value="{{ old('issuer') }}" required>
                        @error('issuer')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="description">Description (ID)</label>
                        <textarea id="description" name="description" class="form-control @error('description') is-invalid @enderror" rows="3">{{ old('description') }}</textarea>
                        @error('description')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0">English (Translation)</h5>
                        <button type="button" class="btn btn-sm btn-outline" id="translate-btn">
                            <i class="fas fa-magic"></i> Translate with AI
                        </button>
                    </div>

                    <div class="form-group">
                        <label for="name_en">Certification Name (EN)</label>
                        <input type="text" id="name_en" name="name_en" class="form-control @error('name_en') is-invalid @enderror" value="{{ old('name_en') }}">
                        @error('name_en')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="issuer_en">Issuer (EN)</label>
                        <input type="text" id="issuer_en" name="issuer_en" class="form-control @error('issuer_en') is-invalid @enderror" value="{{ old('issuer_en') }}">
                        @error('issuer_en')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="description_en">Description (EN)</label>
                        <textarea id="description_en" name="description_en" class="form-control @error('description_en') is-invalid @enderror" rows="3">{{ old('description_en') }}</textarea>
                        @error('description_en')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
            </div>

            <hr>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="issued_at" class="required">Issued Date</label>
                        <input type="date" id="issued_at" name="issued_at" class="form-control datepicker @error('issued_at') is-invalid @enderror" value="{{ old('issued_at') }}" required>
                        @error('issued_at')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="expiration_date">Expiration Date</label>
                        <input type="date" id="expiration_date" name="expiration_date" class="form-control datepicker @error('expiration_date') is-invalid @enderror" value="{{ old('expiration_date') }}">
                        <small class="form-text text-muted">Leave blank if no expiration.</small>
                        @error('expiration_date')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-md-4">
                     <div class="form-group">
                        <label for="credential_url">Credential URL</label>
                        <input type="url" id="credential_url" name="credential_url" class="form-control @error('credential_url') is-invalid @enderror" value="{{ old('credential_url') }}" placeholder="https://...">
                        @error('credential_url')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
            </div>

            <div class="form-actions text-right mt-4">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Save Certification
                </button>
            </div>
        </form>
    </div>
</div>

@push('scripts')
<script>
    document.getElementById('translate-btn').addEventListener('click', function() {
        const btn = this;
        const originalText = btn.innerHTML;
        
        const name = document.getElementById('name').value;
        const issuer = document.getElementById('issuer').value;
        const description = document.getElementById('description').value;

        if (!name) {
            alert('Please fill the Indonesian Name first.');
            return;
        }

        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Translating...';
        btn.disabled = true;

        fetch('{{ route("admin.certifications.translate") }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({ 
                name: name,
                issuer: issuer,
                description: description
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data) {
                document.getElementById('name_en').value = data.name_en || name;
                document.getElementById('issuer_en').value = data.issuer_en || issuer;
                document.getElementById('description_en').value = data.description_en || '';
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
</script>
@endpush
@endsection
