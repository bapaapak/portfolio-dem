<!-- Professional Experience Section -->
<section class="experience-section-landing" id="experience">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="section_exp">Professional Experience</h2>
        
        <div class="exp-timeline">
            @foreach($experiences as $experience)
            <div class="exp-row {{ $loop->index >= 3 ? 'exp-hidden-item' : '' }}">
                @if($loop->odd)
                    <div class="exp-content exp-left">
                        <div class="exp-badge">
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $experience->formatted_start_date }}</span>
                                <span class="exp-badge-label" data-translate="exp_start">Start</span>
                            </div>
                            <div class="exp-badge-divider"></div>
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $experience->formatted_end_date }}</span>
                                <span class="exp-badge-label" data-translate="exp_end">End</span>
                            </div>
                            <div class="exp-badge-divider"></div>
                            <div class="exp-badge-col">
                                <!-- Location ID -->
                                <span class="exp-badge-value lang-id" data-display="block" style="display: block;">{{ $experience->location ?? '-' }}</span>
                                <!-- Location EN -->
                                <span class="exp-badge-value lang-en" data-display="block" style="display: none;">{{ $experience->location_en ?? $experience->location ?? '-' }}</span>
                                <span class="exp-badge-label" data-translate="exp_location">Location</span>
                            </div>
                        </div>
                        <div class="exp-card">
                            <!-- Company ID -->
                            <h3 class="exp-company lang-id" data-display="block" style="display: block;">{{ $experience->company }}</h3>
                            <!-- Company EN -->
                            <h3 class="exp-company lang-en" data-display="block" style="display: none;">{{ $experience->company_en ?? $experience->company }}</h3>

                            <div class="exp-position flex flex-wrap items-center gap-2 mb-1">
                                <!-- Title ID -->
                                <span class="lang-id font-semibold text-gray-800" data-display="inline" style="display: inline;">{{ $experience->title }}</span>
                                <!-- Title EN -->
                                <span class="lang-en font-semibold text-gray-800" data-display="inline" style="display: none;">{{ $experience->title_en ?? $experience->title }}</span>
                                
                                <span class="text-gray-500 text-sm font-normal">&bull; {{ $experience->type }}</span>
                            </div>
                            
                            @if($experience->show_description)
                            <div class="exp-description">
                                <!-- Description ID -->
                                <div class="lang-id" data-display="block" style="display: block;">
                                    @if(Str::contains($experience->description, '- '))
                                        <ul style="padding-left: 20px; margin: 5px 0; list-style-type: disc; color: inherit;">
                                            @foreach(explode("\n", $experience->description) as $line)
                                                @if(trim($line))
                                                    @if(str_starts_with(trim($line), '-'))
                                                        <li style="margin-bottom: 4px;">{{ trim(substr(trim($line), 1)) }}</li>
                                                    @else
                                                        <li style="list-style-type: none; margin-left: -20px;">{{ $line }}</li>
                                                    @endif
                                                @endif
                                            @endforeach
                                        </ul>
                                    @else
                                        {!! nl2br(e($experience->description)) !!}
                                    @endif
                                </div>

                                <!-- Description EN -->
                                <div class="lang-en" data-display="block" style="display: none;">
                                    @php
                                        $descEn = $experience->description_en ?? $experience->description;
                                    @endphp
                                    @if(Str::contains($descEn, '- '))
                                        <ul style="padding-left: 20px; margin: 5px 0; list-style-type: disc; color: inherit;">
                                            @foreach(explode("\n", $descEn) as $line)
                                                @if(trim($line))
                                                    @if(str_starts_with(trim($line), '-'))
                                                        <li style="margin-bottom: 4px;">{{ trim(substr(trim($line), 1)) }}</li>
                                                    @else
                                                        <li style="list-style-type: none; margin-left: -20px;">{{ $line }}</li>
                                                    @endif
                                                @endif
                                            @endforeach
                                        </ul>
                                    @else
                                        {!! nl2br(e($descEn)) !!}
                                    @endif
                                </div>
                            </div>
                            @endif

                            @if($experience->show_tags)
                            @if($experience->technologies || $experience->technologies_en)
                                <div class="exp-tags">
                                    <div class="lang-id" style="display: block;">
                                        @if($experience->technologies)
                                            @foreach($experience->technologies as $tech)
                                                <span class="exp-tag">{{ $tech }}</span>
                                            @endforeach
                                        @endif
                                    </div>
                                    <div class="lang-en" style="display: none;">
                                        @if($experience->technologies_en)
                                            @foreach($experience->technologies_en as $tech)
                                                <span class="exp-tag">{{ $tech }}</span>
                                            @endforeach
                                        @elseif($experience->technologies)
                                            {{-- Fallback --}}
                                            @foreach($experience->technologies as $tech)
                                                <span class="exp-tag">{{ $tech }}</span>
                                            @endforeach
                                        @endif
                                    </div>
                                </div>
                            @endif
                            @endif
                        </div>
                    </div>
                    <div class="exp-timeline-center">
                        <div class="exp-timeline-dot"></div>
                    </div>
                    <div class="exp-content exp-right exp-empty"></div>
                @else
                    <div class="exp-content exp-left exp-empty"></div>
                    <div class="exp-timeline-center">
                        <div class="exp-timeline-dot"></div>
                    </div>
                    <div class="exp-content exp-right">
                        <div class="exp-badge">
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $experience->formatted_start_date }}</span>
                                <span class="exp-badge-label" data-translate="exp_start">Start</span>
                            </div>
                            <div class="exp-badge-divider"></div>
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $experience->formatted_end_date }}</span>
                                <span class="exp-badge-label" data-translate="exp_end">End</span>
                            </div>
                            <div class="exp-badge-divider"></div>
                            <div class="exp-badge-col">
                                 <!-- Location ID -->
                                <span class="exp-badge-value lang-id" style="display: block;">{{ $experience->location ?? '-' }}</span>
                                <!-- Location EN -->
                                <span class="exp-badge-value lang-en" style="display: none;">{{ $experience->location_en ?? $experience->location ?? '-' }}</span>
                                <span class="exp-badge-label" data-translate="exp_location">Location</span>
                            </div>
                        </div>
                        <div class="exp-card">
                             <!-- Company ID -->
                            <h3 class="exp-company lang-id" style="display: block;">{{ $experience->company }}</h3>
                            <!-- Company EN -->
                            <h3 class="exp-company lang-en" style="display: none;">{{ $experience->company_en ?? $experience->company }}</h3>

                            <div class="exp-position flex flex-wrap items-center gap-2 mb-1">
                                <!-- Title ID -->
                                <span class="lang-id font-semibold text-gray-800" style="display: inline;">{{ $experience->title }}</span>
                                <!-- Title EN -->
                                <span class="lang-en font-semibold text-gray-800" style="display: none;">{{ $experience->title_en ?? $experience->title }}</span>

                                <span class="text-gray-500 text-sm font-normal">&bull; {{ $experience->type }}</span>
                            </div>

                            @if($experience->show_description)
                            <div class="exp-description">
                                 <!-- Description ID -->
                                <div class="lang-id" style="display: block;">
                                    @if(Str::contains($experience->description, '- '))
                                        <ul style="padding-left: 20px; margin: 5px 0; list-style-type: disc; color: inherit;">
                                            @foreach(explode("\n", $experience->description) as $line)
                                                @if(trim($line))
                                                    @if(str_starts_with(trim($line), '-'))
                                                        <li style="margin-bottom: 4px;">{{ trim(substr(trim($line), 1)) }}</li>
                                                    @else
                                                        <li style="list-style-type: none; margin-left: -20px;">{{ $line }}</li>
                                                    @endif
                                                @endif
                                            @endforeach
                                        </ul>
                                    @else
                                        {!! nl2br(e($experience->description)) !!}
                                    @endif
                                </div>
                                
                                <!-- Description EN -->
                                <div class="lang-en" style="display: none;">
                                    @php
                                        $descEn = $experience->description_en ?? $experience->description;
                                    @endphp
                                    @if(Str::contains($descEn, '- '))
                                        <ul style="padding-left: 20px; margin: 5px 0; list-style-type: disc; color: inherit;">
                                            @foreach(explode("\n", $descEn) as $line)
                                                @if(trim($line))
                                                    @if(str_starts_with(trim($line), '-'))
                                                        <li style="margin-bottom: 4px;">{{ trim(substr(trim($line), 1)) }}</li>
                                                    @else
                                                        <li style="list-style-type: none; margin-left: -20px;">{{ $line }}</li>
                                                    @endif
                                                @endif
                                            @endforeach
                                        </ul>
                                    @else
                                        {!! nl2br(e($descEn)) !!}
                                    @endif
                                </div>
                            </div>
                            @endif

                            @if($experience->show_tags)
                            @if($experience->technologies || $experience->technologies_en)
                                <div class="exp-tags">
                                    <div class="lang-id" style="display: block;">
                                        @if($experience->technologies)
                                            @foreach($experience->technologies as $tech)
                                                <span class="exp-tag">{{ $tech }}</span>
                                            @endforeach
                                        @endif
                                    </div>
                                    <div class="lang-en" style="display: none;">
                                        @if($experience->technologies_en)
                                            @foreach($experience->technologies_en as $tech)
                                                <span class="exp-tag">{{ $tech }}</span>
                                            @endforeach
                                        @elseif($experience->technologies)
                                            {{-- Fallback --}}
                                            @foreach($experience->technologies as $tech)
                                                <span class="exp-tag">{{ $tech }}</span>
                                            @endforeach
                                        @endif
                                    </div>
                                </div>
                            @endif
                            @endif
                        </div>
                    </div>
                @endif
            </div>
            @endforeach
        </div>
        
        @if($experiences->count() > 3)
        <div class="view-more-container" style="text-align: center; margin-top: 40px; position: relative; z-index: 10;">
            <button id="view-more-btn" class="view-more-btn">
                <span>View More Experience</span>
                <i class="fas fa-chevron-down"></i>
            </button>
        </div>
        @endif
    </div>
</section>
