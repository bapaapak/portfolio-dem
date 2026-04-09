@extends('admin.layouts.app')

@section('title', 'Strategi Otomasi & Digitalisasi')

@section('content')
<div class="content-header">
    <div class="header-left">
        <h1>Strategi Otomasi & Digitalisasi</h1>
        <p class="subtitle">Kelola strategi manufacturing, digitalisasi, dan otomasi</p>
    </div>
    <div class="header-actions">
        <a href="{{ route('admin.automation-strategies.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Tambah Strategi
        </a>
    </div>
</div>

<!-- Summary Cards -->
<div class="as-summary-row">
    @php
        $allStrategies = $strategies->flatten();
        $shortCount = ($strategies['short'] ?? collect())->count();
        $middleCount = ($strategies['middle'] ?? collect())->count();
        $longCount = ($strategies['long'] ?? collect())->count();
    @endphp
    <div class="as-summary-card">
        <div class="as-summary-icon as-icon-short"><i class="fas fa-bolt"></i></div>
        <div class="as-summary-info">
            <span class="as-summary-count">{{ $shortCount }}</span>
            <span class="as-summary-label">Short Term</span>
        </div>
    </div>
    <div class="as-summary-card">
        <div class="as-summary-icon as-icon-middle"><i class="fas fa-chart-line"></i></div>
        <div class="as-summary-info">
            <span class="as-summary-count">{{ $middleCount }}</span>
            <span class="as-summary-label">Middle Term</span>
        </div>
    </div>
    <div class="as-summary-card">
        <div class="as-summary-icon as-icon-long"><i class="fas fa-rocket"></i></div>
        <div class="as-summary-info">
            <span class="as-summary-count">{{ $longCount }}</span>
            <span class="as-summary-label">Long Term</span>
        </div>
    </div>
    <div class="as-summary-card">
        <div class="as-summary-icon as-icon-total"><i class="fas fa-layer-group"></i></div>
        <div class="as-summary-info">
            <span class="as-summary-count">{{ $allStrategies->count() }}</span>
            <span class="as-summary-label">Total Strategi</span>
        </div>
    </div>
</div>

@foreach(['short' => ['Short Term Strategy', 'fas fa-bolt', '#f59e0b'], 'middle' => ['Middle Term Strategy', 'fas fa-chart-line', '#3b82f6'], 'long' => ['Long Term Strategy', 'fas fa-rocket', '#8b5cf6']] as $term => [$label, $icon, $color])
@php $termStrategies = $strategies[$term] ?? collect(); @endphp
<div class="card as-term-card">
    <div class="card-header" style="display:flex;align-items:center;gap:10px;border-bottom:2px solid {{ $color }};">
        <i class="{{ $icon }}" style="color:{{ $color }};font-size:1.1rem;"></i>
        <h3 class="card-title" style="margin:0;font-size:1rem;font-weight:700;">{{ $label }}</h3>
        <span class="as-count-badge" style="background:{{ $color }}22;color:{{ $color }};">{{ $termStrategies->count() }}</span>
    </div>
    <div class="card-body" style="padding:0;">
        @if($termStrategies->count() > 0)
        <table class="data-table">
            <thead>
                <tr>
                    <th style="width:55px;">Order</th>
                    <th style="width:140px;">Kategori</th>
                    <th style="width:180px;">Judul</th>
                    <th>Items</th>
                    <th style="width:80px;">Status</th>
                    <th style="width:90px;">Aksi</th>
                </tr>
            </thead>
            <tbody>
                @foreach($termStrategies as $strategy)
                <tr>
                    <td><span class="as-order-num">{{ $strategy->order }}</span></td>
                    <td>
                        <span class="as-category-badge {{ $strategy->category == 'manufacturing' ? 'as-cat-mfg' : 'as-cat-dig' }}">
                            <i class="{{ $strategy->category == 'manufacturing' ? 'fas fa-industry' : 'fas fa-microchip' }}"></i>
                            {{ $strategy->category_label }}
                        </span>
                    </td>
                    <td>
                        @if($strategy->title)
                            <strong>{{ $strategy->title }}</strong>
                        @else
                            <span style="color:#6b7280;font-style:italic;">—</span>
                        @endif
                    </td>
                    <td>
                        @if($strategy->items && count($strategy->items) > 0)
                            <ul class="as-items-list">
                                @foreach(array_slice($strategy->items, 0, 2) as $item)
                                    <li>{{ Str::limit($item, 80) }}</li>
                                @endforeach
                                @if(count($strategy->items) > 2)
                                    <li class="as-items-more">+{{ count($strategy->items) - 2 }} lainnya</li>
                                @endif
                            </ul>
                        @else
                            <span style="color:#6b7280;">—</span>
                        @endif
                    </td>
                    <td>
                        @if($strategy->is_active)
                            <span class="badge badge-success">Aktif</span>
                        @else
                            <span class="badge badge-secondary">Nonaktif</span>
                        @endif
                    </td>
                    <td>
                        <div class="action-buttons">
                            <a href="{{ route('admin.automation-strategies.edit', $strategy) }}" class="btn btn-sm btn-secondary" title="Edit">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="{{ route('admin.automation-strategies.destroy', $strategy) }}" method="POST" class="inline" onsubmit="return confirm('Yakin ingin menghapus strategi ini?')">
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
        <div style="text-align:center;padding:24px;color:#6b7280;">
            <p style="margin:0;">Belum ada strategi untuk {{ $label }}</p>
        </div>
        @endif
    </div>
