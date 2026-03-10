<li class="{{ ($isDeepDrop ?? false) ? 'deep-drop' : '' }}" data-member-name="{{ $member->name }}"
    data-level="{{ $member->level }}">

    <div class="org-card flex-shrink-0" style="width: 185px;">

        {{-- Top accent bar --}}
        <div class="org-card-accent"></div>

        <div style="display: flex; flex-direction: column; align-items: center; padding: 14px 12px 14px 12px; gap: 8px;">

            {{-- Avatar --}}
            @if($member->photo)
                <div class="org-avatar-wrapper">
                    <img src="{{ asset('storage/' . $member->photo) }}" alt="{{ $member->name }}"
                        style="width:100%; height:100%; object-fit:cover;">
                </div>
            @else
                <div class="org-avatar-icon">
                    <i class="fas fa-user"></i>
                </div>
            @endif

            {{-- Name --}}
            <div class="org-member-name">{{ $member->name }}</div>

            {{-- Position badge --}}
            @if($member->position)
                <div class="org-position-badge">{{ $member->position }}</div>
            @else
                <div class="org-position-badge">
                    {{ \App\Models\OrganizationStructure::LEVELS[$member->level] ?? $member->level }}
                </div>
            @endif

            {{-- Department tag --}}
            @if($member->department)
                <div class="org-dept-tag">
                    <i class="fas fa-building" style="font-size:8px;"></i>
                    {{ $member->department }}
                </div>
            @endif

        </div>
    </div>

    {{-- Children --}}
    @if($member->children->count() > 0)
        <ul>
            @foreach($member->children as $child)
                @php
                    $isDeepDrop = $child->level === 'admin' &&
                        $member->level !== 'staff' &&
                        $member->level !== 'admin';
                @endphp
                @include('partials.org-node', [
                    'member' => $child,
                    'levelColors' => $levelColors,
                    'levelBorderColors' => $levelBorderColors,
                    'isDeepDrop' => $isDeepDrop
                ])
            @endforeach
        </ul>
    @endif
</li>
