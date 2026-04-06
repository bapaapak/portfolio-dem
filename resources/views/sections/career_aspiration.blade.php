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
                @if($profile->aspiration_image)
                <div style="margin-top: 20px;">
                    <img src="{{ $profile->aspiration_image_url }}"
                        data-fallback="{{ $profile->aspiration_image_fallback_url }}"
                         alt="Ilustrasi Aspirasi"
                         style="width:100%;border-radius:10px;cursor:zoom-in;transition:opacity 0.2s;"
                         onclick="openAspirationLightbox(this)"
                        onerror="if (this.dataset.fallback && this.src !== this.dataset.fallback) { this.src = this.dataset.fallback; } else { this.style.display='none'; }"
                         onmouseover="this.style.opacity='0.85'"
                         onmouseout="this.style.opacity='1'">
                </div>
                @endif
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

        <!-- Aspiration Lightbox -->
        <div id="aspiration-lightbox" onclick="closeAspirationLightbox(event)" style="display:none;position:fixed;inset:0;z-index:9999;background:rgba(0,0,0,0.85);align-items:center;justify-content:center;">
            <span onclick="closeAspirationLightbox()" style="position:fixed;top:18px;right:24px;color:white;font-size:2.2rem;cursor:pointer;background:rgba(0,0,0,0.4);border-radius:50%;width:44px;height:44px;display:flex;align-items:center;justify-content:center;">&times;</span>
            <img id="aspiration-lightbox-img" src="" alt="" style="max-width:92vw;max-height:92vh;border-radius:10px;box-shadow:0 8px 40px rgba(0,0,0,0.6);object-fit:contain;animation:lbIn 0.2s ease;">
        </div>
        <style>
            @keyframes lbIn { from{transform:scale(0.9);opacity:0} to{transform:scale(1);opacity:1} }
        </style>
        <script>
        function openAspirationLightbox(el) {
            var lb = document.getElementById('aspiration-lightbox');
            document.getElementById('aspiration-lightbox-img').src = el.src;
            lb.style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        function closeAspirationLightbox(e) {
            if (e && e.target === document.getElementById('aspiration-lightbox-img')) return;
            document.getElementById('aspiration-lightbox').style.display = 'none';
            document.body.style.overflow = '';
        }
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') closeAspirationLightbox();
        });
        </script>
    </div>
</section>
