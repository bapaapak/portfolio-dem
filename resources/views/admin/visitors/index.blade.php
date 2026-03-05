@extends('admin.layouts.app')

@section('title', 'Visitor Logs')

@section('content')
<div class="header-section">
    <div class="header-left">
        <h1>Visitor Logs</h1>
        <p class="subtitle">Track website traffic and visitor details</p>
    </div>
    <div class="header-actions">
        <!-- Maybe a clear logs button later? -->
    </div>
</div>

<div class="card">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Time</th>
                        <th>IP Address</th>
                        <th>Location</th>
                        <th>URL</th>
                        <th>Method</th>
                        <th>User Agent</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($visitors as $visitor)
                        <tr>
                            <td style="white-space: nowrap;">{{ $visitor->created_at->format('Y-m-d H:i:s') }}</td>
                            <td>
                                <span class="badge" style="background: rgba(95, 206, 206, 0.1); color: #5FCECE;">
                                    {{ $visitor->ip_address }}
                                </span>
                            </td>
                            <td>
                                @if($visitor->city || $visitor->country)
                                    <div style="font-size: 0.9em; font-weight: 500;">
                                        {{ $visitor->city ?? '-' }}, {{ $visitor->region ?? '-' }}
                                    </div>
                                    <div style="font-size: 0.8em; color: #6b7280;">
                                        {{ $visitor->country }}
                                    </div>
                                @else
                                    <span style="color: #9ca3af;">-</span>
                                @endif
                            </td>
                            <td title="{{ $visitor->url }}" style="max-width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                {{ Str::limit($visitor->url, 50) }}
                            </td>
                            <td>
                                @if($visitor->method == 'GET')
                                    <span class="badge" style="background: rgba(74, 222, 128, 0.1); color: #4ade80;">GET</span>
                                @elseif($visitor->method == 'POST')
                                    <span class="badge" style="background: rgba(248, 113, 113, 0.1); color: #f87171;">POST</span>
                                @else
                                    <span class="badge">{{ $visitor->method }}</span>
                                @endif
                            </td>
                            <td title="{{ $visitor->user_agent }}" style="max-width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: #6b7280; font-size: 0.9em;">
                                {{ Str::limit($visitor->user_agent, 40) }}
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" style="text-align: center; padding: 40px;">
                                <div style="display: flex; flex-direction: column; align-items: center; gap: 10px; color: #6b7280;">
                                    <i class="fas fa-clipboard-list" style="font-size: 32px; opacity: 0.5;"></i>
                                    <p>No visitor logs found yet.</p>
                                </div>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        
        <div class="pagination-wrapper" style="margin-top: 20px;">
            {{ $visitors->links() }}
        </div>
    </div>
</div>
@endsection
