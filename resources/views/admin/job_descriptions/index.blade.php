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

<!-- Summary Cards -->
<div class="jd-summary-row">
    <div class="jd-summary-card jd-summary-desc">
        <div class="jd-summary-icon"><i class="fas fa-file-alt"></i></div>
        <div class="jd-summary-info">
            <span class="jd-summary-count">{{ $descriptions->count() }}</span>
            <span class="jd-summary-label">Job Descriptions</span>
        </div>
    </div>
    <div class="jd-summary-card jd-summary-act">
        <div class="jd-summary-icon"><i class="fas fa-tasks"></i></div>
        <div class="jd-summary-info">
            <span class="jd-summary-count">{{ $activities->count() }}</span>
            <span class="jd-summary-label">Activity Jobs</span>
        </div>
    </div>
    <div class="jd-summary-card jd-summary-active">
        <div class="jd-summary-icon"><i class="fas fa-check-circle"></i></div>
        <div class="jd-summary-info">
            <span class="jd-summary-count">{{ $descriptions->where('is_active', true)->count() + $activities->where('is_active', true)->count() }}</span>
            <span class="jd-summary-label">Aktif</span>
        </div>
    </div>
</div>

<div class="jd-admin-grid">

    <!-- Job Descriptions -->
    <div class="card">
        <div class="card-header" style="display:flex;align-items:center;gap:10px;border-bottom:2px solid #3b82f6;">
            <i class="fas fa-file-alt" style="color:#3b82f6;font-size:1.1rem;"></i>
            <h3 class="card-title" style="margin:0;font-size:1rem;font-weight:700;">Job Descriptions</h3>
            <span class="jd-count-badge jd-count-blue">{{ $descriptions->count() }}</span>
        </div>
        <div class="card-body" style="padding:0;">
            @if($descriptions->count() > 0)
            <table class="data-table">
                <thead>
                    <tr>
                        <th style="width:55px;">Order</th>
                        <th>Judul</th>
                        <th style="width:80px;">Status</th>
                        <th style="width:90px;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($descriptions as $item)
                    <tr>
                        <td><span class="jd-order-num">{{ $item->order }}</span></td>
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
        <div class="card-header" style="display:flex;align-items:center;gap:10px;border-bottom:2px solid #10b981;">
            <i class="fas fa-tasks" style="color:#10b981;font-size:1.1rem;"></i>
            <h3 class="card-title" style="margin:0;font-size:1rem;font-weight:700;">Activity Jobs</h3>
            <span class="jd-count-badge jd-count-green">{{ $activities->count() }}</span>
        </div>
        <div class="card-body" style="padding:0;">
            @if($activities->count() > 0)
            <table class="data-table">
                <thead>
                    <tr>
                        <th style="width:60px;">Order</th>
                        <th>Judul</th>
                        <th style="width:140px;">Periode</th>
                        <th style="width:90px;">Durasi</th>
                        <th style="width:80px;">Status</th>
                        <th style="width:90px;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($activities as $item)
                    <tr>
                        <td><span class="jd-order-num">{{ $item->order }}</span></td>
                        <td><strong>{{ $item->title }}</strong></td>
                        <td>
                            @if($item->year)
                                <span class="jd-period-badge">{{ $item->year_label }}</span>
                            @else
                                <span style="color:#6b7280;">—</span>
                            @endif
                        </td>
                        <td>
                            @if($item->duration_label)
                                <span class="jd-duration-text">{{ $item->duration_label }}</span>
                            @else
                                <span style="color:#6b7280;">—</span>
                            @endif
                        </td>
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

    /* Summary Row */
    .jd-summary-row {
        display: flex; gap: 16px; margin-bottom: 24px;
    }
    .jd-summary-card {
        flex: 1; display: flex; align-items: center; gap: 14px;
        padding: 16px 20px; border-radius: 12px;
        background: rgba(255,255,255,0.04);
        border: 1px solid rgba(255,255,255,0.08);
    }
    .jd-summary-icon {
        width: 44px; height: 44px; border-radius: 10px;
        display: flex; align-items: center; justify-content: center;
        font-size: 1.2rem;
    }
    .jd-summary-desc .jd-summary-icon { background: rgba(59,130,246,0.15); color: #60a5fa; }
    .jd-summary-act .jd-summary-icon { background: rgba(16,185,129,0.15); color: #34d399; }
    .jd-summary-active .jd-summary-icon { background: rgba(250,204,21,0.15); color: #facc15; }
    .jd-summary-info { display: flex; flex-direction: column; }
    .jd-summary-count { font-size: 1.5rem; font-weight: 800; line-height: 1; }
    .jd-summary-label { font-size: 0.78rem; color: #9ca3af; margin-top: 2px; }

    /* Grid */
    .jd-admin-grid {
        display: grid; grid-template-columns: 1fr 1.4fr; gap: 24px;
    }

    /* Count badges */
    .jd-count-badge {
        font-size: 0.72rem; font-weight: 700; padding: 2px 8px;
        border-radius: 999px; margin-left: auto;
    }
    .jd-count-blue { background: rgba(59,130,246,0.15); color: #60a5fa; }
    .jd-count-green { background: rgba(16,185,129,0.15); color: #34d399; }

    /* Order number */
    .jd-order-num {
        display: inline-flex; align-items: center; justify-content: center;
        width: 28px; height: 28px; border-radius: 8px; font-weight: 700; font-size: 0.85rem;
        background: rgba(255,255,255,0.06); color: #d1d5db;
    }

    /* Period badge */
    .jd-period-badge {
        display: inline-block; font-size: 0.75rem; font-weight: 600;
        padding: 3px 10px; border-radius: 6px;
        background: rgba(16,185,129,0.12); color: #34d399;
        line-height: 1.4; white-space: nowrap;
    }

    /* Duration text */
    .jd-duration-text {
        font-size: 0.78rem; font-weight: 600; color: #a78bfa;
    }

    .card-header {
        padding: 14px 20px;
    }
    .card-title {
        margin: 0;
        font-size: 1rem;
        font-weight: 600;
    }

    @media (max-width: 900px) {
        .jd-admin-grid { grid-template-columns: 1fr !important; }
        .jd-summary-row { flex-direction: column; }
    }
</style>
@endpush

@endsection
