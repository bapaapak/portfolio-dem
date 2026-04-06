<!-- Job Description & Activity Section -->
<section class="job-description-section" id="job-description">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="nav_job_description">Job Description & Activity</h2>
        
        <div class="job-description-grid">
            <!-- Job Descriptions Column -->
            <div class="jd-column descriptions-column fade-in-up">
                <div class="jd-header descriptions-header">
                    <i class="fas fa-file-alt"></i>
                    <h3>Job Descriptions</h3>
                </div>
                <div class="jd-content">
                    @forelse($jobDescriptions ?? [] as $desc)
                    <div class="jd-card description-card">
                        <h4 class="jd-title">{{ $desc->title }}</h4>
                        @if($desc->description)
                            <div class="jd-description-container">
                                @if(Str::contains($desc->description, '- '))
                                    <ul class="jd-description-list">
                                        @foreach(explode("\n", $desc->description) as $line)
                                            @if(trim($line))
                                                @if(str_starts_with(trim($line), '-'))
                                                    <li>{{ trim(substr(trim($line), 1)) }}</li>
                                                @else
                                                    <li class="no-bullet">{{ $line }}</li>
                                                @endif
                                            @endif
                                        @endforeach
                                    </ul>
                                @else
                                    <p class="jd-description">{{ $desc->description }}</p>
                                @endif
                            </div>
                        @endif
                        @if($desc->items && count($desc->items) > 0)
                        <ul class="jd-items">
                            @foreach($desc->items as $item)
                            <li>{{ $item }}</li>
                            @endforeach
                        </ul>
                        @endif
                    </div>
                    @empty
                    <p class="jd-empty">Belum ada job description.</p>
                    @endforelse
                </div>
            </div>
            
            <!-- Activity Jobs Column -->
            <div class="jd-column activities-column fade-in-up" style="animation-delay: 200ms">
                <div class="jd-header activities-header">
                    <i class="fas fa-tasks"></i>
                    <h3>Activity Jobs</h3>
                </div>
                <div class="jd-content">
                    @forelse($jobActivities ?? [] as $year => $activities)
                    <div class="activity-year-group">
                        <div class="activity-year-label">
                            <span>{{ $year }}</span>
                        </div>
                        <div class="activity-timeline">
                            @foreach($activities as $activity)
                            <div class="activity-milestone">
                                <div class="milestone-dot"></div>
                                <div class="milestone-content">
                                    <h4 class="jd-title">{{ $activity->title }}</h4>
                                    @if($activity->illustration_image)
                                        @php
                                            $illustrationPath = ltrim($activity->illustration_image, '/');
                                            if (str_starts_with($illustrationPath, 'storage/')) {
                                                $illustrationPath = substr($illustrationPath, strlen('storage/'));
                                            }
                                            $illustrationUrl = str_starts_with($illustrationPath, 'http://') || str_starts_with($illustrationPath, 'https://')
                                                ? $illustrationPath
                                                : '/media/' . ltrim($illustrationPath, '/');
                                        @endphp
                                        <div class="activity-illustration-wrapper">
                                            <img src="{{ $illustrationUrl }}"
                                                 alt="{{ $activity->title }}"
                                                 class="activity-illustration-img lightbox-trigger"
                                                 onerror="this.style.display='none'"
                                                 onclick="openLightbox(this)">
                                        </div>
                                    @endif
                                    @if($activity->items && count($activity->items) > 0)
                                    <ul class="jd-items">
                                        @foreach($activity->items as $item)
                                        <li>{{ $item }}</li>
                                        @endforeach
                                    </ul>
                                    @endif
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    @empty
                    <p class="jd-empty">Belum ada activity job.</p>
                    @endforelse
                </div>
            </div>
        </div>
    </div>
</section>

<style>
/* Job Description & Activity Section Styles */
.job-description-section {
    padding: 80px 0;
    position: relative;
    overflow: hidden;
    background: transparent;
}