</div>
@endforeach

@push('styles')
<style>
    .inline { display: inline; }

    /* Summary Row */
    .as-summary-row { display: flex; gap: 16px; margin-bottom: 24px; }
    .as-summary-card {
        flex: 1; display: flex; align-items: center; gap: 14px;
        padding: 16px 20px; border-radius: 12px;
        background: rgba(255,255,255,0.04); border: 1px solid rgba(255,255,255,0.08);
    }
    .as-summary-icon {
        width: 44px; height: 44px; border-radius: 10px;
        display: flex; align-items: center; justify-content: center; font-size: 1.2rem;
    }
    .as-icon-short { background: rgba(245,158,11,0.15); color: #f59e0b; }
    .as-icon-middle { background: rgba(59,130,246,0.15); color: #60a5fa; }
    .as-icon-long { background: rgba(139,92,246,0.15); color: #a78bfa; }
    .as-icon-total { background: rgba(16,185,129,0.15); color: #34d399; }
    .as-summary-info { display: flex; flex-direction: column; }
    .as-summary-count { font-size: 1.5rem; font-weight: 800; line-height: 1; }
    .as-summary-label { font-size: 0.78rem; color: #9ca3af; margin-top: 2px; }

    /* Term cards */
    .as-term-card { margin-bottom: 20px; }
    .as-term-card:last-of-type { margin-bottom: 0; }
    .card-header { padding: 14px 20px; }

    /* Count badge */
    .as-count-badge {
        font-size: 0.72rem; font-weight: 700; padding: 2px 8px;
        border-radius: 999px; margin-left: auto;
    }

    /* Order number */
    .as-order-num {
        display: inline-flex; align-items: center; justify-content: center;
        width: 28px; height: 28px; border-radius: 8px; font-weight: 700; font-size: 0.85rem;
        background: rgba(255,255,255,0.06); color: #d1d5db;
    }

    /* Category badge */
    .as-category-badge {
        display: inline-flex; align-items: center; gap: 6px;
        font-size: 0.75rem; font-weight: 600; padding: 4px 10px;
        border-radius: 6px; white-space: nowrap;
    }
    .as-cat-mfg { background: rgba(59,130,246,0.12); color: #60a5fa; }
    .as-cat-dig { background: rgba(6,182,212,0.12); color: #22d3ee; }

    /* Items list */
    .as-items-list {
        margin: 0; padding-left: 16px; font-size: 0.8rem; line-height: 1.5;
        color: #d1d5db;
    }
    .as-items-list li { margin-bottom: 2px; }
    .as-items-more { color: #9ca3af; font-style: italic; list-style: none; margin-left: -16px; }

    @media (max-width: 900px) {
        .as-summary-row { flex-direction: column; }
    }
</style>
@endpush
@endsection
