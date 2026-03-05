@extends('layouts.public')

@section('title', $project->title . ' - Portfolio')

@section('content')
    <!-- Project Hero -->
    <section class="project-hero">
        <div class="container">
            <span class="featured-badge">Featured Case Study</span>
            <h1 class="project-hero-title">
                {{ $project->title }}
                @if($project->client)
                    <br><span class="highlight">for {{ $project->client }}</span>
                @endif
            </h1>
            <p class="project-hero-desc">{{ $project->description }}</p>

            <div class="project-hero-buttons">
                @if($project->live_url)
                    <a href="{{ $project->live_url }}" target="_blank" class="btn btn-primary">
                        <i class="fas fa-external-link-alt"></i> Visit Live Site
                    </a>
                @endif
                @if($project->code_url)
                    <a href="{{ $project->code_url }}" target="_blank" class="btn btn-outline">
                        <i class="fas fa-code"></i> View Code
                    </a>
                @endif
            </div>

            <div class="project-meta">
                <div class="meta-item">
                    <div class="meta-label">Client</div>
                    <div class="meta-value">{{ $project->client ?? 'Personal' }}</div>
                </div>
                <div class="meta-item">
                    <div class="meta-label">Role</div>
                    <div class="meta-value">{{ $project->role ?? 'Developer' }}</div>
                </div>
                <div class="meta-item">
                    <div class="meta-label">Timeline</div>
                    <div class="meta-value">{{ $project->timeline ?? 'Ongoing' }}</div>
                </div>
                <div class="meta-item">
                    <div class="meta-label">Tools</div>
                    <div class="meta-value">
                        @if($project->tools)
                            {{ implode(', ', array_slice($project->tools, 0, 3)) }}
                        @else
                            Various
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Project Content -->
    <section class="project-content">
        <div class="container">
            @if($project->challenge)
                <div class="content-section">
                    <h2>The Challenge</h2>
                    <div class="challenge-content">
                        @php
                            $challenge = $project->challenge;
                            // Split by numbered pattern (1. 2. 3. etc)
                            $points = preg_split('/\d+\.\s/', $challenge, -1, PREG_SPLIT_NO_EMPTY);
                            $hasNumberedPoints = count($points) > 1;
                        @endphp

                        @if($hasNumberedPoints)
                            <ul class="challenge-list">
                                @foreach($points as $point)
                                    @if(trim($point))
                                        <li>{{ trim($point) }}</li>
                                    @endif
                                @endforeach
                            </ul>
                        @else
                            <p>{{ $challenge }}</p>
                        @endif
                    </div>
                </div>
            @endif

            <!-- Project Gallery -->
            <!-- Project Gallery Carousel -->
            <div class="project-gallery-carousel">
                <div class="carousel-container">
                    <div class="carousel-track" style="cursor: grab;">
                        @php
                            $sliderImages = !empty($project->images) ? $project->images : ($project->thumbnail ? [$project->thumbnail] : []);
                        @endphp

                        @forelse($sliderImages as $index => $image)
                            <div class="carousel-slide">
                                <img src="{{ asset('storage/' . $image) }}"
                                    alt="{{ $project->title }} - Image {{ $index + 1 }}">
                            </div>
                        @empty
                            <div class="carousel-slide">
                                <div style="color: #64748b; font-size: 18px;">No image available</div>
                            </div>
                        @endforelse
                    </div>

                    <button class="carousel-btn prev-btn" aria-label="Previous image">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <button class="carousel-btn next-btn" aria-label="Next image">
                        <i class="fas fa-chevron-right"></i>
                    </button>

                    <div class="carousel-indicators">
                        <!-- Indicators will be generated by JS -->
                    </div>
                </div>
            </div>

            @if($project->solution)
                <div class="content-section">
                    <h2>The Solution & Results</h2>
                    <div class="solution-content">
                        @php
                            $solution = $project->solution;
                            // Split by numbered pattern (1. 2. 3. etc)
                            $points = preg_split('/\d+\.\s/', $solution, -1, PREG_SPLIT_NO_EMPTY);
                            $hasNumberedPoints = count($points) > 1;
                        @endphp

                        @if($hasNumberedPoints)
                            <ul class="solution-list">
                                @foreach($points as $point)
                                    @if(trim($point))
                                        <li>{{ trim($point) }}</li>
                                    @endif
                                @endforeach
                            </ul>
                        @else
                            <p>{{ $solution }}</p>
                        @endif
                    </div>

                    @if($project->key_improvements)
                        <h3 style="margin-top: 32px; margin-bottom: 16px;">Key Improvements</h3>
                        <div class="improvements-grid">
                            @foreach($project->key_improvements as $improvement)
                                <div class="improvement-card">
                                    <div class="improvement-icon">
                                        <i class="fas fa-chart-line"></i>
                                    </div>
                                    <div>
                                        <div class="improvement-value">{{ $improvement['label'] ?? '' }}</div>
                                        <div class="improvement-label">{{ $improvement['description'] ?? '' }}</div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endif
                </div>
            @endif
        </div>
    </section>

    @push('scripts')
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const track = document.querySelector('.carousel-track');
                const slides = Array.from(track.children);
                const nextButton = document.querySelector('.next-btn');
                const prevButton = document.querySelector('.prev-btn');
                const indicatorsContainer = document.querySelector('.carousel-indicators');

                // Return if no slides
                if (slides.length === 0) return;

                // Create indicators
                slides.forEach((_, index) => {
                    const indicator = document.createElement('div');
                    indicator.classList.add('indicator');
                    if (index === 0) indicator.classList.add('active');
                    indicator.addEventListener('click', () => {
                        moveToSlide(index);
                    });
                    indicatorsContainer.appendChild(indicator);
                });

                const indicators = Array.from(document.querySelectorAll('.indicator'));
                let currentIndex = 0;
                let isDragging = false;
                let startPos = 0;
                let currentTranslate = 0;
                let prevTranslate = 0;
                let animationID;
                
                // Auto Play config
                let autoPlayInterval;
                const autoPlayDelay = 5000;

                function moveToSlide(index) {
                    // Handle bounds for loop
                    if (index < 0) index = slides.length - 1;
                    if (index >= slides.length) index = 0;

                    const amountToMove = -100 * index;
                    track.style.transition = 'transform 0.6s cubic-bezier(0.25, 1, 0.5, 1)';
                    track.style.transform = `translateX(${amountToMove}%)`;

                    currentIndex = index;
                    prevTranslate = amountToMove;

                    // Update indicators
                    indicators.forEach(ind => ind.classList.remove('active'));
                    if (indicators[currentIndex]) {
                        indicators[currentIndex].classList.add('active');
                    }
                    
                    resetAutoPlay();
                }

                function touchStart(index) {
                    return function(event) {
                        isDragging = true;
                        startPos = getPositionX(event);
                        animationID = requestAnimationFrame(animation);
                        track.style.transition = 'none'; // disable transition while dragging
                        track.style.cursor = 'grabbing';
                        clearInterval(autoPlayInterval);
                    }
                }

                function touchEnd() {
                    isDragging = false;
                    cancelAnimationFrame(animationID);
                    track.style.cursor = 'grab';

                    const movedBy = currentTranslate - prevTranslate;
                    
                    if (movedBy < -15 && currentIndex < slides.length - 1) currentIndex += 1;
                    if (movedBy > 15 && currentIndex > 0) currentIndex -= 1;
                    
                    if (movedBy < -15 && currentIndex === slides.length - 1) currentIndex = 0; // wrap around
                    if (movedBy > 15 && currentIndex === 0) currentIndex = slides.length - 1; // wrap around

                    moveToSlide(currentIndex);
                }

                function touchMove(event) {
                    if (isDragging) {
                        const currentPosition = getPositionX(event);
                        const diff = ((currentPosition - startPos) / window.innerWidth) * 100;
                        currentTranslate = prevTranslate + diff;
                    }
                }

                function getPositionX(event) {
                    return event.type.includes('mouse') ? event.pageX : event.touches[0].clientX;
                }

                function animation() {
                    track.style.transform = `translateX(${currentTranslate}%)`;
                    if (isDragging) requestAnimationFrame(animation);
                }

                // Attach Touch/Mouse Events
                slides.forEach((slide, index) => {
                    const slideImage = slide.querySelector('img');
                    if(slideImage) slideImage.addEventListener('dragstart', (e) => e.preventDefault());
                    
                    slide.addEventListener('touchstart', touchStart(index), {passive: true});
                    slide.addEventListener('touchend', touchEnd);
                    slide.addEventListener('touchmove', touchMove, {passive: true});

                    slide.addEventListener('mousedown', touchStart(index));
                    slide.addEventListener('mouseup', touchEnd);
                    slide.addEventListener('mouseleave', () => { if(isDragging) touchEnd() });
                    slide.addEventListener('mousemove', touchMove);
                });

                nextButton.addEventListener('click', () => {
                    moveToSlide(currentIndex + 1);
                });

                prevButton.addEventListener('click', () => {
                    moveToSlide(currentIndex - 1);
                });

                // Keyboard navigation
                document.addEventListener('keydown', (e) => {
                    if (e.key === 'ArrowLeft') moveToSlide(currentIndex - 1);
                    if (e.key === 'ArrowRight') moveToSlide(currentIndex + 1);
                });
                
                // Auto play functionality
                function startAutoPlay() {
                    if(slides.length > 1) {
                        autoPlayInterval = setInterval(() => {
                            moveToSlide(currentIndex + 1);
                        }, autoPlayDelay);
                    }
                }
                
                function resetAutoPlay() {
                    clearInterval(autoPlayInterval);
                    startAutoPlay();
                }
                
                startAutoPlay();
                
                // Pause auto play when hovering buttons or indicators
                nextButton.addEventListener('mouseenter', () => clearInterval(autoPlayInterval));
                nextButton.addEventListener('mouseleave', startAutoPlay);
                prevButton.addEventListener('mouseenter', () => clearInterval(autoPlayInterval));
                prevButton.addEventListener('mouseleave', startAutoPlay);
                indicatorsContainer.addEventListener('mouseenter', () => clearInterval(autoPlayInterval));
                indicatorsContainer.addEventListener('mouseleave', startAutoPlay);
            });
        </script>
    @endpush

@endsection