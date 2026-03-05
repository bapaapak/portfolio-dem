@extends('admin.layouts.app')

@section('title', 'Pesan')

@section('content')
<div class="page-header">
    <h1>Pesan Masuk</h1>
    <p>Kelola pesan dari pengunjung website</p>
</div>

<div class="message-list">
    @forelse($messages as $message)
        <div class="message-item {{ $message->is_read ? '' : 'unread' }}">
            <div class="message-avatar">
                {{ strtoupper(substr($message->name, 0, 1)) }}
            </div>
            <div class="message-content">
                <div class="message-header">
                    <div>
                        <div class="message-sender">{{ $message->name }}</div>
                        <div class="message-email">{{ $message->email }}</div>
                    </div>
                    <div class="message-date">{{ $message->created_at->diffForHumans() }}</div>
                </div>
                <div class="message-subject">{{ $message->subject ?? 'No Subject' }}</div>
                <div class="message-preview">{{ $message->message }}</div>
            </div>
            <div class="message-actions">
                <a href="{{ route('admin.messages.show', $message) }}" class="action-btn" title="View">
                    <i class="fas fa-eye"></i>
                </a>
                @unless($message->is_read)
                    <form action="{{ route('admin.messages.read', $message) }}" method="POST" style="display: inline;">
                        @csrf
                        @method('PATCH')
                        <button type="submit" class="action-btn" title="Mark as Read">
                            <i class="fas fa-check"></i>
                        </button>
                    </form>
                @endunless
                <form action="{{ route('admin.messages.destroy', $message) }}" method="POST" style="display: inline;" onsubmit="return confirm('Hapus pesan ini?')">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="action-btn danger" title="Delete">
                        <i class="fas fa-trash"></i>
                    </button>
                </form>
            </div>
        </div>
    @empty
        <div style="text-align: center; padding: 60px; color: var(--text-secondary); background: var(--bg-secondary); border-radius: 16px; border: 1px solid var(--border-color);">
            <i class="fas fa-inbox" style="font-size: 48px; margin-bottom: 16px; opacity: 0.3;"></i>
            <p>Belum ada pesan masuk.</p>
        </div>
    @endforelse
</div>

@if($messages->hasPages())
    <div style="display: flex; justify-content: center; margin-top: 24px;">
        {{ $messages->links() }}
    </div>
@endif
@endsection
