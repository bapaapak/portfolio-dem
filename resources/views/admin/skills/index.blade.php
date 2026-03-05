@extends('admin.layouts.app')

@section('title', 'Kelola Skills')

@section('content')
<div class="page-header">
    <div class="page-header-row">
        <div>
            <h1>Manajemen Skills</h1>
            <p>Kelola Technical dan Soft Skills yang ditampilkan di halaman depan.</p>
        </div>
        <a href="{{ route('admin.skills.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Tambah Skill Baru
        </a>
    </div>
</div>

<div class="data-table">
    <table>
        <thead>
            <tr>
                <th>Order</th>
                <th>Category</th>
                <th>Items</th>
                <th>Type</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($skills as $skill)
                <tr>
                    <td style="width: 80px; text-align: center;">{{ $skill->order }}</td>
                    <td>
                        <div class="table-title">{{ $skill->category }}</div>
                    </td>
                    <td>{{ Str::limit($skill->items, 60) }}</td>
                    <td>
                        <span class="status-badge {{ $skill->type === 'technical' ? 'published' : 'draft' }}" style="background: {{ $skill->type === 'technical' ? '#e0f2fe' : '#dcfce7' }}; color: {{ $skill->type === 'technical' ? '#0369a1' : '#15803d' }};">
                            {{ ucfirst($skill->type) }}
                        </span>
                    </td>
                    <td>
                        <div class="table-actions">
                            <a href="{{ route('admin.skills.edit', $skill) }}" class="action-btn" title="Edit">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="{{ route('admin.skills.destroy', $skill) }}" method="POST" style="display: inline;" onsubmit="return confirm('Yakin ingin menghapus skill ini?');">
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
                        <i class="fas fa-list-ul" style="font-size: 32px; margin-bottom: 12px; display: block; opacity: 0.5;"></i>
                        Belum ada skill yang ditambahkan.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
