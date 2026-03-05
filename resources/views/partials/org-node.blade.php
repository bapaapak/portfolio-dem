<li class="{{ ($isDeepDrop ?? false) ? 'deep-drop' : '' }}" data-member-name="{{ $member->name }}"
    data-level="{{ $member->level }}">

    <div class="org-card relative flex-shrink-0 group cursor-default" style="width: 200px; max-width: 200px;">

        {{-- Decorative top accent --}}
        <div class="org-card-accent"></div>

        <div class="flex flex-col items-center pt-2">
            {{-- Photo / Icon with glow effect --}}
            <div class="relative mb-3">
                @if($member->photo)
                    <div class="org-avatar-wrapper">
                        <img src="{{ asset('storage/' . $member->photo) }}" alt="{{ $member->name }}"
                            class="w-full h-full rounded-full object-cover">
                    </div>
                @else
                    <div class="org-avatar-icon">
                        <i class="fas fa-user text-base"></i>
                    </div>
                @endif
            </div>

            {{-- Text Content --}}
            <div class="w-full text-center px-3 pb-3">
                <div class="font-bold text-gray-800 text-sm mb-1.5 leading-tight">{{ $member->name }}</div>

                @if($member->position)
                    <div class="org-position-badge">
                        {{ $member->position }}
                    </div>
                @else
                    <div class="org-position-badge">
                        {{ \App\Models\OrganizationStructure::LEVELS[$member->level] ?? $member->level }}
                    </div>
                @endif

                @if($member->department)
                    <div class="org-dept-tag mt-2">
                        <i class="fas fa-building text-[8px] mr-1"></i>
                        {{ $member->department }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    {{-- Children Nodes with Connecting Lines --}}
    @if($member->children->count() > 0)
        <ul>
            @foreach($member->children as $child)
                @php
                    // Check if this child needs a deep drop (Admin under Non-Staff/Non-Admin)
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
