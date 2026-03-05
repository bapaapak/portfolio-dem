@extends('admin.layouts.app')

@section('title', 'Manage Certifications')

@section('content')
<div class="page-header">
    <div class="header-title">
        <h1>Certifications</h1>
        <p>Manage your professional certifications and licenses</p>
    </div>
    <div class="header-actions">
        <a href="{{ route('admin.certifications.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Add Certification
        </a>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th width="50">#</th>
                        <th>Name</th>
                        <th>Issuer</th>
                        <th>Issued At</th>
                        <th>Expiration</th>
                        <th width="150">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($certifications as $cert)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>
                            <div class="d-flex flex-column">
                                <span class="fw-bold">{{ $cert->name }}</span>
                                @if($cert->name_en)
                                <small class="text-muted text-xs">EN: {{ $cert->name_en }}</small>
                                @endif
                                @if($cert->credential_url)
                                <a href="{{ $cert->credential_url }}" target="_blank" class="text-xs text-primary" style="text-decoration: none;">
                                    <i class="fas fa-external-link-alt"></i> View Credential
                                </a>
                                @endif
                            </div>
                        </td>
                        <td>
                            {{ $cert->issuer }}
                            @if($cert->issuer_en)
                            <br><small class="text-muted">{{ $cert->issuer_en }}</small>
                            @endif
                        </td>
                        <td>{{ $cert->formatted_issued_at }}</td>
                        <td>{{ $cert->formatted_expiration_date }}</td>
                        <td>
                            <div class="action-buttons">
                                <a href="{{ route('admin.certifications.edit', $cert->id) }}" class="btn-icon btn-edit" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="{{ route('admin.certifications.destroy', $cert->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure?')">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn-icon btn-delete" title="Delete">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center py-4 text-muted">No certifications found.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
