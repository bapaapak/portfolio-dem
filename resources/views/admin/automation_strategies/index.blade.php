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

@foreach(['short' => 'Short Term Strategy', 'middle' => 'Middle Term Strategy', 'long' => 'Long Term Strategy'] as $term => $label)
<div class="card mb-4">
    <div class="card-header">
        <h3><i class="fas fa-chart-line"></i> {{ $label }}</h3>
    </div>
    <div class="card-body">
        @php
            $termStrategies = $strategies[$term] ?? collect();
        @endphp
        
        @if($termStrategies->count() > 0)
        <table class="data-table">
            <thead>
                <tr>
                    <th>Kategori</th>
                    <th>Judul</th>
                    <th>Items</th>
                    <th>Status</th>
                    <th>Order</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @foreach($termStrategies as $strategy)
                <tr>
                    <td>
                        <span class="badge {{ $strategy->category == 'manufacturing' ? 'badge-primary' : 'badge-info' }}">
                            {{ $strategy->category_label }}
                        </span>
                    </td>
                    <td><strong>{{ $strategy->title }}</strong></td>
                    <td>
                        @if($strategy->items && count($strategy->items) > 0)
                            <ul class="items-list">
                                @foreach(array_slice($strategy->items, 0, 3) as $item)
                                    <li>{{ $item }}</li>
                                @endforeach
                                @if(count($strategy->items) > 3)
                                    <li class="text-muted">... +{{ count($strategy->items) - 3 }} more</li>
                                @endif
                            </ul>
                        @else
                            <span class="text-muted">-</span>
                        @endif
                    </td>
                    <td>
                        @if($strategy->is_active)
                            <span class="badge badge-success">Aktif</span>
                        @else
                            <span class="badge badge-secondary">Nonaktif</span>
                        @endif
                    </td>
                    <td>{{ $strategy->order }}</td>
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
        <div class="empty-state-small">
            <p class="text-muted">Belum ada strategi untuk {{ $label }}</p>
        </div>
        @endif
    </div>
</div>
@endforeach

@if($strategies->flatten()->count() === 0)
<div class="card">
    <div class="card-body">
        <div class="empty-state">
            <i class="fas fa-cogs"></i>
            <h3>Belum ada strategi</h3>
            <p>Mulai dengan menambahkan strategi otomasi & digitalisasi pertama Anda.</p>
            <a href="{{ route('admin.automation-strategies.create') }}" class="btn btn-primary">
                <i class="fas fa-plus"></i> Tambah Strategi Pertama
            </a>
        </div>
    </div>
</div>
@endif

@push('styles')
<style>
    .items-list {
        margin: 0;
        padding-left: 16px;
        font-size: 13px;
    }
    .items-list li {
        margin-bottom: 2px;
    }
    .inline {
        display: inline;
    }
    .text-muted {
        color: #718096;
    }
    .badge-primary {
        background: #3182ce;
    }
    .badge-info {
        background: #00b5d8;
    }
    .empty-state-small {
        text-align: center;
        padding: 20px;
    }
    .card-header h3 {
        margin: 0;
        font-size: 18px;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .mb-4 {
        margin-bottom: 24px;
    }
</style>
@endpush
@endsection
