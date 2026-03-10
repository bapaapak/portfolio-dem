<!-- Organization Structure Section -->
<section class="organization-section" id="organization-structure" style="padding: 0 0 60px 0;">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" style="margin-bottom: 40px;">
            <span class="lang-id" data-display="inline">Struktur Organisasi</span>
            <span class="lang-en" style="display: none;" data-display="inline">Organization Structure</span>
        </h2>
        
        @if($organizationMembers->count() > 0)
            <style>
            /* ===== ORG CARD BASE ===== */
            .org-card {
                background: linear-gradient(160deg, #eef2ff 0%, #e0e7ff 100%);
                border: 1.5px solid rgba(99, 102, 241, 0.22);
                border-radius: 18px;
                padding: 0;
                box-shadow: 0 3px 12px rgba(99, 102, 241, 0.10);
                transition: transform 0.25s ease, box-shadow 0.25s ease;
                overflow: hidden;
                position: relative;
                z-index: 10;
            }
            .org-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 28px rgba(99, 102, 241, 0.18);
            }

            /* Top accent bar */
            .org-card-accent {
                height: 4px;
                background: linear-gradient(90deg, #6366f1 0%, #8b5cf6 50%, #a78bfa 100%);
                width: 100%;
            }

            /* Avatar */
            .org-avatar-icon {
                width: 54px;
                height: 54px;
                border-radius: 50%;
                background: linear-gradient(135deg, #c7d2fe 0%, #a5b4fc 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                color: #4338ca;
                font-size: 20px;
                border: 2.5px solid rgba(99, 102, 241, 0.25);
                box-shadow: 0 3px 10px rgba(99, 102, 241, 0.20);
                margin: 0 auto;
            }
            .org-avatar-wrapper {
                width: 54px;
                height: 54px;
                border-radius: 50%;
                overflow: hidden;
                border: 2.5px solid rgba(99, 102, 241, 0.3);
                box-shadow: 0 3px 10px rgba(99, 102, 241, 0.20);
                margin: 0 auto;
            }

            /* Name */
            .org-member-name {
                font-size: 11.5px;
                font-weight: 800;
                color: #1e1b4b;
                text-transform: uppercase;
                letter-spacing: 0.3px;
                line-height: 1.3;
                margin-bottom: 8px;
            }

            /* Position badge */
            .org-position-badge {
                display: inline-block;
                font-size: 9px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.4px;
                color: #78350f;
                background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
                border: 1px solid rgba(234, 179, 8, 0.35);
                padding: 4px 10px;
                border-radius: 20px;
                max-width: 160px;
                word-break: break-word;
                line-height: 1.4;
            }

            /* Department tag */
            .org-dept-tag {
                display: inline-flex;
                align-items: center;
                gap: 4px;
                font-size: 9px;
                font-weight: 500;
                color: #475569;
                background: rgba(241, 245, 249, 0.9);
                border: 1px solid #cbd5e1;
                border-radius: 8px;
                padding: 3px 8px;
                margin-top: 7px;
            }

            /* ===== TUBAGUS GREEN HIGHLIGHT ===== */
            .tree li[data-member-name*="Tubagus" i] > .org-card {
                background: linear-gradient(160deg, #f0fdf4 0%, #dcfce7 100%) !important;
                border: 1.5px solid rgba(34, 197, 94, 0.30) !important;
                box-shadow: 0 3px 12px rgba(34, 197, 94, 0.13) !important;
            }
            .tree li[data-member-name*="Tubagus" i] > .org-card .org-card-accent {
                background: linear-gradient(90deg, #22c55e, #16a34a) !important;
            }
            .tree li[data-member-name*="Tubagus" i] > .org-card .org-avatar-icon {
                background: linear-gradient(135deg, #bbf7d0 0%, #86efac 100%) !important;
                color: #15803d !important;
                border-color: rgba(34, 197, 94, 0.3) !important;
                box-shadow: 0 3px 10px rgba(34, 197, 94, 0.20) !important;
            }

            /* ===== TREE / CONNECTOR LINES ===== */
            .tree ul {
                padding-top: 20px;
                position: relative;
                display: flex;
                justify-content: center;
            }
            .tree li {
                text-align: center;
                list-style-type: none;
                position: relative;
                padding: 20px 8px 0 8px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .tree li::before, .tree li::after {
                content: '';
                position: absolute; top: 0; right: 50%;
                border-top: 2px solid #a5b4fc;
                width: 50%; height: 20px;
                z-index: 1;
            }
            .tree li::after {
                right: auto; left: 50%;
                border-left: 2px solid #a5b4fc;
            }
            .tree li:only-child::after, .tree li:only-child::before { display: none; }
            .tree li:only-child { padding-top: 0; }
            .tree li:first-child::before, .tree li:last-child::after { border: 0 none; }
            .tree li:last-child::before {
                border-right: 2px solid #a5b4fc;
                border-radius: 0 5px 0 0;
            }
            .tree li:first-child::after {
                border-radius: 5px 0 0 0;
                border-left: 2px solid #a5b4fc;
            }
            .org-chart-container > ul > li::before,
            .org-chart-container > ul > li::after { display: none !important; }
            .org-chart-container > ul > li { padding-top: 0 !important; }
            .tree ul ul::before {
                content: '';
                position: absolute; top: 0; left: 50%;
                border-left: 2px solid #a5b4fc;
                width: 0; height: 20px;
                z-index: 1;
            }

            /* ===== DEEP DROP ===== */
            .tree li.deep-drop:only-child {
                padding-top: 190px !important;
            }
            .tree li.deep-drop:only-child::after {
                display: block !important;
                border-top: none;
                height: 190px !important;
                z-index: 1;
            }
            .tree li.deep-drop {
                padding-top: 190px !important;
            }
            .tree li.deep-drop::before,
            .tree li.deep-drop::after {
                height: 190px !important;
            }
            /* RINA: same level as LABERTE's direct children but visually drops to MONICA row */
            .tree li[data-member-name*="Rina" i].deep-drop {
                padding-top: 255px !important;
            }
            .tree li[data-member-name*="Rina" i].deep-drop::before,
            .tree li[data-member-name*="Rina" i].deep-drop::after {
                height: 255px !important;
            }

            /* ===== RESPONSIVE ===== */
            @media (max-width: 768px) {
                .organization-section .container {
                    overflow-x: auto;
                    -webkit-overflow-scrolling: touch;
                    padding-bottom: 16px;
                }
                .org-chart-container { min-width: 1100px; }
            }
            @media (min-width: 769px) and (max-width: 1024px) {
                .organization-section .container {
                    overflow-x: auto;
                    -webkit-overflow-scrolling: touch;
                }
                .org-chart-container { min-width: 900px; }
            }
            </style>

            @php
                $levelColors = [
                    'board_of_director' => 'bg-gradient-to-r from-indigo-600 to-purple-600',
                    'division' => 'bg-gradient-to-r from-blue-500 to-indigo-500',
                    'department' => 'bg-gradient-to-r from-teal-500 to-blue-500',
                    'section' => 'bg-gradient-to-r from-green-500 to-teal-500',
                    'staff' => 'bg-gradient-to-r from-amber-500 to-orange-500',
                    'admin' => 'bg-gradient-to-r from-gray-500 to-gray-600',
                ];
                $levelBorderColors = [
                    'board_of_director' => 'border-indigo-300 bg-indigo-50',
                    'division' => 'border-blue-300 bg-blue-50',
                    'department' => 'border-teal-300 bg-teal-50',
                    'section' => 'border-green-300 bg-green-50',
                    'staff' => 'border-amber-300 bg-amber-50',
                    'admin' => 'border-gray-400 bg-gray-100',
                ];
            @endphp

            <div class="org-chart-container tree">
                <ul class="flex justify-center">
                    @foreach($organizationMembers as $member)
                        @include('partials.org-node', [
                            'member' => $member,
                            'levelColors' => $levelColors,
                            'levelBorderColors' => $levelBorderColors
                        ])
                    @endforeach
                </ul>
            </div>
        @else
            <div class="text-center" style="padding: 40px; background: var(--bg-secondary); border-radius: 16px;">
                <i class="fas fa-sitemap" style="font-size: 48px; opacity: 0.3; margin-bottom: 16px; color: var(--text-muted);"></i>
                <p style="color: var(--text-secondary);">
                    <span class="lang-id" data-display="block">Data struktur organisasi akan segera tersedia</span>
                    <span class="lang-en" style="display: none;" data-display="block">Organization structure data will be available soon</span>
                </p>
            </div>
        @endif
    </div>
</section>
