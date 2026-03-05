<!-- Company Profile Section -->
@if($companyProfile)
    <section class="company-profile-section" id="company-profile"
        style="padding: 40px 0; background-color: transparent; font-family: 'Segoe UI', sans-serif;">
        <div class="container mx-auto px-4">

            {{-- Section Title --}}
            <h2 class="section-title-experience fade-in-title text-left" style="font-size: 3rem; margin-bottom: 40px;">
                PROFIL PERUSAHAAN
            </h2>

            {{-- FLUID CONTAINER --}}
            <div class="relative w-full max-w-7xl mx-auto">

                {{-- 3-Column Layout --}}
                <div class="flex flex-row gap-6 items-stretch">

                    {{-- [LEFT COLUMN] Plants & Stats (Width: 25%) --}}
                    <div style="width: 25%; flex: 0 0 25%;" class="flex flex-col gap-4">

                        {{-- Plant 1 --}}
                        @if($companyProfile->plant_1_image || $companyProfile->plant_1_name)
                            <div class="relative w-full">
                                <div
                                    style="border: 5px solid #9cc2e5; border-radius: 4px; overflow: hidden; max-height: 180px;">
                                    @if($companyProfile->plant_1_image)
                                        <img src="{{ asset('storage/' . $companyProfile->plant_1_image) }}"
                                            style="width: 100%; height: auto; object-fit: cover;">
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
                                    @if($companyProfile->plant_2_image)
                                        <img src="{{ asset('storage/' . $companyProfile->plant_2_image) }}"
                                            style="width: 100%; height: auto; object-fit: cover;">
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

                        {{-- Stats --}}
                        <div class="mt-4 text-center">
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

                        {{-- Theme (Bottom Left) --}}
                        <div class="mt-auto pt-4 pl-2 relative">
                            <div style="font-weight: bold; font-size: 11px; color: black; text-transform: uppercase;">TEMA
                                KERJA DEM 2026</div>
                            <div style="font-size: 11px; color: #333; line-height: 1.2;">"Knowledge & Technology
                                Transformation for Employee Engagement"</div>
                        </div>
                    </div>


                    {{-- [CENTER COLUMN] Content (Width: 50%) --}}
                    <div style="width: 50%; flex: 0 0 50%;" class="flex flex-col px-4">

                        {{-- Header Section --}}
                        <div class="flex items-center gap-4 mb-4">
                            @if($companyProfile->logo)
                                <img src="{{ asset('storage/' . $companyProfile->logo) }}"
                                    style="height: 80px; width: auto; object-fit: contain;">
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

                            <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 8px; margin-top: 20px;">
                                @foreach($companyProfile->business_models as $model)
                                    <div class="flex flex-col items-center">
                                        <div
                                            style="width: 70px; height: 70px; border-radius: 50%; border: 3px solid #0f244a; display: flex; align-items: center; justify-content: center; background: white; margin-bottom: 8px; overflow: hidden; padding: 2px;">
                                            @if(isset($model['image']) && $model['image'])
                                                <img src="{{ asset('storage/' . $model['image']) }}"
                                                    style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
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


                    {{-- [RIGHT COLUMN] Director Only (Width: 25%) --}}
                    {{-- Removed Triputra DNA, Moved Director to Top --}}
                    <div style="width: 25%; flex: 0 0 25%;" class="flex flex-col h-full pl-2 pr-2 relative fade-in-up"
                        style="animation-delay: 400ms">

                        {{-- Director (Top Right) --}}
                        <div class="flex flex-col items-end w-full mt-4">
                            @if($companyProfile->director_name || $companyProfile->director_image)
                                {{-- Group Image and Text to ensure they stay together --}}
                                <div class="flex flex-col gap-2" style="width: 180px;">
                                    <div
                                        style="background: white; padding: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); border: 1px solid #ddd; width: 100%;">
                                        <div style="width: 100%; bg-gray-100 overflow: hidden;">
                                            @if($companyProfile->director_image)
                                                <img src="{{ asset('storage/' . $companyProfile->director_image) }}"
                                                    style="width: 100%; height: auto; object-fit: cover; object-position: top;">
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