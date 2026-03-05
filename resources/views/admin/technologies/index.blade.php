@extends('admin.layouts.app')

@section('title', 'Manage Technologies')

@section('content')
<div class="page-header">
    <div class="page-header-row">
        <div>
            <h1>Tech Stack</h1>
            <p>Manage technologies displayed on your portfolio.</p>
        </div>
        <a href="{{ route('admin.technologies.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Add Technology
        </a>
    </div>
</div>

<div class="data-table">
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Icon</th>
                <th>Order</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($technologies as $technology)
                <tr>
                    <td>
                        <div class="table-title">{{ $technology->name }}</div>
                    </td>
                    <td>
                        <i class="{{ $technology->icon }}" style="font-size: 24px; color: var(--primary);"></i>
                        <small style="display: block; color: var(--text-secondary); margin-top: 4px;">{{ $technology->icon }}</small>
                    </td>
                    <td>
                        {{ $technology->order }}
                    </td>
                    <td>
                        @if($technology->is_active)
                            <span class="badge badge-success">Active</span>
                        @else
                            <span class="badge badge-secondary">Inactive</span>
                        @endif
                    </td>
                    <td>
                        <div class="table-actions">
                            <a href="{{ route('admin.technologies.edit', $technology) }}" class="action-btn" title="Edit">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="{{ route('admin.technologies.destroy', $technology) }}" method="POST" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this technology?')">
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
                        <i class="fas fa-code" style="font-size: 32px; margin-bottom: 12px; display: block; opacity: 0.5;"></i>
                        No technologies found. Add your first technology.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