.job-description-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 30px;
    margin-top: 40px;
}

.jd-column {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.jd-header {
    padding: 20px 24px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.jd-header i {
    font-size: 1.5rem;
}

.jd-header h3 {
    font-size: 1.3rem;
    font-weight: 700;
    margin: 0;
}

.descriptions-header {
    background: linear-gradient(135deg, #3b82f6 0%, #60a5fa 100%);
    color: white;
}

.activities-header {
    background: linear-gradient(135deg, #10b981 0%, #34d399 100%);
    color: white;
}

.jd-content {
    padding: 24px;
}

.activity-illustration-wrapper {
    margin-bottom: 20px;
}

.activity-illustration-img {
    width: 100%;
    height: auto;
    border-radius: 8px;
    object-fit: contain;
    display: block;
}

.jd-card {
    padding: 16px;
    border-radius: 10px;
    margin-bottom: 16px;
    transition: transform 0.2s ease;
}

.jd-card:last-child {
    margin-bottom: 0;
}

.jd-card:hover {
    transform: translateX(5px);
}

.description-card {
    background: rgba(59, 130, 246, 0.05);
    border-left: 4px solid #3b82f6;
}

.activity-card {
    background: rgba(16, 185, 129, 0.05);
    border-left: 4px solid #10b981;
}

/* Activity Timeline / Milestone Styles */
.activity-year-group {
    margin-bottom: 28px;
}

.activity-year-group:last-child {
    margin-bottom: 0;
}

.activity-year-label {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #10b981 0%, #34d399 100%);
    color: white;
    font-size: 0.9rem;
    font-weight: 700;
    padding: 5px 18px;
    border-radius: 999px;
    margin-bottom: 16px;
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
    letter-spacing: 0.04em;
}

.activity-timeline {
    position: relative;
    padding-left: 24px;
    border-left: 2px solid rgba(16, 185, 129, 0.3);
}

.activity-milestone {
    position: relative;
    margin-bottom: 14px;
}

.activity-milestone:last-child {
    margin-bottom: 0;
}

.milestone-dot {
    position: absolute;
    left: -30px;
    top: 14px;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background: #10b981;
    border: 2px solid white;
    box-shadow: 0 0 0 2px #10b981;
    flex-shrink: 0;
}

.milestone-content {
    background: rgba(16, 185, 129, 0.05);
    border-left: 3px solid #10b981;
    border-radius: 0 10px 10px 0;
    padding: 12px 14px;
    transition: transform 0.2s ease;
}

.milestone-content:hover {
    transform: translateX(4px);
}

.jd-title {
    font-size: 1rem;
    font-weight: 600;
    color: #1e3a5f;
    margin: 0 0 8px 0;
}

.jd-description {
    font-size: 0.9rem;
    color: #4b5563;
    margin: 0 0 10px 0;
    line-height: 1.5;
    text-align: center;
}

.jd-items {
    margin: 0;
    padding-left: 0; /* Remove padding for centered list */
    list-style-position: inside; /* Keep bullets inside */
    font-size: 0.85rem;
    color: #6b7280;
    text-align: center;
}

.jd-items li {
    margin-bottom: 4px;
    line-height: 1.4;
    text-align: center;
}

.jd-empty {
    color: #9ca3af;
    font-style: italic;
    text-align: center;
    padding: 20px;
    margin: 0;
}

.jd-description-list {
    margin: 0 0 10px 0;
    padding-left: 20px;
    text-align: left; /* Align list items to left for better readability */
    font-size: 0.9rem;
    color: #4b5563;
    list-style-type: disc; /* Ensure bullets are visible */
}

.jd-description-list li {
    margin-bottom: 4px;
    line-height: 1.5;
}

.jd-description-list li.no-bullet {
    list-style-type: none;
    margin-left: -20px;
}

/* Responsive */
@media (max-width: 768px) {
    .job-description-grid {
        grid-template-columns: 1fr;
    }
}

/* Lightbox */
.lightbox-trigger {
    cursor: zoom-in;
    transition: opacity 0.2s ease;
}
.lightbox-trigger:hover {
    opacity: 0.85;
}
#jd-lightbox {
    display: none;
    position: fixed;
    inset: 0;
    z-index: 9999;
    background: rgba(0, 0, 0, 0.85);
    align-items: center;
    justify-content: center;
}
#jd-lightbox.active {
    display: flex;
}
#jd-lightbox img {
    max-width: 92vw;
    max-height: 92vh;
    border-radius: 10px;
    box-shadow: 0 8px 40px rgba(0,0,0,0.6);
    object-fit: contain;
    animation: lightboxIn 0.2s ease;
}
@keyframes lightboxIn {
    from { transform: scale(0.9); opacity: 0; }
    to   { transform: scale(1);   opacity: 1; }
}
#jd-lightbox-close {
    position: fixed;
    top: 18px;
    right: 24px;
    color: white;
    font-size: 2.2rem;
    cursor: pointer;
    line-height: 1;
    background: rgba(0,0,0,0.4);
    border-radius: 50%;
    width: 44px;
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background 0.2s;
}
#jd-lightbox-close:hover {
    background: rgba(255,255,255,0.2);
}
.jd-lightbox-nav {
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
    user-select: none;
    z-index: 10000;
}
.jd-lightbox-nav:hover {
    background: rgba(255,255,255,0.2);
}
#jd-lightbox-prev { left: 16px; }
#jd-lightbox-next { right: 16px; }
.jd-lightbox-nav.hidden { opacity: 0; pointer-events: none; }
</style>

