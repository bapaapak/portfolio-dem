@extends('layouts.public')

@section('title', 'Tubagus | Portofolio')

@section('content')
    @php
        // Ensure sectionOrder is always an array with fallback
        $order = $sectionOrder ?? [];
        if (empty($order)) {
            $order = [
                'hero',
                'stats',
                'about',
                'experience',
                'education',
                'quote',
                'tech_stack',
                'skills',
                'career_aspiration',
                'certifications',
                'company_profile',
                'organization_structure',
                'committee_activities',
                'projects',
                'contact',
                'social',
                'automation_strategy',
                'obstacle_challenge',
                'job_description'
            ];
        }
    @endphp

    @foreach($order as $sectionKey)
        @if(in_array($sectionKey, $visibleSections ?? []))
             @includeIf('sections.' . $sectionKey)
        @endif
    @endforeach

@endsection

@push('scripts')
    <script>
    // Scramble Text Effect for "Tubagus Imran"
    class ScrambleText {
        constructor(element) {
            this.element = element;
            this.chars = '!<>-_\\/[]{}—=+*^?#________';
            this.update = this.update.bind(this);
        }

        setText(newText) {
            const oldText = this.element.innerText;
            const length = Math.max(oldText.length, newText.length);
            const promise = new Promise((resolve) => this.resolve = resolve);
            this.queue = [];

            for (let i = 0; i < length; i++) {
                const from = oldText[i] || '';
                const to = newText[i] || '';
                const start = Math.floor(Math.random() * 40);
                const end = start + Math.floor(Math.random() * 40);
                this.queue.push({ from, to, start, end });
            }

            cancelAnimationFrame(this.frameRequest);
            this.frame = 0;
            this.update();
            return promise;
        }

        update() {
            let output = '';
            let complete = 0;

            for (let i = 0, n = this.queue.length; i < n; i++) {
                let { from, to, start, end, char } = this.queue[i];

                if (this.frame >= end) {
                    complete++;
                    output += to;
                } else if (this.frame >= start) {
                    if (!char || Math.random() < 0.28) {
                        char = this.randomChar();
                        this.queue[i].char = char;
                    }
                    output += `<span class="scramble-char">${char}</span>`;
                } else {
                    output += from;
                }
            }

            this.element.innerHTML = output;

            if (complete === this.queue.length) {
                this.resolve();
            } else {
                this.frameRequest = requestAnimationFrame(this.update);
                this.frame++;
            }
        }

        randomChar() {
            return this.chars[Math.floor(Math.random() * this.chars.length)];
        }
    }

    // Initialize Scramble Effect with Scroll Observer
    document.addEventListener('DOMContentLoaded', function() {
        const scrambleElement = document.getElementById('scramble-text');
        if (scrambleElement) {
            const targetText = scrambleElement.getAttribute('data-text');
            const scramble = new ScrambleText(scrambleElement);

            // Intersection Observer for scroll-triggered animation
            const scrambleObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        // Clear text and re-animate when scrolling into view
                        scrambleElement.textContent = '';
                        scramble.setText(targetText);
                    }
                });
            }, { threshold: 0.5 });

            scrambleObserver.observe(scrambleElement);

            // Initial animation on page load
            setTimeout(() => {
                scramble.setText(targetText);
            }, 300);
        }

        // Initialize fade-in/fade-out animation for section titles (repeatable)
        document.querySelectorAll('.fade-in-title').forEach(titleElement => {
            const titleObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        // Fade in + slide up when entering view
                        titleElement.classList.add('visible');
                    } else {
                        // Fade out + slide down when leaving view
                        titleElement.classList.remove('visible');
                    }
                });
            }, { threshold: 0.2 });

            titleObserver.observe(titleElement);
        });

        // Typed.js Initialization
        const titleString = "{{ $profile->title ?? 'Junior Web Developer,Mobile Developer,Fullstack Developer' }}";
        const typedStrings = titleString.split(',').map(s => s.trim());

        var typed = new Typed('#typed', {
            strings: typedStrings,
            typeSpeed: 50,
            backSpeed: 30,
            backDelay: 3000,
            loop: true,
            showCursor: true,
            cursorChar: '|'
        });
    });

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href*="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            const targetId = href.includes('#') ? '#' + href.split('#')[1] : null;

            // If it's just a hash or a link to current page + hash
            if (targetId && (href.startsWith('#') || href.includes(window.location.pathname))) {
                const target = document.querySelector(targetId);
                if (target) {
                    e.preventDefault();
                    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    history.pushState(null, null, targetId);
                }
            }
        });
    });

    // Animate skill bars on scroll
    const animateSkillBars = () => {
        document.querySelectorAll('.skill-progress').forEach(bar => {
            const width = bar.getAttribute('data-width');
            bar.style.width = width + '%';
        });
    };

    // Counter animation
    const animateCounters = () => {
        document.querySelectorAll('.stat-number-landing').forEach(counter => {
            const target = parseInt(counter.getAttribute('data-count'));
            const duration = 2000;
            const increment = target / (duration / 16);
            let current = 0;

            const updateCounter = () => {
                current += increment;
                if (current < target) {
                    counter.textContent = Math.floor(current);
                    requestAnimationFrame(updateCounter);
                } else {
                    counter.textContent = target;
                }
            };
            updateCounter();
        });
    };

    // Project filter
    document.querySelectorAll('.filter-tab-landing').forEach(tab => {
        tab.addEventListener('click', function() {
            document.querySelectorAll('.filter-tab-landing').forEach(t => t.classList.remove('active'));
            this.classList.add('active');

            const filter = this.getAttribute('data-filter');
            document.querySelectorAll('.project-card').forEach(card => {
                if (filter === 'all' || card.getAttribute('data-category') === filter) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });

    // Run animations on load
    window.addEventListener('load', () => {
        setTimeout(animateSkillBars, 500);
        animateCounters();
    });

    // Scroll animation for experience section
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const fadeInObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in-visible');
            } else {
                // Remove class when scrolling out to allow re-animation
                entry.target.classList.remove('fade-in-visible');
            }
        });
    }, observerOptions);

    // Observe all exp-card and exp-badge elements
    document.querySelectorAll('.exp-card, .exp-badge').forEach(el => {
        el.classList.add('fade-in-element');
        fadeInObserver.observe(el);

        // Add hover animation
        el.addEventListener('mouseenter', () => {
            el.classList.add('hover-animate');
        });
        el.addEventListener('mouseleave', () => {
            el.classList.remove('hover-animate');
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        const viewMoreBtn = document.getElementById('view-more-btn');
        if (viewMoreBtn) {
            viewMoreBtn.addEventListener('click', function() {
                const hiddenItems = document.querySelectorAll('.exp-hidden-item');
                const isExpanded = this.classList.contains('active');
                const btnText = this.querySelector('span');

                if (isExpanded) {
                    // Collapse
                    window.location.href = '#experience'; 
                    setTimeout(() => {
                        hiddenItems.forEach(item => {
                            item.style.display = 'none';
                            item.classList.remove('fade-in-item');
                        });
                        this.classList.remove('active');
                        btnText.textContent = 'View More Experience';
                    }, 100);
                } else {
                    // Expand
                    hiddenItems.forEach((item, index) => {
                        item.style.display = 'grid'; // FIXED: Restore grid layout
                        item.style.animationDelay = `${index * 0.1}s`;
                        item.classList.add('fade-in-item');
                    });
                    this.classList.add('active');
                    btnText.textContent = 'View Less Experience';
                }
            });
        }
    });
    </script>
@endpush

@push('styles')
    <style>
    /* Hero Section - Typed.js Styles */
    .hero-name-main {
        font-size: 4rem;
        font-weight: 800;
        color: #1f2937;
        margin-bottom: 0.5rem;
        line-height: 1.1;
    }

    .hero-greeting-large {
        font-size: 2rem;
        font-weight: 600;
        color: #4b5563;
        margin-bottom: 0.5rem;
    }

    .hero-typed-text {
        font-size: 2rem;
        font-weight: 600;
        color: #4b5563;
        margin-bottom: 1.5rem;
    }

    .typed-orange {
        color: #5FCECE;
        font-weight: 700;
    }

    .typed-cursor {
        color: #5FCECE;
        font-weight: 400;
    }

    /* Scramble Text Effect Styles */
    .scramble-char {
        color: #5FCECE;
        opacity: 0.8;
    }

    #scramble-text {
        min-height: 1.2em;
        display: inline-block;
    }

    /* Dark theme support */
    @media (prefers-color-scheme: dark) {
        .hero-name-main {
            color: #f9fafb;
        }
        .hero-greeting-large,
        .hero-typed-text {
            color: #d1d5db;
        }
    }

    /* Responsive */
    @media (max-width: 768px) {
        .hero-name-main {
            font-size: 2.5rem;
        }
        .hero-greeting-large,
        .hero-typed-text {
            font-size: 1.25rem;
        }
    }

    /* Professional Experience Section - New Design */
    .experience-section-landing {
        padding: 20px 0;
    }

    .education-section-landing {
        padding: 20px 0;
    }

    .section-title-experience {
        font-size: 4rem;
        font-weight: 800;
        color: #1f2937;
        margin-bottom: 60px;
    }

    /* Fade-in animation for section titles */
    .fade-in-title {
        opacity: 0;
        transform: translateY(30px);
        transition: opacity 0.8s ease-out, transform 0.8s ease-out;
    }

    .fade-in-title.visible {
        opacity: 1;
        transform: translateY(0);
    }

    .exp-timeline {
        position: relative;
        max-width: 1400px;
        margin: 0 auto;
    }

    /* Vertical timeline line */
    .exp-timeline::before {
        content: '';
        position: absolute;
        left: 50%;
        top: 0;
        bottom: 0;
        width: 3px;
        background: #d1d5db;
        transform: translateX(-50%);
    }

    /* Row container for each experience */
    .exp-row {
        display: grid;
        grid-template-columns: 2fr 50px 2fr;
        gap: 0;
        margin-bottom: 80px;
    }

    .exp-row:last-child {
        margin-bottom: 0;
    }

    /* Content area (left or right) */
    .exp-content {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .exp-content.exp-left {
        align-items: flex-end;
        text-align: left;
    }

    .exp-content.exp-right {
        align-items: flex-start;
        text-align: left;
    }

    .exp-content.exp-empty {
        display: block;
    }

    /* Timeline center column */
    .exp-timeline-center {
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
    }

    .exp-timeline-dot {
        width: 14px;
        height: 14px;
        background: #2d3748;
        border-radius: 50%;
        position: relative;
        z-index: 2;
        margin-top: 20px;
    }

    /* Badge styling */
    .exp-badge {
        display: inline-flex;
        align-items: stretch;
        background: #2d3748;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .exp-badge-col {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 14px 24px;
        min-width: 100px;
    }

    .exp-badge-value {
        color: #ffffff;
        font-size: 16px;
        font-weight: 600;
        white-space: nowrap;
    }

    .exp-badge-label {
        color: rgba(255, 255, 255, 0.5);
        font-size: 10px;
        text-transform: uppercase;
        margin-top: 3px;
    }

    .exp-badge-divider {
        width: 1px;
        background: rgba(255, 255, 255, 0.2);
    }

    /* Experience card */
    .exp-card {
        background: #f9fafb;
        border: 1px solid #e5e7eb;
        border-radius: 20px;
        padding: 40px;
        width: 100%;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
        position: relative;
    }

    .exp-card-logo {
        position: absolute;
        top: 16px;
        right: 16px;
        height: 72px;
        width: auto;
        max-width: 120px;
        object-fit: contain;
        border-radius: 8px;
        opacity: 0.85;
    }

    .exp-company {
        font-size: 22px;
        font-weight: 700;
        color: #1f2937;
        margin-bottom: 6px;
    }

    .exp-position {
        font-size: 16px;
        color: #1f2937;
        font-weight: 600;
        margin-bottom: 16px;
    }

    .exp-type {
        color: #6b7280;
        font-weight: 400;
        margin-left: 4px;
    }

    .exp-description {
        font-size: 15px;
        color: #6b7280;
        line-height: 1.7;
        margin-bottom: 20px;
        text-align: justify;
    }

    .exp-tags {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }

    .exp-tag {
        display: inline-block;
        padding: 8px 16px;
        background: #ffffff;
        border: 1px solid #e5e7eb;
        border-radius: 20px;
        font-size: 13px;
        color: #4b5563;
        transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
    }

    .exp-tag:hover {
        transform: translateY(-4px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        background: #2d3748;
        color: #ffffff;
        border-color: #2d3748;
    }

    @media (max-width: 900px) {
        .exp-row {
            grid-template-columns: 20px 1fr;
            gap: 16px;
        }
        .exp-timeline::before {
            left: 10px;
        }
        .exp-content.exp-left,
        .exp-content.exp-right {
            align-items: flex-start;
        }
        .exp-content.exp-empty {
            display: none;
        }
        .exp-timeline-center {
            order: -1;
        }
        .exp-timeline-dot {
            margin-top: 0;
        }
        .exp-card {
            max-width: 100%;
        }
        .section-title-experience {
            font-size: 1.5rem;
        }
    }

    /* Mobile Compact Styles */
    @media (max-width: 576px) {
        .experience-section-landing {
            padding: 30px 0;
        }

        .exp-row {
            margin-bottom: 40px;
        }

        .exp-content {
            gap: 10px;
        }

        /* Badge - Make Compact */
        .exp-badge {
            border-radius: 8px;
            flex-wrap: wrap;
            font-size: 11px;
        }

        .exp-badge-col {
            padding: 8px 12px;
            min-width: auto;
        }

        .exp-badge-value {
            font-size: 12px;
            font-weight: 600;
        }

        .exp-badge-label {
            font-size: 8px;
            margin-top: 2px;
        }

        /* Experience Card - Make Compact */
        .exp-card {
            padding: 16px;
            border-radius: 12px;
        }

        .exp-company {
            font-size: 16px;
            margin-bottom: 4px;
        }

        .exp-position {
            font-size: 13px;
            margin-bottom: 10px;
        }

        .exp-description {
            font-size: 12px;
            line-height: 1.5;
            margin-bottom: 12px;
        }

        /* Tags - Make Smaller */
        .exp-tags {
            gap: 6px;
        }

        .exp-tag {
            padding: 5px 10px;
            font-size: 10px;
            border-radius: 12px;
        }

        /* Timeline adjustments */
        .exp-timeline-dot {
            width: 10px;
            height: 10px;
        }

        .exp-row {
            grid-template-columns: 16px 1fr;
            gap: 12px;
        }

        .exp-timeline::before {
            left: 8px;
            width: 2px;
        }
    }

    /* Fade-in animation on scroll */
    .fade-in-element {
        opacity: 0;
        transform: translateY(30px);
        transition: opacity 0.6s ease-out, transform 0.6s ease-out;
    }

    .fade-in-visible {
        opacity: 1;
        transform: translateY(0);
    }

    /* Stagger animation for left and right items */
    .exp-left .fade-in-element {
        transform: translateX(-30px);
    }

    .exp-right .fade-in-element {
        transform: translateX(30px);
    }

    .exp-left .fade-in-visible,
    .exp-right .fade-in-visible {
        transform: translateX(0);
    }

    /* Hover animation */
    .hover-animate {
        transform: scale(1.02) !important;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1) !important;
        transition: transform 0.3s ease, box-shadow 0.3s ease !important;
    }

        .exp-hidden-item {
            display: none;
        }

        .view-more-btn {
            background-color: #000;
            color: #fff;
            border: none;
            padding: 14px 32px;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 12px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.3);
        }

        .view-more-btn:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 30px -10px rgba(0, 0, 0, 0.4);
            background-color: #1a1a1a;
        }

        .view-more-btn:active {
            transform: translateY(-1px);
        }

        .view-more-btn i {
            transition: transform 0.4s ease;
        }

        .view-more-btn.active i {
            transform: rotate(180deg);
        }

        .fade-in-item {
            animation: fadeInSlide 0.6s ease forwards;
        }

        @keyframes fadeInSlide {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Certifications Section Styles */
        .certifications-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 24px;
            padding: 0 10px;
        }

        .certification-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 24px;
            display: flex;
            align-items: flex-start;
            gap: 16px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
        }

        .certification-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border-color: #5FCECE;
        }

        .cert-icon {
            background: rgba(95, 206, 206, 0.1);
            color: #5FCECE;
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .cert-content {
            flex: 1;
        }

        .cert-name {
            font-size: 18px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 4px;
            line-height: 1.3;
            margin-top: -2px;
        }

        .cert-issuer {
            font-size: 14px;
            color: #4b5563;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .cert-date {
            font-size: 13px;
            color: #9ca3af;
            margin-bottom: 12px;
        }

        .cert-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 13px;
            color: #5FCECE;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .cert-link:hover {
            color: #42b2b2;
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .certifications-grid {
                grid-template-columns: 1fr;
            }

            .certification-card {
                padding: 20px;
            }

            .cert-name {
                font-size: 16px;
            }
        }
    </style>
@endpush
