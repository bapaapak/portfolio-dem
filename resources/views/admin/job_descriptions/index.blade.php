@extends('admin.layouts.app')

@section('title', 'Job Description & Activity')

@section('content')
<div class="content-header">
    <div class="header-left">
        <h1>Job Description & Activity</h1>
        <p class="subtitle">Kelola job description dan activity jobs.</p>
    </div>
    <div class="header-actions">
        <a href="{{ route('admin.job-descriptions.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Tambah Item
        </a>
    </div>
</div>

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px;">

    <!-- Job Descriptions -->
    <div class="card">
        <div class="card-header">
            <h3 class="card-title"><i class="fas fa-file-alt mr-2" style="color:#3b82f6;"></i>Job Descriptions</h3>
        </div>
        <div class="card-body" style="padding:0;">
            @if($descriptions->count() > 0)
            <table class="data-table">
                <thead>
                    <tr>
                        <th style="width:60px;">Order</th>
                        <th>Judul</th>
                        <th style="width:90px;">Status</th>
                        <th style="width:90px;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($descriptions as $item)
                    <tr>
                        <td>{{ $item->order }}</td>
                        <td><strong>{{ $item->title }}</strong></td>
                        <td>
                            @if($item->is_active)
                                <span class="badge badge-success">Aktif</span>
                            @else
                                <span class="badge badge-secondary">Nonaktif</span>
                            @endif
                        </td>
                        <td>
                            <div class="action-buttons">
                                <a href="{{ route('admin.job-descriptions.edit', $item) }}" class="btn btn-sm btn-secondary" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="{{ route('admin.job-descriptions.destroy', $item) }}" method="POST" class="inline" onsubmit="return confirm('Yakin ingin menghapus item ini?')">
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
                <i class="fas fa-file-alt"></i>
                <h3>Belum ada job description</h3>
                <p>Tambahkan job description pertama Anda.</p>
            </div>
            @endif
        </div>
    </div>

    <!-- Activity Jobs -->
    <div class="card">
        <div class="card-header">
            <h3 class="card-title"><i class="fas fa-tasks mr-2" style="color:#10b981;"></i>Activity Jobs</h3>
        </div>
        <div class="card-body" style="padding:0;">
            @if($activities->count() > 0)
            <table class="data-table">
                <thead>
                    <tr>
                        <th style="width:70px;">Tahun</th>
                        <th style="width:50px;">Order</th>
                        <th>Judul</th>
                        <th style="width:90px;">Status</th>
                        <th style="width:90px;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($activities as $item)
                    <tr>
                        <td>
                            @if($item->year)
                                <span class="badge" style="background:rgba(16,185,129,0.15);color:#065f46;font-weight:700;">{{ $item->year_label }}</span>
                            @else
                                <span style="color:#9ca3af;">—</span>
                            @endif
                        </td>
                        <td>{{ $item->order }}</td>
                        <td><strong>{{ $item->title }}</strong></td>
                        <td>
                            @if($item->is_active)
                                <span class="badge badge-success">Aktif</span>
                            @else
                                <span class="badge badge-secondary">Nonaktif</span>
                            @endif
                        </td>
                        <td>
                            <div class="action-buttons">
                                <a href="{{ route('admin.job-descriptions.edit', $item) }}" class="btn btn-sm btn-secondary" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="{{ route('admin.job-descriptions.destroy', $item) }}" method="POST" class="inline" onsubmit="return confirm('Yakin ingin menghapus item ini?')">
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
                <i class="fas fa-clipboard-list"></i>
                <h3>Belum ada activity job</h3>
                <p>Tambahkan activity job pertama Anda.</p>
            </div>
            @endif
        </div>
    </div>

</div>

@push('styles')
<style>
    .inline { display: inline; }
    .mr-2 { margin-right: 0.5rem; }
    .mb-4 { margin-bottom: 1rem; }
    .alert {
        padding: 12px 16px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 0.9rem;
    }
    .alert-success {
        background: rgba(16, 185, 129, 0.12);
        border: 1px solid rgba(16, 185, 129, 0.3);
        color: #10b981;
    }
    .card-header {
        padding: 16px 20px;
        border-bottom: 1px solid rgba(255,255,255,0.08);
    }
    .card-title {
        margin: 0;
        font-size: 1rem;
        font-weight: 600;
    }
    @media (max-width: 900px) {
        .jd-admin-grid {
            grid-template-columns: 1fr !important;
        }
    }
</style>
@endpush

@endsection
