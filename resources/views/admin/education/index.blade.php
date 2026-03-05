@extends('admin.layouts.app')

@section('title', 'Manage Education')

@section('content')
<div class="page-header">
    <div class="page-header-row">
        <div>
            <h1>Education</h1>
            <p>Manage your academic background and certifications.</p>
        </div>
        <a href="{{ route('admin.education.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Add Education
        </a>
    </div>
</div>

<div class="data-table">
    <table>
        <thead>
            <tr>
                <th>Institution</th>
                <th>Degree</th>
                <th>Period</th>
                <th>GPA</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($educations as $education)
                <tr>
                    <td>
                        <div class="table-title">{{ $education->institution }}</div>
                    </td>
                    <td>
                        <div class="table-subtitle">{{ $education->degree }}</div>
                    </td>
                    <td>
                        {{ $education->start_date->format('Y') }} - {{ $education->end_date ? $education->end_date->format('Y') : 'Present' }}
                    </td>
                    <td>
                        {{ $education->gpa ?? '-' }}
                    </td>
                    <td>
                        <div class="table-actions">
                            <a href="{{ route('admin.education.edit', $education) }}" class="action-btn" title="Edit">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="{{ route('admin.education.destroy', $education) }}" method="POST" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this?')">
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
                        <i class="fas fa-graduation-cap" style="font-size: 32px; margin-bottom: 12px; display: block; opacity: 0.5;"></i>
                        No education records found.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
