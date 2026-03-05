<!-- Organization Structure Section -->
<section class="organization-section" id="organization-structure" style="padding: 0 0 60px 0;">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" style="margin-bottom: 40px;">
            <span class="lang-id" data-display="inline">Struktur Organisasi</span>
            <span class="lang-en" style="display: none;" data-display="inline">Organization Structure</span>
        </h2>
        
        @if($organizationMembers->count() > 0)
            <style>
            /* Organization Card Styles */
            .org-card {
                background: linear-gradient(145deg, #ffffff 0%, #f8fafc 100%);
                border-radius: 16px;
                padding: 0;
                box-shadow: 
                    0 4px 6px -1px rgba(0, 0, 0, 0.06),
                    0 2px 4px -1px rgba(0, 0, 0, 0.04),
                    0 0 0 1px rgba(99, 102, 241, 0.08);
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                overflow: hidden;
                position: relative;
                z-index: 10;
            }

            .org-card:hover {
                transform: translateY(-4px);
                box-shadow: 
                    0 20px 25px -5px rgba(99, 102, 241, 0.1),
                    0 10px 10px -5px rgba(99, 102, 241, 0.04),
                    0 0 0 2px rgba(99, 102, 241, 0.15);
            }

            .org-card-accent {
                height: 4px;
                background: linear-gradient(90deg, #6366f1, #8b5cf6, #a855f7);
                width: 100%;
            }

            .org-avatar-wrapper {
                width: 52px;
                height: 52px;
                padding: 3px;
                border-radius: 50%;
                background: linear-gradient(135deg, #6366f1, #8b5cf6);
                box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
            }

            .org-avatar-icon {
                width: 52px;
                height: 52px;
                border-radius: 50%;
                background: linear-gradient(135deg, #e0e7ff 0%, #c7d2fe 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                color: #6366f1;
                box-shadow: 
                    0 4px 12px rgba(99, 102, 241, 0.2),
                    inset 0 1px 0 rgba(255, 255, 255, 0.8);
            }

            .org-position-badge {
                font-size: 9px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                color: #6366f1;
                background: linear-gradient(135deg, #eef2ff 0%, #e0e7ff 100%);
                padding: 4px 10px;
                border-radius: 12px;
                display: inline-block;
                border: 1px solid rgba(99, 102, 241, 0.15);
            }

            .org-dept-tag {
                font-size: 9px;
                color: #64748b;
                font-weight: 500;
                display: inline-flex;
                align-items: center;
                padding: 3px 8px;
                background: #f1f5f9;
                border-radius: 8px;
                border: 1px solid #e2e8f0;
            }

            /* CSS Tree for Organization Chart */
            .tree ul {
                padding-top: 20px;
                position: relative;
                display: flex;
                justify-content: center;
            }

            .tree li {
                /* float: left; */
                text-align: center;
                list-style-type: none;
                position: relative;
                padding: 20px 4px 0 4px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            /* Connectors */
            .tree li::before, .tree li::after {
                content: '';
                position: absolute; top: 0; right: 50%;
                border-top: 2px solid #c7d2fe;
                width: 50%; height: 20px;
                z-index: 1;
            }
            .tree li::after {
                right: auto; left: 50%;
                border-left: 2px solid #c7d2fe;
            }

            /* Remove connectors from single/first/last */
            .tree li:only-child::after, .tree li:only-child::before {
                display: none;
            }
            .tree li:only-child {
                padding-top: 0;
            }

            /* FIX: Deep Drop Single Child needs the vertical line */
            .tree li.deep-drop:only-child {
                padding-top: 190px !important; 
            }
            .tree li.deep-drop:only-child::after {
                display: block !important;
                border-top: none;
                height: 190px !important;
                z-index: 1;
            }

            .tree li:first-child::before, .tree li:last-child::after {
                border: 0 none;
            }

            /* Add back the vertical connector for the first and last nodes */
            .tree li:last-child::before {
                border-right: 2px solid #c7d2fe;
                border-radius: 0 5px 0 0;
            }
            .tree li:first-child::after {
                border-radius: 5px 0 0 0;
                border-left: 2px solid #c7d2fe;
            }

            /* REMOVE LINES FROM ROOT - IMPORTANT! */
            .org-chart-container > ul > li::before,
            .org-chart-container > ul > li::after {
                display: none !important;
            }
            .org-chart-container > ul > li {
                padding-top: 0 !important;
            }


            /* Downward connector from parent to children */
            .tree ul ul::before {
                content: '';
                position: absolute; top: 0; left: 50%;
                border-left: 2px solid #c7d2fe;
                width: 0; height: 20px;
                z-index: 1;
            }

            /* Deep Drop & Flex adjustments */
            .tree li.deep-drop {
                padding-top: 190px !important;
            }
            .tree li.deep-drop::before, 
            .tree li.deep-drop::after {
                height: 190px !important;
            }

        /* Specific offset for Rina Merriana card */
        .tree li[data-member-name*="Rina" i] > .org-card {
            transform: translateY(50px);
        }
        .tree li[data-member-name*="Rina" i]::before,
        .tree li[data-member-name*="Rina" i]::after {
            height: 50px;
        }
            /* ========== UNIVERSAL CARD COLORS (Indigo + Gold) ========== */
        .org-card {
            background: linear-gradient(145deg, #eef2ff 0%, #e0e7ff 100%);
            box-shadow: 0 4px 6px -1px rgba(79, 70, 229, 0.12), 0 0 0 2px rgba(79, 70, 229, 0.15);
        }
        .org-card .org-card-accent {
            background: #6366f1;
        }
        .org-card .org-avatar-icon {
            background: linear-gradient(135deg, #c7d2fe 0%, #a5b4fc 100%);
            color: #4338ca;
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.25);
        }
        .org-card .org-position-badge {
            color: #92400e;
            background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
            border-color: rgba(234, 179, 8, 0.3);
        }

        /* ========== SPECIAL HIGHLIGHT: Tubagus Imran (Green) ========== */
        .tree li[data-member-name*="Tubagus" i] > .org-card {
            background: linear-gradient(145deg, #f0fdf4 0%, #dcfce7 100%) !important;
            box-shadow: 0 4px 6px -1px rgba(34, 197, 94, 0.1), 0 0 0 2px rgba(34, 197, 94, 0.2) !important;
        }
        .tree li[data-member-name*="Tubagus" i] > .org-card .org-card-accent {
            background: linear-gradient(90deg, #22c55e, #16a34a, #15803d) !important;
        }
        .tree li[data-member-name*="Tubagus" i] > .org-card .org-avatar-icon {
            background: linear-gradient(135deg, #bbf7d0 0%, #86efac 100%) !important;
            color: #16a34a !important;
            box-shadow: 0 4px 12px rgba(34, 197, 94, 0.2) !important;
        }
        .tree li[data-member-name*="Tubagus" i] > .org-card .org-position-badge {
            color: #92400e !important;
            background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%) !important;
            border-color: rgba(234, 179, 8, 0.3) !important;
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
