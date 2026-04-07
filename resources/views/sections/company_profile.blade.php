<!-- Company Profile Section -->
@if($companyProfile)
    <section class="company-profile-section" id="company-profile"
        style="padding: 40px 0; background-color: transparent; font-family: 'Segoe UI', sans-serif;">
        <style>
            .cp-grid {
                display: flex;
                flex-direction: row;
                gap: 24px;
                align-items: stretch;
            }
            .cp-col-left { width: 25%; flex: 0 0 25%; display: flex; flex-direction: column; gap: 16px; }
            .cp-col-center { width: 50%; flex: 0 0 50%; display: flex; flex-direction: column; padding: 0 16px; }
            .cp-col-right { width: 25%; flex: 0 0 25%; display: flex; flex-direction: column; padding: 0 8px; position: relative; }

            @media (max-width: 768px) {
                .cp-grid {
                    flex-direction: column;
                    gap: 24px;
                }
                .cp-col-left, .cp-col-center, .cp-col-right {
                    width: 100% !important;
                    flex: 0 0 100% !important;
                    padding: 0 !important;
                }
                /* Reorder: Center first (logo+description), then Right (director), then Left (plants+stats) */
                .cp-col-center { order: 1; }
                .cp-col-right { order: 2; }
                .cp-col-left { order: 3; }
                
                .cp-col-right .flex.flex-col.items-end {
                    align-items: center !important;
                }
                .cp-col-right .flex.flex-col.gap-2 {
                    width: 200px !important;
                    margin: 0 auto;
                }
                .cp-plants-row {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 12px;
                }
                .cp-stats-theme {
                    display: flex;
                    flex-direction: row;
                    gap: 16px;
                    align-items: flex-start;
                }
                .cp-stats-theme > div {
                    flex: 1;
                }
                .cp-bm-grid {
                    grid-template-columns: repeat(4, 1fr) !important;
                }
                .cp-header-mobile {
                    text-align: center;
                    flex-direction: column !important;
                    align-items: center !important;
                }
            }

            @media (max-width: 480px) {
                .cp-bm-grid {
                    grid-template-columns: repeat(2, 1fr) !important;
                    gap: 16px !important;
                }
                .cp-plants-row {
                    grid-template-columns: 1fr 1fr;
                }
                .company-profile-section .section-title-experience {
                    font-size: 2rem !important;
                }
            }
        </style>
        <div class="container mx-auto px-4">

            {{-- Section Title --}}
            <h2 class="section-title-experience fade-in-title text-left" style="font-size: 3rem; margin-bottom: 40px;">
                <span class="lang-id" data-display="inline">PROFIL PERUSAHAAN</span>
                <span class="lang-en" style="display: none;" data-display="inline">COMPANY PROFILE</span>
            </h2>

            {{-- FLUID CONTAINER --}}
            <div class="relative w-full max-w-7xl mx-auto">

                {{-- 3-Column Layout --}}
                <div class="cp-grid">

                    {{-- [LEFT COLUMN] Plants & Stats --}}
                    <div class="cp-col-left">

                        <div class="cp-plants-row">
                        {{-- Plant 1 --}}
                        @if($companyProfile->plant_1_image || $companyProfile->plant_1_name)
                            <div class="relative w-full">
                                <div
                                    style="border: 5px solid #9cc2e5; border-radius: 4px; overflow: hidden; max-height: 180px;">
                                    @if($companyProfile->plant_1_image_data ?? null)
                                        <img src="/dbimg/company/plant_1_image_data"
                                            loading="lazy"
                                            style="width: 100%; height: auto; object-fit: cover;">
                                    @elseif($companyProfile->plant_1_image)
                                        <img src="/media/{{ ltrim($companyProfile->plant_1_image, '/') }}"
                                            loading="lazy"
                                            style="width: 100%; height: auto; object-fit: cover;"
                                            onerror="this.parentElement.innerHTML='<div class=\'w-full h-40 flex items-center justify-center text-gray-400 bg-gray-200\'><i class=\'fas fa-industry\'></i></div>'">
                                    @else
                                        <div class="w-full h-40 flex items-center justify-center text-gray-400 bg-gray-200"><i
                                                class="fas fa-industry"></i></div>
                                    @endif
                                </div>
                                <div
                                    style="background-color: #0f244a; color: white; text-align: center; font-size: 11px; font-weight: bold; padding: 4px 8px; border-radius: 99px; position: relative; margin-top: -12px; width: 95%; margin-left: auto; margin-right: auto; z-index: 10; border: 1px solid white;">
                                    {{ $companyProfile->plant_1_name ?? 'PT. Dharma Electrindo Mfg. Plant 1 Cikarang' }}
                                </div>
                            </div>
                        @endif

                        {{-- Plant 2 --}}
                        @if($companyProfile->plant_2_image || $companyProfile->plant_2_name)
                            <div class="relative w-full">
                                <div
                                    style="border: 5px solid #9cc2e5; border-radius: 4px; overflow: hidden; max-height: 180px;">
                                    @if($companyProfile->plant_2_image_data ?? null)
                                        <img src="/dbimg/company/plant_2_image_data"
                                            loading="lazy"
                                            style="width: 100%; height: auto; object-fit: cover;">
                                    @elseif($companyProfile->plant_2_image)
                                        <img src="/media/{{ ltrim($companyProfile->plant_2_image, '/') }}"
                                            loading="lazy"
                                            style="width: 100%; height: auto; object-fit: cover;"
                                            onerror="this.parentElement.innerHTML='<div class=\'w-full h-40 flex items-center justify-center text-gray-400 bg-gray-200\'><i class=\'fas fa-industry\'></i></div>'">
                                    @else
                                        <div class="w-full h-40 flex items-center justify-center text-gray-400 bg-gray-200"><i
                                                class="fas fa-industry"></i></div>
                                    @endif
                                </div>
                                <div
                                    style="background-color: #0f244a; color: white; text-align: center; font-size: 11px; font-weight: bold; padding: 4px 8px; border-radius: 99px; position: relative; margin-top: -12px; width: 95%; margin-left: auto; margin-right: auto; z-index: 10; border: 1px solid white;">
                                    {{ $companyProfile->plant_2_name ?? 'PT. Dharma Electrindo Mfg. Plant 2 Cirebon' }}
                                </div>
                            </div>
                        @endif
                        </div>{{-- end cp-plants-row --}}

                        <div class="cp-stats-theme">
                        {{-- Stats --}}
                        <div class="text-center">
                            <h5
                                style="font-weight: bold; color: black; font-size: 12px; margin-bottom: 8px; line-height: 1.2;">
                                Karyawan PT. Dharma Electrindo<br>Manufacturing</h5>
                            <div class="flex flex-col gap-2 pl-4">
                                <div class="flex items-center gap-2"
                                    style="font-size: 12px; color: #333; font-weight: 500;">
                                    <i class="fas fa-user-circle text-xl leading-none"></i>
                                    <span>Cikarang : {{ $companyProfile->employees_cikarang ?? 0 }} Orang</span>
                                </div>
                                <div class="flex items-center gap-2"
                                    style="font-size: 12px; color: #333; font-weight: 500;">
                                    <i class="fas fa-user-circle text-xl leading-none"></i>
                                    <span>Cirebon : {{ $companyProfile->employees_cirebon ?? 0 }} Orang</span>
                                </div>
                            </div>
                            <div
                                style="margin-top: 12px; font-size: 12px; font-weight: bold; color: black; text-align: left; padding-left: 16px;">
                                Total Keseluruhan :
                                {{ ($companyProfile->employees_cikarang ?? 0) + ($companyProfile->employees_cirebon ?? 0) }}
                                Orang
                            </div>
                        </div>

                        {{-- Theme --}}
                        <div class="pt-4 relative">
                            <div style="font-weight: bold; font-size: 11px; color: black; text-transform: uppercase;">TEMA
                                KERJA DEM 2026</div>
                            <div style="font-size: 11px; color: #333; line-height: 1.2;">"Knowledge & Technology
                                Transformation for Employee Engagement"</div>
                        </div>
                        </div>{{-- end cp-stats-theme --}}
                    </div>


                    {{-- [CENTER COLUMN] Content --}}
                    <div class="cp-col-center">

                        {{-- Header Section --}}
                        <div class="flex items-center gap-4 mb-4 cp-header-mobile">
                            @if($companyProfile->logo_data ?? null)
                                <img src="/dbimg/company/logo_data"
                                    loading="lazy"
                                    style="height: 80px; width: auto; object-fit: contain;">
                            @elseif($companyProfile->logo)
                                <img src="/media/{{ ltrim($companyProfile->logo, '/') }}"
                                    loading="lazy"
                                    style="height: 80px; width: auto; object-fit: contain;"
                                    onerror="this.outerHTML='<i class=\'fas fa-bolt text-5xl text-[#0f244a]\'></i>'">
                            @else
                                <i class="fas fa-bolt text-5xl text-[#0f244a]"></i>
                            @endif
                            <div>
                                <h1
                                    style="font-size: 26px; font-weight: bold; color: #0f244a; text-transform: uppercase; line-height: 1;">
                                    {{ $companyProfile->name }}</h1>
                                @if($companyProfile->slogan)
                                    <p
                                        style="color: #39b54a; font-weight: bold; font-size: 16px; font-style: italic; margin-top: 4px;">
                                        {{ $companyProfile->slogan }}</p>
                                @endif
                            </div>
                        </div>

                        {{-- Description --}}
                        <div
                            style="text-align: justify; color: black; font-size: 14px; line-height: 1.5; margin-bottom: 24px;">
                            {!! nl2br(e($companyProfile->description)) !!}
                        </div>

                        {{-- Business Model Section --}}
                        <div class="mt-auto text-center" style="width: 100%;">
                            <h3
                                style="font-size: 20px; font-weight: bold; color: #0f244a; text-transform: uppercase; text-decoration: underline; text-decoration-thickness: 3px; text-underline-offset: 4px; margin-bottom: 16px;">
                                {{ $companyProfile->business_model_title ?? 'BISNIS MODEL DEM' }}
                            </h3>

                            {{-- Tree Diagram --}}
                            <div class="relative w-full max-w-lg mx-auto mb-4" style="position: relative; height: 32px;">
                                {{-- Main vertical line --}}
                                <div
                                    style="position: absolute; top: 0; left: 50%; width: 2px; height: 100%; background-color: #0f244a; transform: translateX(-50%);">
                                </div>
                                {{-- Main horizontal line --}}
                                <div
                                    style="position: absolute; bottom: 0; left: 12.5%; right: 12.5%; height: 2px; background-color: #0f244a;">
                                </div>
                                {{-- Drops --}}
                                <div
                                    style="position: absolute; bottom: 0; left: 12.5%; width: 2px; height: 16px; background-color: #0f244a; transform: translateY(100%);">
                                </div>
                                <div
                                    style="position: absolute; bottom: 0; left: 37.5%; width: 2px; height: 16px; background-color: #0f244a; transform: translateY(100%);">
                                </div>
                                <div
                                    style="position: absolute; bottom: 0; right: 37.5%; width: 2px; height: 16px; background-color: #0f244a; transform: translateY(100%);">
                                </div>
                                <div
                                    style="position: absolute; bottom: 0; right: 12.5%; width: 2px; height: 16px; background-color: #0f244a; transform: translateY(100%);">
                                </div>
                            </div>

                            <div class="cp-bm-grid" style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 8px; margin-top: 20px;">
                                @foreach($companyProfile->business_models as $bmIndex => $model)
                                    <div class="flex flex-col items-center">
                                        <div
                                            style="width: 70px; height: 70px; border-radius: 50%; border: 3px solid #0f244a; display: flex; align-items: center; justify-content: center; background: white; margin-bottom: 8px; overflow: hidden; padding: 2px;">
                                            @if(isset($model['image_data']) && $model['image_data'])
                                                <img src="/dbimg/company_bm/image_data/{{ $bmIndex }}"
                                                    style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;"
                                                    loading="lazy">
                                            @elseif(isset($model['image']) && $model['image'])
                                                <img src="/media/{{ ltrim($model['image'], '/') }}"
                                                    style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;"
                                                    onerror="this.outerHTML='<i class=\'fas fa-cog text-3xl text-[#0f244a]\'></i>'">
                                            @else
                                                <i class="fas fa-cog text-3xl text-[#0f244a]"></i>
                                            @endif
                                        </div>
                                        <div
                                            style="background-color: #0f244a; color: white; font-size: 10px; padding: 6px 12px; border-radius: 99px; font-weight: bold; width: 100%; line-height: 1.2; min-height: 28px; display: flex; align-items: center; justify-content: center;">
                                            {{ $model['title'] ?? '-' }}
                                        </div>
                                        @if(isset($model['description']))
                                            <div
                                                style="font-size: 9px; font-weight: bold; color: #333; margin-top: 4px; line-height: 1;">
                                                {{ $model['description'] }}
                                            </div>
                                        @endif
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>


                    {{-- [RIGHT COLUMN] Director --}}
                    <div class="cp-col-right fade-in-up">

                        {{-- Director (Top Right) --}}
                        <div class="flex flex-col items-end w-full mt-4">
                            @if($companyProfile->director_name || $companyProfile->director_image)
                                {{-- Group Image and Text to ensure they stay together --}}
                                <div class="flex flex-col gap-2" style="width: 180px;">
                                    <div
                                        style="background: white; padding: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); border: 1px solid #ddd; width: 100%;">
                                        <div style="width: 100%; bg-gray-100 overflow: hidden;">
                                            @if($companyProfile->director_image_data ?? null)
                                                <img src="/dbimg/company/director_image_data"
                                                    loading="lazy"
                                                    style="width: 100%; height: auto; object-fit: cover; object-position: top;">
                                            @elseif($companyProfile->director_image)
                                                <img src="/media/{{ ltrim($companyProfile->director_image, '/') }}"
                                                    loading="lazy"
                                                    style="width: 100%; height: auto; object-fit: cover; object-position: top;"
                                                    onerror="this.outerHTML='<div class=\'w-full h-48 flex items-center justify-center text-gray-400\'><i class=\'fas fa-user-tie text-5xl\'></i></div>'">
                                            @else
                                                <div class="w-full h-48 flex items-center justify-center text-gray-400"><i
                                                        class="fas fa-user-tie text-5xl"></i></div>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="text-center w-full">
                                        <div style="font-weight: bold; color: black; font-size: 13px; line-height: 1.2;">
                                            {{ $companyProfile->director_name }}</div>
                                        <div style="font-size: 10px; font-weight: bold; color: #555;">
                                            {{ $companyProfile->director_title }}</div>
                                    </div>
                                </div>
                            @endif
                        </div>

                    </div>

                </div>
            </div>

        </div>
    </section>
@endif