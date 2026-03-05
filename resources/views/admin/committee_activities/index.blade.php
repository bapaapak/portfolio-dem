@extends('admin.layouts.app')

@section('title', 'Aktivitas Kepanitiaan')

@section('content')
<div class="content-header">
    <div class="header-left">
        <h1>Aktivitas Kepanitiaan</h1>
        <p class="subtitle">Kelola aktivitas kepanitiaan dan kegiatan organisasi</p>
    </div>
    <div class="header-actions">
        <a href="{{ route('admin.committee-activities.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Tambah Aktivitas
        </a>
    </div>
</div>

<div class="card">
    <div class="card-body">
        @if($activities->count() > 0)
        <table class="data-table">
            <thead>
                <tr>
                    <th>Gambar</th>
                    <th>Judul</th>
                    <th>Peran</th>
                    <th>Organisasi</th>
                    <th>Tanggal</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @foreach($activities as $activity)
                <tr>
                    <td>
                        @if($activity->image)
                            <img src="{{ asset('storage/' . $activity->image) }}" alt="{{ $activity->title }}" class="table-image">
                        @else
                            <div class="table-image-placeholder">
                                <i class="fas fa-image"></i>
                            </div>
                        @endif
                    </td>
                    <td>
                        <strong>{{ $activity->title }}</strong>
                        @if($activity->title_en)
                            <div class="text-muted small">{{ $activity->title_en }}</div>
                        @endif
                    </td>
                    <td>{{ $activity->role }}</td>
                    <td>{{ $activity->organization ?? '-' }}</td>
                    <td>{{ $activity->formatted_date }}</td>
                    <td>
                        @if($activity->is_active)
                            <span class="badge badge-success">Aktif</span>
                        @else
                            <span class="badge badge-secondary">Nonaktif</span>
                        @endif
                    </td>
                    <td>
                        <div class="action-buttons">
                            <a href="{{ route('admin.committee-activities.edit', $activity) }}" class="btn btn-sm btn-secondary" title="Edit">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="{{ route('admin.committee-activities.destroy', $activity) }}" method="POST" class="inline" onsubmit="return confirm('Yakin ingin menghapus aktivitas ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-danger" title="Hapus">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        @else
        <div class="empty-state">
            <i class="fas fa-calendar-check"></i>
            <h3>Belum ada aktivitas</h3>
            <p>Mulai dengan menambahkan aktivitas kepanitiaan pertama Anda.</p>
            <a href="{{ route('admin.committee-activities.create') }}" class="btn btn-primary">
                <i class="fas fa-plus"></i> Tambah Aktivitas Pertama
            </a>
        </div>
        @endif
    </div>
</div>

@push('styles')
<style>
    .table-image {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 8px;
    }

    .table-image-placeholder {
        width: 60px;
        height: 60px;
        border-radius: 8px;
        background: #e2e8f0;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #a0aec0;
        font-size: 20px;
    }

    .inline {
        display: inline;
    }

    .text-muted {
        color: #718096;
    }

    .small {
        font-size: 12px;
    }
</style>
@endpush
@endsection
