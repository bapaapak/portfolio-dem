<li class="{{ ($isDeepDrop ?? false) ? 'deep-drop' : '' }}" data-member-name="{{ $member->name }}"
    data-level="{{ $member->level }}">

    <div class="org-card relative flex-shrink-0 group cursor-default" style="width: 200px; max-width: 200px;">

        <div class="flex flex-col items-center pt-2">
            {{-- Top Accent Bar --}}
            <div class="org-card-accent absolute top-0 left-0 right-0 rounded-t-xl" style="height: 4px;"></div>

            {{-- Photo / Icon --}}
            <div class="relative mb-2">
                @if($member->photo)
                    <div class="w-12 h-12 rounded-full p-0.5 border border-gray-200 bg-white shadow-sm">
                        <img src="{{ asset('storage/' . $member->photo) }}" alt="{{ $member->name }}"
                            class="w-full h-full rounded-full object-cover">
                    </div>
                @else
                    <div class="org-avatar-icon w-12 h-12 rounded-full flex items-center justify-center shadow-sm">
                        <i class="fas fa-user text-lg"></i>
                    </div>
                @endif
            </div>

            {{-- Text Content --}}
            <div class="w-full text-center">
                <div class="font-bold text-gray-900 text-sm mb-1 leading-snug">{{ $member->name }}</div>

                @if($member->position)
                    <div class="mx-auto inline-block">
                        <span
                            class="org-position-badge font-bold uppercase tracking-wide leading-tight px-2 py-0.5 rounded-full border"
                            style="font-size: 8px !important;">
                            {{ $member->position }}
                        </span>
                    </div>
                @else
                    <div class="text-[10px] font-semibold text-gray-400 uppercase tracking-wider">
                        {{ \App\Models\OrganizationStructure::LEVELS[$member->level] ?? $member->level }}
                    </div>
                @endif

                @if($member->department)
                    <div
                        class="mt-2 text-[10px] text-gray-500 font-medium inline-flex items-center gap-1 px-2 py-0.5 bg-gray-50 rounded border border-gray-100">
                        <i class="fas fa-building text-gray-400" style="font-size: 7px;"></i>
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

                @include('admin.organization_structure.partials.tree-node-hierarchy', [
                    'member' => $child,
                    'levelColors' => $levelColors,
                    'levelBorderColors' => $levelBorderColors,
                    'isDeepDrop' => $isDeepDrop
                ])
            @endforeach
                </ul>
    @endif
</li>
