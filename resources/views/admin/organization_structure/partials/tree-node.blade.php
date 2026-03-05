<li>
    <div class="inline-block relative p-4 mb-2 bg-white rounded-xl shadow-sm border border-gray-200 min-w-[180px] hover:shadow-md transition-shadow group">
        <div class="flex flex-col items-center">
            @if($member->photo)
                <img src="{{ asset('storage/' . $member->photo) }}" alt="{{ $member->name }}" class="w-12 h-12 rounded-full object-cover border-2 border-white shadow-sm mb-2 group-hover:scale-105 transition-transform">
            @else
                <div class="w-12 h-12 rounded-full bg-indigo-50 border-2 border-white shadow-sm mb-2 flex items-center justify-center text-indigo-500 group-hover:scale-105 transition-transform">
                    <i class="fas fa-user text-lg"></i>
                </div>
            @endif
            <div class="font-bold text-gray-800 text-sm">{{ $member->name }}</div>
            <div class="text-xs text-indigo-600 font-medium mt-0.5">{{ $member->position }}</div>
            @if($member->department)
                <div class="text-[10px] text-gray-500 mt-1 px-2 py-0.5 bg-gray-50 rounded-full border border-gray-100">
                    {{ $member->department }}
                </div>
            @endif
        </div>
    </div>

    @if($member->children->count() > 0)
        <ul>
            @foreach($member->children as $child)
                @include('admin.organization_structure.partials.tree-node', ['member' => $child])
            @endforeach
        </ul>
    @endif
</li>
