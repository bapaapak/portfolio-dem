<!-- Career Aspiration Section -->
<section class="career-aspiration-section" id="career-aspiration" style="padding: 60px 0;">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" style="margin-bottom: 40px;">
            <span class="lang-id" data-display="inline">Aspirasi Karir</span>
            <span class="lang-en" style="display: none;" data-display="inline">Career Aspiration</span>
        </h2>
        
        <div class="career-content-wrapper" style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; align-items: start;">
            <!-- Aspiration Text -->
            <div class="aspiration-text-box" style="background: var(--bg-secondary); padding: 30px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.05);">
                <div class="icon-header" style="font-size: 40px; color: var(--accent-orange); margin-bottom: 20px;">
                    <i class="fas fa-rocket"></i>
                </div>
                <h3 style="font-size: 24px; font-weight: 700; margin-bottom: 16px; color: var(--text-primary);">
                    <span class="lang-id" data-display="inline">Visi Masa Depan</span>
                    <span class="lang-en" style="display: none;" data-display="inline">Future Vision</span>
                </h3>
                <div class="aspiration-body" style="color: var(--text-secondary); line-height: 1.8;">
                    <span class="lang-id" data-display="block">
                        {!! nl2br(e($profile->career_aspiration ?? 'Belum ada aspirasi karir yang ditambahkan.')) !!}
                    </span>
                    <span class="lang-en" style="display: none;" data-display="block">
                        {!! nl2br(e($profile->career_aspiration ?? 'No career aspiration added yet.')) !!}
                    </span>
                </div>
            </div>

            <!-- Milestones Timeline -->
            <div class="milestones-timeline-box">
                <h3 style="font-size: 24px; font-weight: 700; margin-bottom: 24px; color: var(--text-primary);">Milestones</h3>
                <div class="milestones-list" style="position: relative; padding-left: 20px; border-left: 2px solid var(--accent-green);">
                    @forelse($profile->career_milestones ?? [] as $milestone)
                    <div class="milestone-item" style="position: relative; margin-bottom: 30px; padding-left: 20px;">
                        <div class="milestone-dot" style="position: absolute; left: -27px; top: 0; width: 12px; height: 12px; background: var(--accent-green); border-radius: 50%; border: 2px solid var(--bg-primary);"></div>
                        <span class="milestone-year" style="display: inline-block; background: rgba(95, 206, 206, 0.1); color: var(--accent-green); padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 700; margin-bottom: 8px;">{{ $milestone['year'] }}</span>
                        <h4 class="milestone-title" style="font-size: 18px; font-weight: 600; color: var(--text-primary); margin-bottom: 6px;">{{ $milestone['title'] }}</h4>
                        <div class="milestone-desc" style="color: var(--text-secondary); font-size: 14px;">
                            @if(Str::contains($milestone['description'], '- '))
                                <ul style="margin: 0; padding-left: 15px; list-style-type: disc;">
                                    @foreach(explode("\n", $milestone['description']) as $line)
                                        @if(trim($line))
                                            @if(str_starts_with(trim($line), '-'))
                                                <li style="margin-bottom: 4px;">{{ trim(substr(trim($line), 1)) }}</li>
                                            @else
                                                <li style="list-style-type: none; margin-left: -15px; margin-bottom: 4px;">{{ $line }}</li>
                                            @endif
                                        @endif
                                    @endforeach
                                </ul>
                            @else
                                {{ $milestone['description'] }}
                            @endif
                        </div>
                    </div>
                    @empty
                    <div class="text-muted">
                        <span class="lang-id">Belum ada milestone.</span>
                        <span class="lang-en" style="display: none;">No milestones yet.</span>
                    </div>
                    @endforelse
                </div>
            </div>
        </div>

        <style>
             @media (max-width: 768px) {
                .career-content-wrapper {
                    grid-template-columns: 1fr !important;
                }
             }
        </style>
    </div>
</section>
