@extends('admin.layouts.app')

@section('title', 'Aspirasi Karir')

@section('content')
<div class="page-header">
    <div class="header-title">
        <h1>Aspirasi Karir & Milestone</h1>
        <p>Kelola visi masa depan dan target pencapaian karir Anda.</p>
    </div>
</div>

<div class="form-card">
    <form action="{{ route('admin.career-aspiration.update') }}" method="POST">
        @csrf
        @method('PUT')
        
        <div class="form-section">
            <h3 class="form-section-title">Visi Masa Depan</h3>
            <div class="form-group">
                <label for="career_aspiration">Pernyataan Aspirasi <span class="text-red-500">*</span></label>
                <textarea name="career_aspiration" id="career_aspiration" class="form-control min-h-[120px]" placeholder="Contoh: Menjadi arsitek perangkat lunak kelas dunia...">{{ old('career_aspiration', $profile->career_aspiration) }}</textarea>
                <p class="text-sm text-gray-500 mt-1">Deskripsikan tujuan jangka panjang dan visi karir Anda.</p>
            </div>
        </div>

        <div class="form-section">
            <div class="flex justify-between items-center mb-4">
                <h3 class="form-section-title mb-0">Milestones</h3>
                <button type="button" class="btn btn-sm btn-outline" onclick="addMilestone()">
                    <i class="fas fa-plus mr-1"></i> Tambah Milestone
                </button>
            </div>
            
            <div id="milestones-container" class="space-y-4">
                @php
                    $milestones = $profile->career_milestones ?? [];
                @endphp
                
                @forelse($milestones as $index => $milestone)
                <div class="milestone-item bg-gray-50 border border-gray-200 rounded-lg p-4 relative group hover:border-blue-300 transition-colors">
                    <button type="button" class="absolute top-4 right-4 text-gray-400 hover:text-red-500 transition-colors" onclick="this.closest('.milestone-item').remove()">
                        <i class="fas fa-trash"></i>
                    </button>
                    
                    <div class="grid grid-cols-1 md:grid-cols-12 gap-4">
                        <div class="md:col-span-3">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Tahun/Periode</label>
                            <input type="text" name="career_milestones[{{ $index }}][year]" class="form-control" value="{{ $milestone['year'] ?? '' }}" placeholder="2025">
                        </div>
                        <div class="md:col-span-9">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Judul Pencapaian</label>
                            <input type="text" name="career_milestones[{{ $index }}][title]" class="form-control" value="{{ $milestone['title'] ?? '' }}" placeholder="Contoh: Senior Engineer">
                        </div>
                        <div class="md:col-span-12">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Deskripsi Singkat</label>
                            <textarea name="career_milestones[{{ $index }}][description]" class="form-control" rows="3" placeholder="Deskripsi pencapaian (gunakan tanda - untuk bullet points)...">{{ $milestone['description'] ?? '' }}</textarea>
                        </div>
                    </div>
                </div>
                @empty
                <!-- Empty State / Default Item -->
                <div class="milestone-item bg-gray-50 border border-gray-200 rounded-lg p-4 relative group hover:border-blue-300 transition-colors">
                    <button type="button" class="absolute top-4 right-4 text-gray-400 hover:text-red-500 transition-colors" onclick="this.closest('.milestone-item').remove()">
                        <i class="fas fa-trash"></i>
                    </button>
                    <div class="grid grid-cols-1 md:grid-cols-12 gap-4">
                        <div class="md:col-span-3">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Tahun/Periode</label>
                            <input type="text" name="career_milestones[0][year]" class="form-control" placeholder="2025">
                        </div>
                        <div class="md:col-span-9">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Judul Pencapaian</label>
                            <input type="text" name="career_milestones[0][title]" class="form-control" placeholder="Contoh: Senior Engineer">
                        </div>
                        <div class="md:col-span-12">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Deskripsi Singkat</label>
                            <textarea name="career_milestones[0][description]" class="form-control" rows="3" placeholder="Deskripsi pencapaian (gunakan tanda - untuk bullet points)..."></textarea>
                        </div>
                    </div>
                </div>
                @endforelse
            </div>
        </div>

        <div class="form-actions border-t border-gray-100 pt-6 mt-6">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save mr-2"></i> Simpan Perubahan
            </button>
        </div>
    </form>
</div>

<script>
function addMilestone() {
    const container = document.getElementById('milestones-container');
    const index = Date.now(); // Put unix timestamp to ensure unique index for array parsing if items deleted
    
    const div = document.createElement('div');
    div.className = 'milestone-item bg-gray-50 border border-gray-200 rounded-lg p-4 relative group hover:border-blue-300 transition-colors animate-fade-in-up';
    div.innerHTML = `
        <button type="button" class="absolute top-4 right-4 text-gray-400 hover:text-red-500 transition-colors" onclick="this.closest('.milestone-item').remove()">
            <i class="fas fa-trash"></i>
        </button>
        <div class="grid grid-cols-1 md:grid-cols-12 gap-4">
            <div class="md:col-span-3">
                <label class="block text-sm font-medium text-gray-700 mb-1">Tahun/Periode</label>
                <input type="text" name="career_milestones[${index}][year]" class="form-control" placeholder="Year">
            </div>
            <div class="md:col-span-9">
                <label class="block text-sm font-medium text-gray-700 mb-1">Judul Pencapaian</label>
                <input type="text" name="career_milestones[${index}][title]" class="form-control" placeholder="Milestone title">
            </div>
            <div class="md:col-span-12">
                <label class="block text-sm font-medium text-gray-700 mb-1">Deskripsi Singkat</label>
                <textarea name="career_milestones[${index}][description]" class="form-control" rows="3" placeholder="Deskripsi pencapaian (gunakan tanda - untuk bullet points)..."></textarea>
            </div>
        </div>
    `;
    container.appendChild(div);
}
</script>
@endsection