<!-- Lightbox Modal -->
<div id="jd-lightbox" onclick="closeLightbox(event)">
    <span id="jd-lightbox-close" onclick="closeLightbox()">&times;</span>
    <span id="jd-lightbox-prev" class="jd-lightbox-nav" onclick="lightboxNav(-1, event)">&#8249;</span>
    <img id="jd-lightbox-img" src="" alt="">
    <span id="jd-lightbox-next" class="jd-lightbox-nav" onclick="lightboxNav(1, event)">&#8250;</span>
</div>

<script>
var _lbImages = [];
var _lbIndex = 0;

function openLightbox(el) {
    _lbImages = Array.from(document.querySelectorAll('.lightbox-trigger'));
    _lbIndex = _lbImages.indexOf(el);
    _lbShow();
    document.getElementById('jd-lightbox').classList.add('active');
    document.body.style.overflow = 'hidden';
}
function _lbShow() {
    var img = document.getElementById('jd-lightbox-img');
    img.src = _lbImages[_lbIndex].src;
    img.alt = _lbImages[_lbIndex].alt;
    document.getElementById('jd-lightbox-prev').classList.toggle('hidden', _lbIndex === 0);
    document.getElementById('jd-lightbox-next').classList.toggle('hidden', _lbIndex === _lbImages.length - 1);
}
function lightboxNav(dir, e) {
    if (e) e.stopPropagation();
    var next = _lbIndex + dir;
    if (next >= 0 && next < _lbImages.length) {
        _lbIndex = next;
        _lbShow();
    }
}
function closeLightbox(e) {
    if (e && (e.target === document.getElementById('jd-lightbox-img')
           || e.target.classList.contains('jd-lightbox-nav'))) return;
    document.getElementById('jd-lightbox').classList.remove('active');
    document.body.style.overflow = '';
}
document.addEventListener('keydown', function(e) {
    if (!document.getElementById('jd-lightbox').classList.contains('active')) return;
    if (e.key === 'Escape')      closeLightbox();
    if (e.key === 'ArrowRight') lightboxNav(1);
    if (e.key === 'ArrowLeft')  lightboxNav(-1);
});
</script>
