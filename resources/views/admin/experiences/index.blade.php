@extends('admin.layouts.app')

@section('title', 'Manage Experience')

@section('content')
<div class="page-header">
    <div class="page-header-row">
        <div>
            <h1>Professional Experience</h1>
            <p>Manage your work history and internships.</p>
        </div>
        <a href="{{ route('admin.experiences.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Add Experience
        </a>
    </div>
</div>

<div class="data-table">
    <table>
        <thead>
            <tr>
                <th>Role</th>
                <th>Company</th>
                <th>Type</th>
                <th>Period</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($experiences as $experience)
                <tr>
                    <td>
                        <div class="table-title">{{ $experience->title }}</div>
                    </td>
                    <td>
                        <div class="table-subtitle">{{ $experience->company }}</div>
                    </td>
                    <td>
                        <span class="category-badge">{{ $experience->type }}</span>
                    </td>
                    <td>
                        {{ $experience->formatted_start_date }} - {{ $experience->formatted_end_date }}
                    </td>
                    <td>
                        <div class="table-actions">
                            <a href="{{ route('admin.experiences.edit', $experience) }}" class="action-btn" title="Edit">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="{{ route('admin.experiences.destroy', $experience) }}" method="POST" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="action-btn danger" title="Delete">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="5" style="text-align: center; padding: 40px; color: var(--text-secondary);">
                        <i class="fas fa-briefcase" style="font-size: 32px; margin-bottom: 12px; display: block; opacity: 0.5;"></i>
                        No experience records found.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
