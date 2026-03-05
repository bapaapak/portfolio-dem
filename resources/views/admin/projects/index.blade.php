@extends('admin.layouts.app')

@section('title', 'Kelola Proyek')

@section('content')
<div class="page-header">
    <div class="page-header-row">
        <div>
            <h1>Manajemen Proyek</h1>
            <p>Kelola, edit, dan pantau semua proyek portofolio Anda.</p>
        </div>
        <a href="{{ route('admin.projects.create') }}" class="btn btn-primary">
            <i class="fas fa-plus"></i> Tambah Proyek Baru
        </a>
    </div>
</div>

<!-- Stats -->
<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-icon blue">
            <i class="fas fa-folder"></i>
        </div>
        <div class="stat-content">
            <h3>Total Proyek</h3>
            <div class="stat-value">{{ $projects->total() }}</div>
            <div class="stat-change"><i class="fas fa-arrow-up"></i> +2 bulan ini</div>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon green">
            <i class="fas fa-globe"></i>
        </div>
        <div class="stat-content">
            <h3>Publik</h3>
            <div class="stat-value">{{ \App\Models\Project::where('status', 'published')->count() }}</div>
            <div style="height: 6px; background: var(--bg-card); border-radius: 3px; margin-top: 8px;">
                <div style="height: 100%; width: 80%; background: var(--accent-green); border-radius: 3px;"></div>
            </div>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon orange">
            <i class="fas fa-file-alt"></i>
        </div>
        <div class="stat-content">
            <h3>Draf</h3>
            <div class="stat-value">{{ \App\Models\Project::where('status', 'draft')->count() }}</div>
            <a href="#" style="font-size: 12px; background: var(--accent-orange); color: var(--bg-primary); padding: 4px 10px; border-radius: 4px; margin-top: 8px; display: inline-block;">Butuh Review</a>
        </div>
    </div>
</div>

<!-- Table Controls -->
<div class="table-controls">
    <form action="{{ route('admin.projects.index') }}" method="GET" style="flex: 1; display: flex; gap: 12px;">
        <div class="topbar-search" style="flex: 1; max-width: 400px;">
            <i class="fas fa-search"></i>
            <input type="text" name="search" placeholder="Cari berdasarkan judul, klien, atau tag..." value="{{ request('search') }}">
        </div>
        <select name="category" class="form-control" style="width: 180px;" onchange="this.form.submit()">
            <option value="all">Semua Kategori</option>
            @foreach($categories as $category)
                <option value="{{ $category->id }}" {{ request('category') == $category->id ? 'selected' : '' }}>
                    {{ $category->name }}
                </option>
            @endforeach
        </select>
        <select name="sort" class="form-control" style="width: 140px;" onchange="this.form.submit()">
            <option value="created_at" {{ request('sort') == 'created_at' ? 'selected' : '' }}>Terbaru</option>
            <option value="title" {{ request('sort') == 'title' ? 'selected' : '' }}>Nama</option>
        </select>
    </form>
</div>

<!-- Projects Table -->
<div class="data-table">
    <table>
        <thead>
            <tr>
                <th>Cover</th>
                <th>Project Info</th>
                <th>Category</th>
                <th>Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($projects as $project)
                <tr>
                    <td>
                        <div class="table-thumbnail">
                            @if($project->thumbnail)
                                <img src="{{ asset('storage/' . $project->thumbnail) }}" alt="{{ $project->title }}">
                            @else
                                <div class="table-thumbnail-placeholder">
                                    <i class="fas fa-image"></i>
                                </div>
                            @endif
                        </div>
                    </td>
                    <td>
                        <div class="table-title">{{ $project->title }}</div>
                        <div class="table-subtitle">Client: {{ $project->client ?? '-' }}</div>
                    </td>
                    <td>
                        <span class="category-badge">{{ $project->category->name ?? 'Uncategorized' }}</span>
                    </td>
                    <td>{{ $project->created_at->format('M d, Y') }}</td>
                    <td>
                        <span class="status-badge {{ $project->status }}">
                            {{ $project->status == 'published' ? 'Publik' : 'Draf' }}
                        </span>
                    </td>
                    <td>
                        <div class="table-actions">
                            <a href="{{ route('projects.show', $project->slug) }}" class="action-btn" title="View" target="_blank">
                                <i class="fas fa-external-link-alt"></i>
                            </a>
                            <a href="{{ route('admin.projects.edit', $project) }}" class="action-btn" title="Edit">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="{{ route('admin.projects.destroy', $project) }}" method="POST" style="display: inline;" onsubmit="return confirm('Yakin ingin menghapus proyek ini?')">
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
                    <td colspan="6" style="text-align: center; padding: 40px; color: var(--text-secondary);">
                        <i class="fas fa-folder-open" style="font-size: 32px; margin-bottom: 12px; display: block; opacity: 0.5;"></i>
                        Tidak ada proyek ditemukan.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
    
    @if($projects->hasPages())
        <div class="table-footer">
            <div class="table-info">
                Menampilkan {{ $projects->firstItem() }} sampai {{ $projects->lastItem() }} dari {{ $projects->total() }} proyek
            </div>
            <div class="table-pagination">
                @if($projects->onFirstPage())
                    <span class="page-btn" style="opacity: 0.5;">Sebelumnya</span>
                @else
                    <a href="{{ $projects->previousPageUrl() }}" class="page-btn">Sebelumnya</a>
                @endif
                
                @foreach($projects->getUrlRange(1, $projects->lastPage()) as $page => $url)
                    <a href="{{ $url }}" class="page-btn {{ $projects->currentPage() == $page ? 'active' : '' }}">{{ $page }}</a>
                @endforeach
                
                @if($projects->hasMorePages())
                    <a href="{{ $projects->nextPageUrl() }}" class="page-btn">Selanjutnya</a>
                @else
                    <span class="page-btn" style="opacity: 0.5;">Selanjutnya</span>
                @endif
            </div>
        </div>
    @endif
</div>
@endsection
