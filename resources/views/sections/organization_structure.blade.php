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
                background: linear-gradient(160deg, #e8f4fd 0%, #d4e8f7 100%);
                border: 1.5px solid rgba(15, 36, 74, 0.22);
                border-radius: 18px;
                padding: 0;
                box-shadow: 0 3px 12px rgba(15, 36, 74, 0.10);
                transition: transform 0.25s ease, box-shadow 0.25s ease;
                overflow: hidden;
                position: relative;
                z-index: 10;
            }
            .org-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 28px rgba(15, 36, 74, 0.18);
            }

            /* Top accent bar */
            .org-card-accent {
                height: 4px;
                background: linear-gradient(90deg, #0f244a 0%, #1e3a5f 50%, #4a7ba8 100%);
                width: 100%;
            }

            /* Avatar */
            .org-avatar-icon {
                width: 54px;
                height: 54px;
                border-radius: 50%;
                background: linear-gradient(135deg, #9cc2e5 0%, #78b0d4 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                color: #0f244a;
                font-size: 20px;
                border: 2.5px solid rgba(15, 36, 74, 0.25);
                box-shadow: 0 3px 10px rgba(15, 36, 74, 0.20);
                margin: 0 auto;
            }
            .org-avatar-wrapper {
                width: 54px;
                height: 54px;
                border-radius: 50%;
                overflow: hidden;
                border: 2.5px solid rgba(15, 36, 74, 0.3);
                box-shadow: 0 3px 10px rgba(15, 36, 74, 0.20);
                margin: 0 auto;
            }

            /* Name */
            .org-member-name {
                font-size: 11.5px;
                font-weight: 800;
                color: #0f244a;
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
                color: #1e3a5f;
                background: linear-gradient(135deg, #d4e8f7 0%, #9cc2e5 100%);
                border: 1px solid rgba(15, 36, 74, 0.25);
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
                border-top: 2px solid #9cc2e5;
                width: 50%; height: 20px;
                z-index: 1;
            }
            .tree li::after {
                right: auto; left: 50%;
                border-left: 2px solid #9cc2e5;
            }
            .tree li:only-child::after, .tree li:only-child::before { display: none; }
            .tree li:only-child { padding-top: 0; }
            .tree li:first-child::before, .tree li:last-child::after { border: 0 none; }
            .tree li:last-child::before {
                border-right: 2px solid #9cc2e5;
                border-radius: 0 5px 0 0;
            }
            .tree li:first-child::after {
                border-radius: 5px 0 0 0;
                border-left: 2px solid #9cc2e5;
            }
            .org-chart-container > ul > li::before,
            .org-chart-container > ul > li::after { display: none !important; }
            .org-chart-container > ul > li { padding-top: 0 !important; }
            .tree ul ul::before {
                content: '';
                position: absolute; top: 0; left: 50%;
                border-left: 2px solid #9cc2e5;
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
                    'board_of_director' => 'bg-gradient-to-r from-[#0f244a] to-[#1e3a5f]',
                    'division' => 'bg-gradient-to-r from-[#1e3a5f] to-[#2d5a87]',
                    'department' => 'bg-gradient-to-r from-[#2d5a87] to-[#4a7ba8]',
                    'section' => 'bg-gradient-to-r from-[#4a7ba8] to-[#6a9bc0]',
                    'staff' => 'bg-gradient-to-r from-[#6a9bc0] to-[#9cc2e5]',
                    'admin' => 'bg-gradient-to-r from-gray-500 to-gray-600',
                ];
                $levelBorderColors = [
                    'board_of_director' => 'border-[#1e3a5f] bg-[#e8f4fd]',
                    'division' => 'border-[#2d5a87] bg-[#e8f4fd]',
                    'department' => 'border-[#4a7ba8] bg-[#e8f4fd]',
                    'section' => 'border-[#6a9bc0] bg-[#e8f4fd]',
                    'staff' => 'border-[#9cc2e5] bg-[#e8f4fd]',
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
