@extends('admin.layouts.app')

@section('title', 'Generate CV')

@section('content')
<div class="page-header">
    <div class="header-title">
        <h1>Generate CV</h1>
        <p>Buat CV profesional dari data yang telah Anda input</p>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <div class="cv-info-grid">
            <div class="cv-info-item">
                <i class="fas fa-user-circle"></i>
                <div class="cv-info-content">
                    <h4>Profil</h4>
                    <p>{{ $profile ? $profile->name : 'Belum diisi' }}</p>
                </div>
                <span class="cv-info-status {{ $profile && $profile->name ? 'complete' : 'incomplete' }}">
                    {{ $profile && $profile->name ? '✓' : '!' }}
                </span>
            </div>
            
            <div class="cv-info-item">
                <i class="fas fa-briefcase"></i>
                <div class="cv-info-content">
                    <h4>Pengalaman Kerja</h4>
                    <p>{{ $experiences->count() }} pengalaman</p>
                </div>
                <span class="cv-info-status {{ $experiences->count() > 0 ? 'complete' : 'incomplete' }}">
                    {{ $experiences->count() > 0 ? '✓' : '!' }}
                </span>
            </div>
            
            <div class="cv-info-item">
                <i class="fas fa-graduation-cap"></i>
                <div class="cv-info-content">
                    <h4>Pendidikan</h4>
                    <p>{{ $educations->count() }} pendidikan</p>
                </div>
                <span class="cv-info-status {{ $educations->count() > 0 ? 'complete' : 'incomplete' }}">
                    {{ $educations->count() > 0 ? '✓' : '!' }}
                </span>
            </div>
            
            <div class="cv-info-item">
                <i class="fas fa-cogs"></i>
                <div class="cv-info-content">
                    <h4>Hard Skills</h4>
                    <p>{{ $technicalSkills->count() }} skill</p>
                </div>
                <span class="cv-info-status {{ $technicalSkills->count() > 0 ? 'complete' : 'incomplete' }}">
                    {{ $technicalSkills->count() > 0 ? '✓' : '!' }}
                </span>
            </div>
            
            <div class="cv-info-item">
                <i class="fas fa-users"></i>
                <div class="cv-info-content">
                    <h4>Soft Skills</h4>
                    <p>{{ $softSkills->count() }} skill</p>
                </div>
                <span class="cv-info-status {{ $softSkills->count() > 0 ? 'complete' : 'incomplete' }}">
                    {{ $softSkills->count() > 0 ? '✓' : '!' }}
                </span>
            </div>
            
            <div class="cv-info-item">
                <i class="fas fa-certificate"></i>
                <div class="cv-info-content">
                    <h4>Sertifikasi</h4>
                    <p>{{ $certifications->count() }} sertifikasi</p>
                </div>
                <span class="cv-info-status {{ $certifications->count() > 0 ? 'complete' : 'incomplete' }}">
                    {{ $certifications->count() > 0 ? '✓' : '!' }}
                </span>
            </div>
        </div>

        <div class="cv-actions">
            <a href="{{ route('admin.cv.preview') }}" class="btn btn-primary btn-lg" target="_blank">
                <i class="fas fa-eye"></i> Preview CV
            </a>
            <button onclick="window.open('{{ route('admin.cv.preview') }}', '_blank').print()" class="btn btn-success btn-lg">
                <i class="fas fa-file-pdf"></i> Cetak / Simpan PDF
            </button>
        </div>
        
        <div class="cv-tips">
            <h4><i class="fas fa-lightbulb"></i> Tips</h4>
            <ul>
                <li>Pastikan semua data profil sudah lengkap di menu <a href="{{ route('admin.settings') }}">Settings</a></li>
                <li>Tambahkan pengalaman kerja di menu <a href="{{ route('admin.experiences.index') }}">Experience</a></li>
                <li>Tambahkan pendidikan di menu <a href="{{ route('admin.education.index') }}">Education</a></li>
                <li>Untuk menyimpan sebagai PDF, klik "Cetak / Simpan PDF" lalu pilih "Save as PDF" pada dialog print</li>
            </ul>
        </div>
    </div>
</div>
@endsection

@push('styles')
<style>
    .cv-info-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 16px;
        margin-bottom: 30px;
    }
    
    .cv-info-item {
        display: flex;
        align-items: center;
        gap: 16px;
        padding: 20px;
        background: #f9fafb;
        border-radius: 12px;
        border: 1px solid #e5e7eb;
    }
    
    .cv-info-item i {
        font-size: 24px;
        color: #5FCECE;
        width: 40px;
        text-align: center;
    }
    
    .cv-info-content {
        flex: 1;
    }
    
    .cv-info-content h4 {
        font-size: 14px;
        font-weight: 600;
        color: #1f2937;
        margin-bottom: 4px;
    }
    
    .cv-info-content p {
        font-size: 13px;
        color: #6b7280;
        margin: 0;
    }
    
    .cv-info-status {
        width: 28px;
        height: 28px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        font-size: 14px;
    }
    
    .cv-info-status.complete {
        background: #d1fae5;
        color: #059669;
    }
    
    .cv-info-status.incomplete {
        background: #fef3c7;
        color: #d97706;
    }
    
    .cv-actions {
        display: flex;
        gap: 16px;
        justify-content: center;
        margin: 30px 0;
        padding: 30px 0;
        border-top: 1px solid #e5e7eb;
        border-bottom: 1px solid #e5e7eb;
    }
    
    .cv-actions .btn-lg {
        padding: 14px 32px;
        font-size: 16px;
        font-weight: 600;
        border-radius: 10px;
        display: inline-flex;
        align-items: center;
        gap: 10px;
    }
    
    .cv-actions .btn-success {
        background: #059669;
        color: white;
        border: none;
    }
    
    .cv-actions .btn-success:hover {
        background: #047857;
    }
    
    .cv-tips {
        background: #eff6ff;
        border-radius: 12px;
        padding: 20px;
        margin-top: 20px;
    }
    
    .cv-tips h4 {
        font-size: 14px;
        font-weight: 600;
        color: #1e40af;
        margin-bottom: 12px;
        display: flex;
        align-items: center;
        gap: 8px;
    }
    
    .cv-tips ul {
        margin: 0;
        padding-left: 20px;
        color: #3b82f6;
        font-size: 13px;
    }
    
    .cv-tips ul li {
        margin-bottom: 6px;
    }
    
    .cv-tips a {
        color: #1e40af;
        text-decoration: underline;
    }
</style>
@endpush
