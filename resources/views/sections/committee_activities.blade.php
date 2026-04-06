<!-- Committee Activities Section -->
<section class="committee-activities-section" id="committee-activities" style="padding: 0 0 60px 0;">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" style="margin-bottom: 40px;">
            <span class="lang-id" data-display="inline">Aktivitas Kepanitiaan</span>
            <span class="lang-en" style="display: none;" data-display="inline">Committee Activities</span>
        </h2>
        
        @forelse($committeeActivities as $year => $activities)
            <div class="committee-year-group">
                <div class="committee-year-label">
                    <span>{{ $year }}</span>
                </div>
                <div class="committee-grid">
                    @foreach($activities as $activity)
                        <div class="committee-card">
                            <div class="committee-image">
                                @php $committeeImagePath = $activity->image_storage_path; @endphp
                                @if($committeeImagePath && \Illuminate\Support\Facades\Storage::disk('public')->exists($committeeImagePath))
                                    <img
                                        src="{{ $activity->image_url }}"
                                        alt="{{ $activity->title }}"
                                        class="committee-lightbox-trigger"
                                        loading="lazy"
                                        decoding="async"
                                        onclick="openCommitteeLightbox(this)"
                                    >
                                @else
                                    <div class="committee-image-placeholder">
                                        <i class="fas fa-image" style="font-size:2rem; opacity:0.3;"></i>
                                    </div>
                                @endif
                            </div>
                            <div class="committee-content">
                                <div class="committee-header">
                                    <h3 class="committee-title">
                                        <span class="lang-id" data-display="block">{{ $activity->title }}</span>
                                        <span class="lang-en" style="display: none;" data-display="block">{{ $activity->title_en ?: $activity->title }}</span>
                                    </h3>
                                    <span class="committee-role">
                                        <span class="lang-id" data-display="inline">{{ $activity->role }}</span>
                                        <span class="lang-en" style="display: none;" data-display="inline">{{ $activity->role_en ?: $activity->role }}</span>
                                    </span>
                                </div>

                                @if($activity->organization)
                                    <p class="committee-org">
                                        <i class="fas fa-building"></i> {{ $activity->organization }}
                                    </p>
                                @endif

                                <div class="committee-meta">
                                    @if($activity->event_date)
                                        <span class="committee-date">
                                            <i class="fas fa-calendar"></i> {{ $activity->formatted_date }}
                                        </span>
                                    @endif
                                    @if($activity->location)
                                        <span class="committee-location">
                                            <i class="fas fa-map-marker-alt"></i> {{ $activity->location }}
                                        </span>
                                    @endif
                                </div>

                                @if($activity->description)
                                    <p class="committee-desc">
                                        <span class="lang-id" data-display="block">{{ Str::limit($activity->description, 150) }}</span>
                                        <span class="lang-en" style="display: none;" data-display="block">{{ Str::limit($activity->description_en ?: $activity->description, 150) }}</span>
                                    </p>
                                @endif
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @empty
            <div class="text-center text-muted col-span-full" style="padding: 40px;">
                <i class="fas fa-calendar-check" style="font-size: 48px; opacity: 0.3; margin-bottom: 16px;"></i>
                <p>
                    <span class="lang-id" data-display="block">Belum ada aktivitas kepanitiaan.</span>
                    <span class="lang-en" style="display: none;" data-display="block">No committee activities yet.</span>
                </p>
            </div>
        @endforelse
    </div>
</section>

<style>
.committee-lightbox-trigger {
    cursor: zoom-in;
    transition: opacity 0.2s ease;
}
.committee-lightbox-trigger:hover {
    opacity: 0.85;
}
#committee-lightbox {
    display: none;
    position: fixed;
    inset: 0;
    z-index: 9999;
    background: rgba(0,0,0,0.85);
    align-items: center;
    justify-content: center;
}
#committee-lightbox.active {
    display: flex;
}
#committee-lightbox img {
    max-width: 92vw;
    max-height: 92vh;
    border-radius: 10px;
    box-shadow: 0 8px 40px rgba(0,0,0,0.6);
    object-fit: contain;
    animation: cbLbIn 0.2s ease;
}
@keyframes cbLbIn {
    from { transform: scale(0.9); opacity: 0; }
    to   { transform: scale(1);   opacity: 1; }
}
#committee-lightbox-close {
    position: fixed;
    top: 18px;
    right: 24px;
    color: white;
    font-size: 2.2rem;
    cursor: pointer;
    background: rgba(0,0,0,0.4);
    border-radius: 50%;
    width: 44px;
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background 0.2s;
    z-index: 10000;
}
#committee-lightbox-close:hover { background: rgba(255,255,255,0.2); }
.cb-lightbox-nav {
    position: fixed;
    top: 50%;
    transform: translateY(-50%);
    color: white;
    font-size: 2rem;
    cursor: pointer;
    background: rgba(0,0,0,0.45);
    border-radius: 50%;
    width: 52px;
    height: 52px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background 0.2s;
    z-index: 10000;
}
.cb-lightbox-nav:hover { background: rgba(255,255,255,0.2); }
#committee-lightbox-prev { left: 16px; }
#committee-lightbox-next { right: 16px; }
.cb-lightbox-nav.hidden { opacity: 0; pointer-events: none; }
</style>

<div id="committee-lightbox" onclick="closeCbLightbox(event)">
    <span id="committee-lightbox-close" onclick="closeCbLightbox()">&times;</span>
    <span id="committee-lightbox-prev" class="cb-lightbox-nav" onclick="cbLbNav(-1,event)">&#8249;</span>
    <img id="committee-lightbox-img" src="" alt="">
    <span id="committee-lightbox-next" class="cb-lightbox-nav" onclick="cbLbNav(1,event)">&#8250;</span>
</div>

<script>
var _cbImages = [];
var _cbIndex = 0;
function openCommitteeLightbox(el) {
    _cbImages = Array.from(document.querySelectorAll('.committee-lightbox-trigger'));
    _cbIndex = _cbImages.indexOf(el);
    _cbShow();
    document.getElementById('committee-lightbox').classList.add('active');
    document.body.style.overflow = 'hidden';
}
function _cbShow() {
    document.getElementById('committee-lightbox-img').src = _cbImages[_cbIndex].src;
    document.getElementById('committee-lightbox-img').alt = _cbImages[_cbIndex].alt;
    document.getElementById('committee-lightbox-prev').classList.toggle('hidden', _cbIndex === 0);
    document.getElementById('committee-lightbox-next').classList.toggle('hidden', _cbIndex === _cbImages.length - 1);
}
function cbLbNav(dir, e) {
    if (e) e.stopPropagation();
    var next = _cbIndex + dir;
    if (next >= 0 && next < _cbImages.length) { _cbIndex = next; _cbShow(); }
}
function closeCbLightbox(e) {
    if (e && (e.target === document.getElementById('committee-lightbox-img') || (e.target.classList && e.target.classList.contains('cb-lightbox-nav')))) return;
    document.getElementById('committee-lightbox').classList.remove('active');
    document.body.style.overflow = '';
}
document.addEventListener('keydown', function(e) {
    if (!document.getElementById('committee-lightbox').classList.contains('active')) return;
    if (e.key === 'Escape')     closeCbLightbox();
    if (e.key === 'ArrowRight') cbLbNav(1);
    if (e.key === 'ArrowLeft')  cbLbNav(-1);
});
</script>
