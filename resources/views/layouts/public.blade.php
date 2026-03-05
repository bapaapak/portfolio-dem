<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Portfolio - Creative Developer based in Jakarta">
    @php
        $settings = \App\Models\Profile::first();
    @endphp
    <title>{{ $settings->website_title ?? 'Portfolio' }} @yield('title_suffix')</title>
    
    <!-- Favicon -->
    @if($settings && $settings->favicon)
        <link rel="icon" href="{{ asset('storage/' . $settings->favicon) }}">
    @else
        <link rel="icon" type="image/png" href="{{ asset('favicon.png') }}">
    @endif
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- Typed.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link rel="stylesheet" href="{{ asset('css/app.css') }}?v=2.0">
    <link rel="stylesheet" href="{{ asset('css/projects.css') }}?v=1.0">
    <link rel="stylesheet" href="{{ asset('css/project-detail.css') }}?v=1.0">
    @stack('styles')
    <style>
        /* Minimalist Dark Sidebar */
        .sidebar {
            width: 60px;
            height: auto;
            max-height: 304px; /* Limit to 5 icons: (44*5) + (8*4) + (10*2) + (16*2) = 304px */
            padding: 16px 0;
            margin: auto 0;
            margin-left: 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: #2d3748;
            border-radius: 20px;
            position: fixed;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            z-index: 1000;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            transition: height 0.3s ease, max-height 0.3s ease;
            overflow: hidden; /* Ensure rounded corners clip content */
        }

        .sidebar-nav {
            flex: 1;
            width: 100%;
            overflow-y: auto; /* Enable scrolling */
            min-height: 0; /* Critical for flex child scrolling */
            
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            gap: 8px; /* Slightly increased gap */
            padding: 10px 0; /* Inner padding for scrolling area */
            
            /* Hide Scrollbar for clean UI */
            scrollbar-width: none; /* Firefox */
            -ms-overflow-style: none;  /* IE 10+ */
        }
        
        .sidebar-nav::-webkit-scrollbar { 
            display: none; /* Chrome/Safari */
        }

        .nav-item {
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            color: rgba(255, 255, 255, 0.6);
            font-size: 18px;
            transition: all 0.3s ease;
            margin: 0;
            padding: 0;
            background: transparent;
        }

        .nav-item:hover {
            color: #ffffff;
            background: rgba(255, 255, 255, 0.1);
        }

        .nav-item.active {
            color: #ffffff;
            background: rgba(255, 255, 255, 0.15);
        }

        .nav-item.active::after {
            display: none;
        }

        .nav-item .nav-emoji {
            display: none;
        }

        .sidebar-brand {
            display: none;
        }

        .sidebar-social {
            display: none;
        }

        .main-content {
            margin-left: 90px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 50px;
                max-height: 240px;
                margin-left: 10px;
                padding: 12px 0;
            }
            .main-content {
                margin-left: 70px;
            }
            .nav-item {
                width: 38px;
                height: 38px;
                font-size: 16px;
            }
        }

        @media (max-width: 576px) {
            .sidebar {
                position: fixed;
                bottom: 16px;
                left: 50%;
                right: auto;
                top: auto;
                transform: translateX(-50%);
                width: auto;
                max-width: 90%;
                height: 56px;
                max-height: none;
                flex-direction: row;
                justify-content: center;
                padding: 0 16px;
                margin: 0;
                border-radius: 28px;
            }
            .sidebar-nav {
                flex-direction: row;
                gap: 8px;
            }
            .main-content {
                margin-left: 0;
                margin-bottom: 80px;
            }
            .nav-item {
                width: 42px;
                height: 42px;
            }
            .mobile-toggle {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- Language Toggle -->
    <div class="lang-toggle">
        <button class="lang-btn" id="lang-id" onclick="setLanguage('id')">ID</button>
        <button class="lang-btn active" id="lang-en" onclick="setLanguage('en')">EN</button>
    </div>

    <div class="layout-wrapper">
        <!-- Sidebar Navigation -->
        <aside class="sidebar" id="sidebar">
            @php
                $profile = \App\Models\Profile::first();
                // Use visible_sections from DB, or default to all if null (though usually it has a default in controller)
                // We fallback to a hardcoded list of keys if needed, but the user wants 'Section Management' sync.
                // NOTE: attributes are accessible via Eloquent.
                $visibleSections = $profile->visible_sections ?? [
                    'hero', 'stats', 'about', 'experience', 'education', 
                    'tech_stack', 'skills', 'certifications', 'committee_activities', 
                    'career_aspiration', 'automation_strategy', 'obstacle_challenge', 
                    'job_description', 'company_profile', 'organization_structure', 
                    'projects', 'contact'
                ];
            @endphp
            <nav class="sidebar-nav">
                {{-- 1. Hero / Home --}}
                @if(in_array('hero', $visibleSections))
                <a href="{{ route('home') }}" class="nav-item {{ request()->routeIs('home') && !request()->hash ? 'active' : '' }}" title="Home" data-translate-title="nav_home">
                    <i class="fas fa-home"></i>
                </a>
                @endif
                
                {{-- 2. Stats --}}
                @if(in_array('stats', $visibleSections))
                <a href="{{ route('home') }}#home" class="nav-item" title="Stats" data-translate-title="nav_stats">
                    <i class="fas fa-chart-bar"></i>
                </a>
                @endif
                
                {{-- 3. About --}}
                @if(in_array('about', $visibleSections))
                <a href="{{ route('home') }}#about" class="nav-item {{ request()->is('/#about') ? 'active' : '' }}" title="About" data-translate-title="nav_about">
                    <i class="fas fa-user"></i>
                </a>
                @endif
                
                {{-- 4. Experience --}}
                @if(in_array('experience', $visibleSections))
                <a href="{{ route('home') }}#experience" class="nav-item" title="Experience" data-translate-title="nav_experience">
                    <i class="fas fa-briefcase"></i>
                </a>
                @endif
                
                {{-- 5. Education --}}
                @if(in_array('education', $visibleSections))
                <a href="{{ route('home') }}#education" class="nav-item" title="Education" data-translate-title="nav_education">
                    <i class="fas fa-graduation-cap"></i>
                </a>
                @endif
                
                {{-- 6. Tech Stack --}}
                @if(in_array('tech_stack', $visibleSections))
                <a href="{{ route('home') }}#tech" class="nav-item" title="Tech Stack" data-translate-title="nav_tech">
                    <i class="fas fa-code"></i>
                </a>
                @endif
                


                {{-- 8. Certifications --}}
                @if(in_array('certifications', $visibleSections))
                <a href="{{ route('home') }}#certifications" class="nav-item" title="Certifications" data-translate-title="nav_certifications">
                    <i class="fas fa-certificate"></i>
                </a>
                @endif

                {{-- 9. Committee Activities --}}
                @if(in_array('committee_activities', $visibleSections))
                <a href="{{ route('home') }}#committee-activities" class="nav-item {{ request()->is('/#committee-activities') ? 'active' : '' }}" title="Committee Activities" data-translate-title="nav_committee_activities">
                    <i class="fas fa-calendar-check"></i>
                </a>
                @endif

                {{-- 10. Career Aspiration --}}
                @if(in_array('career_aspiration', $visibleSections))
                <a href="{{ route('home') }}#career-aspiration" class="nav-item {{ request()->is('/#career-aspiration') ? 'active' : '' }}" title="Career Aspiration" data-translate-title="nav_career_aspiration">
                    <i class="fas fa-rocket"></i>
                </a>
                @endif

                {{-- 11. Automation Strategy --}}
                @if(in_array('automation_strategy', $visibleSections))
                <a href="{{ route('home') }}#automation-strategy" class="nav-item" title="Automation Strategy" data-translate-title="nav_automation_strategy">
                    <i class="fas fa-cogs"></i>
                </a>
                @endif

                {{-- 12. Obstacle & Challenge --}}
                @if(in_array('obstacle_challenge', $visibleSections))
                <a href="{{ route('home') }}#obstacle-challenge" class="nav-item" title="Obstacle & Challenge" data-translate-title="nav_obstacle_challenge">
                    <i class="fas fa-exclamation-triangle"></i>
                </a>
                @endif

                {{-- 13. Job Description --}}
                @if(in_array('job_description', $visibleSections))
                <a href="{{ route('home') }}#job-description" class="nav-item" title="Job Description" data-translate-title="nav_job_description">
                    <i class="fas fa-clipboard-list"></i>
                </a>
                @endif

                {{-- 14. Company Profile --}}
                @if(in_array('company_profile', $visibleSections))
                <a href="{{ route('home') }}#company-profile" class="nav-item {{ request()->is('/#company-profile') ? 'active' : '' }}" title="Company Profile" data-translate-title="nav_company_profile">
                    <i class="fas fa-building"></i>
                </a>
                @endif
                
                {{-- 15. Organization Structure --}}
                @if(in_array('organization_structure', $visibleSections))
                <a href="{{ route('home') }}#organization-structure" class="nav-item {{ request()->is('/#organization-structure') ? 'active' : '' }}" title="Organization Structure" data-translate-title="nav_organization_structure">
                    <i class="fas fa-sitemap"></i>
                </a>
                @endif

                {{-- 16. Projects --}}
                @if(in_array('projects', $visibleSections))
                <a href="{{ route('home') }}#projects" class="nav-item {{ request()->is('/#projects') ? 'active' : '' }}" title="Projects" data-translate-title="nav_projects">
                    <i class="fas fa-folder-open"></i>
                </a>
                @endif
                
                {{-- 17. Contact --}}
                @if(in_array('contact', $visibleSections))
                <a href="{{ route('home') }}#contact-social" class="nav-item {{ request()->is('/#contact-social') ? 'active' : '' }}" title="Contact" data-translate-title="nav_contact">
                    <i class="fas fa-envelope"></i>
                </a>
                @endif
            </nav>
        </aside>


        <!-- Main Content -->
        <main class="main-content">
            @yield('content')

            <!-- Footer -->
            <footer class="footer">
                <div class="container">
                    <p data-translate="footer_text">&copy; {{ date('Y') }} Portfolio. Built with 💜 by <a href="{{ route('home') }}">Developer</a></p>
                    <a href="{{ route('admin.dashboard') }}" class="hidden-admin-link" title="Admin Access">
                        <i class="fas fa-lock"></i>
                    </a>
                </div>
            </footer>
        </main>
    </div>

    <style>
        /* Language Toggle Styles */
        .lang-toggle {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1001;
            display: flex;
            gap: 4px;
            background: #2d3748;
            padding: 4px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .lang-btn {
            padding: 8px 16px;
            border: none;
            background: transparent;
            color: rgba(255, 255, 255, 0.6);
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .lang-btn:hover {
            color: #ffffff;
        }

        .lang-btn.active {
            background: rgba(255, 255, 255, 0.2);
            color: #ffffff;
        }

        @media (max-width: 576px) {
            .lang-toggle {
                top: 10px;
                right: 10px;
            }
            .lang-btn {
                padding: 6px 12px;
                font-size: 12px;
            }
        }

        /* Hidden Admin Link Styles */
        .footer {
            position: relative;
        }
        
        .hidden-admin-link {
            position: absolute;
            bottom: 10px;
            right: 10px;
            color: #4b5563; /* Match footer text color */
            opacity: 0.1;
            font-size: 12px;
            transition: opacity 0.3s ease;
        }
        
        .hidden-admin-link:hover {
            opacity: 1;
            color: #5FCECE;
        }
    </style>

    <script>
        const translations = {
            'en': {
                'nav_home': 'Home',
                'nav_about': 'About',
                'nav_projects': 'Projects',
                'nav_company_profile': 'Company Profile',
                'nav_organization_structure': 'Organization Structure',
                'nav_committee_activities': 'Committee Activities',
                'nav_career_aspiration': 'Career Aspiration',
                'nav_automation_strategy': 'Automation Strategy',
                'nav_contact': 'Contact',
                'hero_cv': 'Download CV',
                'hero_contact': 'Contact Me',
                'stats_years': 'Years Experience',
                'stats_projects': 'Projects Completed',
                'stats_clients': 'Happy Clients',
                'stats_awards': 'Awards Won',
                'section_about': 'About Me',
                'section_exp': 'Professional Experience',
                'section_edu': 'Education',
                'section_tech': 'Tech Stack That I Use',
                'section_tech': 'Tech Stack That I Use',
                'section_tech': 'Tech Stack That I Use',
                'section_projects': 'Featured Projects',
                'section_contact': 'Get In Touch',
                'contact_title': 'Let\'s Work <span class="highlight">Together</span>',
                'contact_text': 'Have a project in mind? I\'d love to hear about it. Send me a message and let\'s create something amazing.',
                'footer_text': '&copy; 2024 Portfolio. Built with 💜 by <a href="/">Developer</a>',
                'hero_greeting': 'Hi, Folks 👋',
                'hero_role_prefix': 'I\'m ',
                'hero_bio': 'I am a Fullstack Developer from Indonesia, I have a strong understanding of programming languages and have experience in Mobile And Web Developer projects.',
                'about_desc': 'I started coding when I was 15, building simple WordPress themes. What began as a curiosity quickly turned into a career obsession. Today, I specialize in the MERN stack and Python. I believe code is just a tool to solve human problems, and I strive to make those solutions as elegant as possible.',
                'exp_start': 'Start',
                'exp_end': 'End',
                'exp_location': 'Location',
                'exp_status_intern': 'Internship (Remote)',
                'exp_status_part': 'Part-time',
                'edu_uni_name': 'University of Technology',
                'edu_uni_degree': 'Bachelor of Computer Science',
                'edu_gpa': 'GPA 3.8',
                'edu_uni_desc': 'Focused on Software Engineering and Artificial Intelligence. Active in student organizations and completed a thesis on Machine Learning for accessibility.',
                'edu_hs_name': 'Vocational High School',
                'edu_hs_degree': 'Software Engineering',
                'edu_best_grad': 'Best Graduate',
                'edu_hs_desc': 'Learned the fundamentals of programming, web development, and database management. Participated in national coding competitions.',
                'proj_all': 'All',
                'proj_view': 'View Project',
                'proj_empty': 'No projects yet. Add some from the admin panel!',
                'social_linkedin': 'Connect professionally',
                'social_github': 'Check out my repositories',
                'social_whatsapp': 'Chat with me',
                'social_instagram': 'See my daily life',
                'social_facebook': 'Connect with me',
                
                // Projects (Seeded)
                'proj_e-commerce-redesign_title': 'E-Commerce Redesign',
                'proj_e-commerce-redesign_desc': 'A complete overhaul of the shopping experience focusing on conversion, accessibility, and mobile responsiveness.',
                'proj_finance-dashboard_title': 'Finance Dashboard',
                'proj_finance-dashboard_desc': 'Real-time data visualization tool for tracking investments and market trends.',
                'proj_travel-brand-identity_title': 'Travel Brand Identity',
                'proj_travel-brand-identity_desc': 'Complete visual identity system for a luxury travel agency specializing in remote destinations.',
                'proj_fintech-mobile-app_title': 'Fintech Mobile App',
                'proj_fintech-mobile-app_desc': 'Personal finance application that helps users track spending and set savings goals.',
                'proj_corporate-landing-page_title': 'Corporate Landing Page',
                'proj_corporate-landing-page_desc': 'Marketing website for B2B SaaS startup, optimized for SEO and conversion.',
                'proj_health-tracker-ios_title': 'Health Tracker iOS',
                'proj_health-tracker-ios_desc': 'Health tracking app connected to Apple Watch for monitoring fitness goals.',
            },
            'id': {
                'nav_home': 'Beranda',
                'nav_about': 'Tentang',
                'nav_projects': 'Proyek',
                'nav_company_profile': 'Profil Perusahaan',
                'nav_organization_structure': 'Struktur Organisasi',
                'nav_committee_activities': 'Aktivitas Kepanitiaan',
                'nav_career_aspiration': 'Aspirasi Karir',
                'nav_automation_strategy': 'Strategi Otomasi',
                'nav_contact': 'Kontak',
                'hero_cv': 'Unduh CV',
                'hero_contact': 'Hubungi Saya',
                'stats_years': 'Tahun Pengalaman',
                'stats_projects': 'Proyek Selesai',
                'stats_clients': 'Klien Puas',
                'stats_awards': 'Penghargaan',
                'section_about': 'Tentang Saya',
                'section_exp': 'Pengalaman Kerja',
                'section_edu': 'Pendidikan',
                'section_tech': 'Teknologi Yang Saya Gunakan',
                'section_certifications': 'Sertifikasi',
                'section_projects': 'Proyek Unggulan',
                'section_contact': 'Hubungi Saya',
                'contact_title': 'Mari Bekerja <span class="highlight">Sama</span>',
                'contact_text': 'Punya ide proyek? Saya ingin mendengarnya. Kirim pesan dan mari ciptakan sesuatu yang luar biasa.',
                'footer_text': '&copy; 2024 Portfolio. Dibuat dengan 💜 oleh <a href="/">Developer</a>',
                'hero_greeting': 'Halo, Semuanya 👋',
                'hero_role_prefix': 'Saya seorang ',
                'hero_bio': 'Saya adalah Pengembang Fullstack dari Indonesia, saya memiliki pemahaman yang kuat tentang bahasa pemrograman dan berpengalaman dalam proyek Pengembang Web dan Seluler.',
                'about_desc': 'Saya mulai coding sejak usia 15 tahun, membuat tema WordPress sederhana. Apa yang berawal dari rasa ingin tahu dengan cepat berubah menjadi obsesi karier. Hari ini, saya berspesialisasi dalam tumpukan MERN dan Python. Saya percaya kode hanyalah alat untuk memecahkan masalah manusia, dan saya berusaha membuat solusi tersebut se-elegan mungkin.',
                'exp_start': 'Mulai',
                'exp_end': 'Sampai',
                'exp_location': 'Lokasi',
                'exp_status_intern': 'Magang (Remote)',
                'exp_status_part': 'Paruh Waktu',
                'edu_uni_name': 'Universitas Teknologi',
                'edu_uni_degree': 'Sarjana Ilmu Komputer',
                'edu_gpa': 'IPK 3.8',
                'edu_uni_desc': 'Fokus pada Rekayasa Perangkat Lunak dan Kecerdasan Buatan. Aktif dalam organisasi kemahasiswaan dan menyelesaikan skripsi tentang Machine Learning untuk aksesibilitas.',
                'edu_hs_name': 'Sekolah Menengah Kejuruan',
                'edu_hs_degree': 'Rekayasa Perangkat Lunak',
                'edu_best_grad': 'Lulusan Terbaik',
                'edu_hs_desc': 'Mempelajari dasar-dasar pemrograman, pengembangan web, dan manajemen basis data. Berpartisipasi dalam kompetisi coding nasional.',
                'proj_all': 'Semua',
                'proj_view': 'Lihat Proyek',
                'proj_empty': 'Belum ada proyek. Tambahkan dari panel admin!',
                'social_linkedin': 'Terhubung secara profesional',
                'social_github': 'Lihat repositori saya',
                'social_whatsapp': 'Ngobrol dengan saya',
                'social_instagram': 'Lihat keseharian saya',
                'social_facebook': 'Terhubung dengan saya',
                
                // Projects (Seeded)
                'proj_e-commerce-redesign_title': 'Desain Ulang E-Commerce',
                'proj_e-commerce-redesign_desc': 'Perombakan total pengalaman berbelanja yang berfokus pada konversi, aksesibilitas, dan responsivitas seluler.',
                'proj_finance-dashboard_title': 'Dashboard Keuangan',
                'proj_finance-dashboard_desc': 'Alat visualisasi data waktu nyata untuk melacak investasi dan tren pasar.',
                'proj_travel-brand-identity_title': 'Identitas Merek Travel',
                'proj_travel-brand-identity_desc': 'Sistem identitas visual lengkap untuk agen perjalanan mewah yang berspesialisasi dalam destinasi terpencil.',
                'proj_fintech-mobile-app_title': 'Aplikasi Mobile Fintech',
                'proj_fintech-mobile-app_desc': 'Aplikasi keuangan pribadi yang membantu pengguna melacak pengeluaran dan menetapkan tujuan tabungan.',
                'proj_corporate-landing-page_title': 'Halaman Landing Korporat',
                'proj_corporate-landing-page_desc': 'Situs web pemasaran untuk startup SaaS B2B, dioptimalkan untuk SEO dan konversi.',
                'proj_health-tracker-ios_title': 'Pelacak Kesehatan iOS',
                'proj_health-tracker-ios_desc': 'Aplikasi pelacakan kesehatan yang terhubung ke Apple Watch untuk memantau tujuan kebugaran.',
            }
        };

        function setLanguage(lang) {
            // Update active button
            document.querySelectorAll('.lang-btn').forEach(btn => btn.classList.remove('active'));
            document.getElementById('lang-' + lang).classList.add('active');
            
            // Store preference
            localStorage.setItem('lang', lang);
            
            // Apply translations to text content
            document.querySelectorAll('[data-translate]').forEach(element => {
                const key = element.getAttribute('data-translate');
                if (translations[lang][key]) {
                    element.innerHTML = translations[lang][key];
                }
            });

            // Apply translations to titles (for sidebar tooltips)
            document.querySelectorAll('[data-translate-title]').forEach(element => {
                const key = element.getAttribute('data-translate-title');
                if (translations[lang][key]) {
                    element.setAttribute('title', translations[lang][key]);
                }
            });

            // Apply dynamic translations from DB (Database Content)
            document.querySelectorAll('[data-dynamic-id][data-dynamic-en]').forEach(element => {
                const content = lang === 'id' ? element.getAttribute('data-dynamic-id') : element.getAttribute('data-dynamic-en');
                // Only update if content is not empty/null "null" string
                if (content && content !== 'null' && content.trim() !== '') {
                    element.innerHTML = content;
                }
            });

            // Toggle Class-based Dual Language Content (New System)
            if (lang === 'id') {
                document.querySelectorAll('.lang-id').forEach(el => {
                    el.style.display = el.getAttribute('data-display') || 'block';
                });
                document.querySelectorAll('.lang-en').forEach(el => {
                    el.style.display = 'none';
                });
            } else {
                document.querySelectorAll('.lang-en').forEach(el => {
                    el.style.display = el.getAttribute('data-display') || 'block';
                });
                document.querySelectorAll('.lang-id').forEach(el => {
                    el.style.display = 'none';
                });
            }
            
            console.log('Language set to: ' + lang);
        }

        // Load saved language preference
        document.addEventListener('DOMContentLoaded', function() {
            const savedLang = localStorage.getItem('lang') || 'en';
            setLanguage(savedLang);

            // Scroll Spy for Sidebar
            const sections = document.querySelectorAll('section[id]');
            const navLinks = document.querySelectorAll('.sidebar-nav .nav-item');

            const observerOptions = {
                root: null,
                rootMargin: '-50% 0px -50% 0px', // Active when element is in middle of screen
                threshold: 0
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const id = entry.target.getAttribute('id');
                        
                        // Remove active class from all links
                        navLinks.forEach(link => {
                            link.classList.remove('active');
                            
                            // Check if this link corresponds to the current section
                            const href = link.getAttribute('href');
                            const isHome = id === 'home' && !href.includes('#');
                            const isSection = href.includes('#' + id);
                            
                            if (isHome || isSection) {
                                link.classList.add('active');
                            }
                        });
                    }
                });
            }, observerOptions);

            sections.forEach(section => {
                if(section.id === 'home' || section.id === 'about' || section.id === 'projects' || section.id === 'contact-social') {
                    observer.observe(section);
                }
            });
        });
    </script>

    @stack('scripts')
</body>
</html>
