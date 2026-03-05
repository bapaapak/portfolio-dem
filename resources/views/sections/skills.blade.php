<!-- Additional Information Section -->
<section class="additional-info-section" style="padding: 0 0 60px 0;">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" style="margin-bottom: 40px;">Additional Information</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <!-- Technical Skills -->
            <div class="info-column">
                <h3 class="text-2xl font-bold mb-6 text-gray-800 border-b-2 border-orange-500 inline-block pb-2">Technical Skills</h3>
                <ul class="space-y-4">
                    @forelse($technicalSkills as $skill)
                        <li class="flex items-start">
                            <span class="text-orange-500 mr-2 mt-1"><i class="fas fa-check-circle"></i></span>
                            <div>
                                <strong class="text-gray-900">
                                    <span class="lang-id" data-display="inline">{{ $skill->category }}</span>
                                    <span class="lang-en" style="display: none;" data-display="inline">{{ $skill->category_en ?: $skill->category }}</span>
                                    :
                                </strong>
                                <span class="text-gray-700">
                                    <span class="lang-id" data-display="inline">{{ $skill->items }}</span>
                                    <span class="lang-en" style="display: none;" data-display="inline">{{ $skill->items_en ?: $skill->items }}</span>
                                </span>
                            </div>
                        </li>
                    @empty
                        <li class="text-gray-500">No technical skills added yet.</li>
                    @endforelse
                </ul>
            </div>

            <!-- Soft Skills -->
            <div class="info-column mt-8 md:mt-0">
                <h3 class="text-2xl font-bold mb-6 text-gray-800 border-b-2 border-orange-500 inline-block pb-2">Soft Skills</h3>
                <ul class="space-y-4">
                    @forelse($softSkills as $skill)
                         <li class="flex items-start">
                            <span class="text-orange-500 mr-2 mt-1"><i class="fas fa-star"></i></span>
                            <div>
                                @if($skill->category)
                                    <strong class="text-gray-900">
                                        <span class="lang-id" data-display="inline">{{ $skill->category }}</span>
                                        <span class="lang-en" style="display: none;" data-display="inline">{{ $skill->category_en ?: $skill->category }}</span>
                                        {{ ($skill->items || $skill->items_en) ? ':' : '' }}
                                    </strong>
                                @endif
                                @if($skill->items)
                                    <span class="text-gray-700">
                                        <span class="lang-id" data-display="inline">{{ $skill->items }}</span>
                                        <span class="lang-en" style="display: none;" data-display="inline">{{ $skill->items_en ?: $skill->items }}</span>
                                    </span>
                                @endif
                            </div>
                        </li>
                    @empty
                        <li class="text-gray-500">No soft skills added yet.</li>
                    @endforelse
                </ul>
            </div>
        </div>
    </div>
</section>
