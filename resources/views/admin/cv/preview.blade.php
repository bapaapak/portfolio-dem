<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV - {{ $profile->name ?? 'Your Name' }}</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', Arial, sans-serif;
            font-size: 10pt;
            line-height: 1.4;
            color: #333;
            background: #f5f5f5;
            padding-top: 90px;
        }
        
        .cv-container {
            width: var(--page-width, 210mm);
            min-height: var(--page-height, 297mm);
            margin: 0 auto 20px;
            background: white;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 15mm;
            transition: all 0.3s ease;
        }
        
        /* Header Section */
        .cv-header {
            background: white;
            color: #333;
            padding: 20px 25px;
            display: flex;
            align-items: center;
            gap: 20px;
            border-bottom: 2px solid #e5e7eb;
        }
        
        .cv-photo {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: none;
            object-fit: cover;
            flex-shrink: 0;
            display: block;
        }
        
        .cv-header-info {
            flex: 1;
        }
        
        .cv-name {
            font-size: 18pt;
            font-weight: 700;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #1f2937;
        }
        
        .cv-contact-row {
            display: flex;
            flex-wrap: wrap;
            gap: 5px 20px;
            font-size: 9pt;
        }
        
        .cv-contact-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .cv-contact-item strong {
            color: #6b7280;
        }
        
        /* Main Content */
        .cv-content {
            padding: 20px 25px;
        }
        
        .cv-section {
            margin-bottom: 18px;
        }
        
        .cv-section-title {
            font-size: 11pt;
            font-weight: 700;
            color: #1f2937;
            border-bottom: 2px solid #333;
            padding-bottom: 3px;
            margin-bottom: 10px;
            text-transform: uppercase;
        }
        
        .cv-section-content {
            padding-left: 0;
        }
        
        /* Profile */
        .cv-profile-text {
            text-align: justify;
            color: #444;
        }
        
        /* Education */
        .cv-edu-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }
        
        .cv-edu-name {
            font-weight: 600;
        }
        
        .cv-edu-detail {
            color: #666;
            font-size: 9pt;
        }
        
        .cv-edu-year {
            font-weight: 600;
            color: #1f2937;
        }
        
        /* Experience */
        .cv-exp-item {
            margin-bottom: 12px;
        }
        
        .cv-exp-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 3px;
        }
        
        .cv-exp-company {
            font-weight: 700;
            color: #1f2937;
        }
        
        .cv-exp-date {
            font-weight: 600;
            color: #666;
            font-size: 9pt;
            white-space: nowrap;
        }
        
        .cv-exp-title {
            font-weight: 500;
            color: #444;
            margin-bottom: 3px;
            font-size: 9pt;
        }
        
        .cv-exp-desc {
            font-size: 9pt;
            color: #555;
            margin-left: 0;
            padding-left: 18px;
        }
        
        .cv-exp-desc li {
            margin-bottom: 3px;
        }
        
        /* Skills */
        .cv-skills-list {
            padding-left: 20px;
            color: #444;
        }
        
        .cv-skills-list li {
            margin-bottom: 4px;
        }
        
        /* Certifications */
        .cv-cert-list {
            padding-left: 20px;
            color: #444;
        }
        
        .cv-cert-list li {
            margin-bottom: 4px;
        }
        
        .cv-cert-issuer {
            color: #888;
        }
        
        /* Print Styles */
        @media print {
            body {
                background: white;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
            
            .no-print {
                display: none !important;
            }

            .cv-container {
                width: 100% !important;
                max-width: none !important;
                margin: 0 !important;
                padding: 15mm !important;
                box-shadow: none !important;
                min-height: auto !important;
            }

            .cv-section {
                page-break-inside: avoid;
            }
            
            .cv-exp-item, .cv-edu-item {
                page-break-inside: avoid;
            }
            
            @page {
                size: auto;
                margin: 0mm;
            }
        }
        
        /* Print Button */
        .print-controls {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: white;
            padding: 15px 30px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
        }
        
        .controls-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .paper-select-group {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #f3f4f6;
            padding: 8px 16px;
            border-radius: 8px;
        }
        
        .paper-select-label {
            font-size: 14px;
            font-weight: 500;
            color: #4b5563;
        }
        
        .paper-select {
            border: 1px solid #d1d5db;
            border-radius: 6px;
            padding: 4px 8px;
            font-size: 14px;
            color: #1f2937;
            outline: none;
            cursor: pointer;
        }
        
        .paper-select:focus {
            border-color: #3b82f6;
            ring: 2px solid #93c5fd;
        }
        
        .print-btn {
            background: #374151;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: background 0.3s;
            text-decoration: none;
        }
        
        .print-btn:hover {
            background: #1f2937;
        }
        
        .back-btn {
            background: #6b7280;
        }
        
        .back-btn:hover {
            background: #4b5563;
        }
    </style>
</head>
<body>
    <div class="print-controls no-print">
        <div class="controls-left">
            <a href="{{ route('admin.cv.index') }}" class="print-btn back-btn">
                ← Kembali
            </a>
            <div class="paper-select-group">
                <label class="paper-select-label">Ukuran Kertas:</label>
                <select id="paperSize" onchange="changePaperSize(this.value)" class="paper-select">
                    <option value="a4">A4 (210 x 297 mm)</option>
                    <option value="letter">Letter (216 x 279 mm)</option>
                </select>
            </div>
            <div class="paper-select-group">
                <label class="paper-select-label">Bahasa:</label>
                <select id="cvLang" onchange="changeLanguage(this.value)" class="paper-select">
                    <option value="id">Indonesia</option>
                    <option value="en">English</option>
                </select>
            </div>
            </div>
        </div>
        <button onclick="window.print()" class="print-btn">
            <svg width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                <path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z"/>
                <path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z"/>
            </svg>
            Cetak / Simpan PDF
        </button>
    </div>

    <!-- Script to handle paper size changes -->
    <script>
        function changePaperSize(size) {
            const container = document.querySelector('.cv-container');
            let width, height;
            
            if (size === 'a4') {
                width = '210mm';
                height = '297mm';
            } else if (size === 'letter') {
                width = '216mm';
                height = '279mm';
            }
            
            document.documentElement.style.setProperty('--page-width', width);
            document.documentElement.style.setProperty('--page-height', height);
            
            // Update Print Rule
            const styleId = 'dynamic-page-style';
            let style = document.getElementById(styleId);
            if (!style) {
                style = document.createElement('style');
                style.id = styleId;
                document.head.appendChild(style);
            }
            
            style.innerHTML = `@media print { @page { size: ${size} portrait; margin: 0; } }`;
        }
        
        // Language Dictionary
        const translations = {
            id: {
                profile: 'PROFIL',
                education: 'PENDIDIKAN',
                experience: 'PENGALAMAN KERJA',
                hardskill: 'KEAHLIAN (HARD SKILL)',
                softskill: 'KEAHLIAN (SOFT SKILL)',
                certifications: 'SERTIFIKASI',
                present: 'Sekarang',
                address: 'Alamat:',
                phone: 'Telepon:',
                email: 'Email:'
            },
            en: {
                profile: 'PROFILE',
                education: 'EDUCATION',
                experience: 'WORK EXPERIENCE',
                hardskill: 'HARD SKILLS',
                softskill: 'SOFT SKILLS',
                certifications: 'CERTIFICATIONS',
                present: 'Present',
                address: 'Address:',
                phone: 'Phone:',
                email: 'Email:'
            }
        };

        function changeLanguage(lang) {
            const t = translations[lang];
            
            // Update Headers
            setText('.title-profile', t.profile);
            setText('.title-education', t.education);
            setText('.title-experience', t.experience);
            setText('.title-hardskill', t.hardskill);
            setText('.title-softskill', t.softskill);
            setText('.title-certifications', t.certifications);
            
            // Update Labels
            setText('.label-address', t.address);
            setText('.label-phone', t.phone);
            setText('.label-email', t.email);
            
            // Update "Present" text in dates
            document.querySelectorAll('.date-present').forEach(el => el.textContent = t.present);
        }
        
        function setText(selector, text) {
            const el = document.querySelector(selector);
            if(el) el.textContent = text;
        }

        // Initialize default
        document.addEventListener('DOMContentLoaded', () => {
            changePaperSize('a4');
            changeLanguage('id');
        });
    </script>

    <div class="cv-container">
        <!-- Header -->
        <div class="cv-header">
            @php
                $photoPath = null;
                if($profile && $profile->photo && file_exists(public_path('storage/' . $profile->photo))) {
                    $photoPath = asset('storage/' . $profile->photo);
                } elseif(file_exists(public_path('images/cv-photo.png'))) {
                    $photoPath = asset('images/cv-photo.png');
                } elseif(file_exists(public_path('images/profile-about.png'))) {
                    $photoPath = asset('images/profile-about.png');
                } elseif(file_exists(public_path('images/profile.png'))) {
                    $photoPath = asset('images/profile.png');
                }
            @endphp
            
            @if($photoPath)
                <img src="{{ $photoPath }}" alt="{{ $profile->name ?? 'Profile' }}" class="cv-photo">
            @else
                <div class="cv-photo" style="background: #e5e7eb; display: flex; align-items: center; justify-content: center;">
                    <svg width="40" height="40" fill="#9ca3af" viewBox="0 0 16 16">
                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4z"/>
                    </svg>
                </div>
            @endif
            <div class="cv-header-info">
                <h1 class="cv-name">{{ $profile->name ?? 'YOUR NAME' }}</h1>
                <div class="cv-contact-row">
                    @if($profile && $profile->location)
                        <div class="cv-contact-item">
                            <strong class="label-address">Address:</strong> {{ $profile->location }}
                        </div>
                    @endif
                    @if($profile && $profile->phone)
                        <div class="cv-contact-item">
                            <strong class="label-phone">Phone:</strong> {{ $profile->phone }}
                        </div>
                    @endif
                    @if($profile && $profile->email)
                        <div class="cv-contact-item">
                            <strong class="label-email">Email:</strong> {{ $profile->email }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
        
        <!-- Content -->
        <div class="cv-content">
            <!-- Profile -->
            @if($profile && $profile->story)
            <div class="cv-section">
            <div class="cv-section">
                <h2 class="cv-section-title title-profile">PROFIL</h2>
                <div class="cv-section-content">
                <div class="cv-section-content">
                    <p class="cv-profile-text">{{ $profile->story }}</p>
                </div>
            </div>
            @endif
            
            <!-- Education -->
            @if($educations->count() > 0)
            <div class="cv-section">
            <div class="cv-section">
                <h2 class="cv-section-title title-education">PENDIDIKAN</h2>
                <div class="cv-section-content">
                <div class="cv-section-content">
                    @foreach($educations as $edu)
                    <div class="cv-edu-item">
                        <div>
                            <div class="cv-edu-name">{{ $edu->institution }}</div>
                            <div class="cv-edu-detail">
                                {{ $edu->degree }}
                                @if($edu->gpa) - GPA {{ $edu->gpa }} @endif
                            </div>
                        </div>
                        <div class="cv-edu-year">
                        <div class="cv-edu-year">
                            {{ $edu->end_date ? $edu->end_date->format('Y') : '' }} <span class="{{ !$edu->end_date ? 'date-present' : '' }}">{{ !$edu->end_date ? 'Present' : '' }}</span>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            @endif
            
            <!-- Experience -->
            @if($experiences->count() > 0)
            <div class="cv-section">
            <div class="cv-section">
                <h2 class="cv-section-title title-experience">PENGALAMAN KERJA</h2>
                <div class="cv-section-content">
                <div class="cv-section-content">
                    @foreach($experiences as $exp)
                    <div class="cv-exp-item">
                        <div class="cv-exp-header">
                            <span class="cv-exp-company">{{ $exp->company }}</span>
                            <span class="cv-exp-date">
                            <span class="cv-exp-date">
                                {{ $exp->start_date ? $exp->start_date->format('M Y') : '' }} - {{ $exp->end_date ? $exp->end_date->format('M Y') : '' }} <span class="{{ !$exp->end_date ? 'date-present' : '' }}">{{ !$exp->end_date ? 'Present' : '' }}</span>
                            </span>
                        </div>
                        <div class="cv-exp-title">{{ $exp->title }}</div>
                        @if($exp->description)
                        <ul class="cv-exp-desc">
                            @foreach(explode("\n", $exp->description) as $line)
                                @if(trim($line))
                                    @if(str_starts_with(trim($line), '-'))
                                        <li>{{ trim(substr(trim($line), 1)) }}</li>
                                    @else
                                        <li>{{ trim($line) }}</li>
                                    @endif
                                @endif
                            @endforeach
                        </ul>
                        @endif
                    </div>
                    @endforeach
                </div>
            </div>
            @endif
            
            <!-- Technical Skills -->
            @if($technicalSkills->count() > 0)
            <div class="cv-section">
                <h2 class="cv-section-title">HARD SKILL</h2>
                <div class="cv-section-content">
                    <ul class="cv-skills-list">
                        @foreach($technicalSkills as $skill)
                            <li>
                                @if($skill->category)
                                    <strong>{{ $skill->category }}</strong>
                                    @if($skill->items) ({{ $skill->items }}) @endif
                                @else
                                    {{ $skill->items }}
                                @endif
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
            @endif
            
            <!-- Soft Skills -->
            @if($softSkills->count() > 0)
            <div class="cv-section">
                <h2 class="cv-section-title">SOFT SKILL</h2>
                <div class="cv-section-content">
                    <ul class="cv-skills-list">
                        @foreach($softSkills as $skill)
                            <li>
                                {{ $skill->category ?: $skill->items }}
                                @if($skill->category && $skill->items)
                                    : {{ $skill->items }}
                                @endif
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
            @endif
            
            <!-- Certifications -->
            @if($certifications->count() > 0)
            <div class="cv-section">
                <h2 class="cv-section-title">SERTIFIKASI</h2>
                <div class="cv-section-content">
                    <ul class="cv-cert-list">
                        @foreach($certifications as $cert)
                            <li>
                                {{ $cert->name }}
                                @if($cert->issuer)
                                    <span class="cv-cert-issuer">| {{ $cert->issuer }}</span>
                                @endif
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
            @endif
        </div>
    </div>
</body>
</html>
