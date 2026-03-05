@extends('admin.layouts.app')

@section('title', 'Detail Pesan')

@section('content')
<div class="page-header">
    <div class="page-header-row">
        <div>
            <h1>Detail Pesan</h1>
            <p>Dari {{ $message->name }}</p>
        </div>
        <a href="{{ route('admin.messages.index') }}" class="btn btn-outline">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
    </div>
</div>

<div class="form-card">
    <div class="form-section">
        <div class="form-row">
            <div class="form-group">
                <label>Nama</label>
                <div class="form-control" style="background: var(--bg-card);">{{ $message->name }}</div>
            </div>
            <div class="form-group">
                <label>Email</label>
                <div class="form-control" style="background: var(--bg-card);">
                    <a href="mailto:{{ $message->email }}" style="color: var(--primary);">{{ $message->email }}</a>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Subjek</label>
                <div class="form-control" style="background: var(--bg-card);">{{ $message->subject ?? 'No Subject' }}</div>
            </div>
            <div class="form-group">
                <label>Tanggal</label>
                <div class="form-control" style="background: var(--bg-card);">{{ $message->created_at->format('d M Y, H:i') }}</div>
            </div>
        </div>

        <div class="form-group">
            <label>Pesan</label>
            <div class="form-control" style="background: var(--bg-card); min-height: 150px; white-space: pre-wrap;">{{ $message->message }}</div>
        </div>
    </div>

    <div class="form-actions">
        <a href="mailto:{{ $message->email }}" class="btn btn-primary">
            <i class="fas fa-reply"></i> Balas via Email
        </a>
        @php 
            $profile = \App\Models\Profile::first();
            $waNumber = $profile->whatsapp ?? '6281234567890';
        @endphp
        <a href="https://wa.me/{{ $waNumber }}?text=Halo {{ $message->name }}, terima kasih sudah menghubungi. " target="_blank" class="btn btn-success">
            <i class="fab fa-whatsapp"></i> Balas via WhatsApp
        </a>
        <form action="{{ route('admin.messages.destroy', $message) }}" method="POST" style="display: inline;" onsubmit="return confirm('Hapus pesan ini?')">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-danger">
                <i class="fas fa-trash"></i> Hapus
            </button>
        </form>
    </div>
</div>
@endsection
