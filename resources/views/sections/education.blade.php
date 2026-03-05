<!-- Education Section -->
<section class="education-section-landing" id="education">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="section_edu">Education</h2>
        
        <div class="exp-timeline">
            @foreach($educations as $education)
            <div class="exp-row">
                @if($loop->odd)
                    <div class="exp-content exp-left">
                        <div class="exp-badge">
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $education->start_date->format('Y') }}</span>
                                <span class="exp-badge-label" data-translate="exp_start">Start</span>
                            </div>
                            <div class="exp-badge-divider"></div>
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $education->is_current ? 'Present' : ($education->end_date ? $education->end_date->format('Y') : 'Present') }}</span>
                                <span class="exp-badge-label" data-translate="exp_end">End</span>
                            </div>
                            <div class="exp-badge-divider"></div>
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $education->location ?? '-' }}</span>
                                <span class="exp-badge-label" data-translate="exp_location">Location</span>
                            </div>
                        </div>
                        <div class="exp-card">
                            <h3 class="exp-company">{{ $education->institution }}</h3>
                            <p class="exp-position">{{ $education->degree }}
                                @if($education->gpa)
                                    <span class="exp-type">• GPA {{ $education->gpa }}</span>
                                @endif
                            </p>
                            <div class="exp-description">
                                @if(Str::contains($education->description, '- '))
                                    <ul style="padding-left: 20px; margin: 5px 0; list-style-type: disc; color: inherit;">
                                        @foreach(explode("\n", $education->description) as $line)
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
                                    {!! nl2br(e($education->description)) !!}
                                @endif
                            </div>
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
                                <span class="exp-badge-value">{{ $education->start_date->format('Y') }}</span>
                                <span class="exp-badge-label" data-translate="exp_start">Start</span>
                            </div>
                            <div class="exp-badge-divider"></div>
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $education->is_current ? 'Present' : ($education->end_date ? $education->end_date->format('Y') : 'Present') }}</span>
                                <span class="exp-badge-label" data-translate="exp_end">End</span>
                            </div>
                            <div class="exp-badge-divider"></div>
                            <div class="exp-badge-col">
                                <span class="exp-badge-value">{{ $education->location ?? '-' }}</span>
                                <span class="exp-badge-label" data-translate="exp_location">Location</span>
                            </div>
                        </div>
                        <div class="exp-card">
                            <h3 class="exp-company">{{ $education->institution }}</h3>
                            <p class="exp-position">{{ $education->degree }}
                                @if($education->gpa)
                                    <span class="exp-type">• GPA {{ $education->gpa }}</span>
                                @endif
                            </p>
                            <p class="exp-description">
                                {{ $education->description }}
                            </p>
                        </div>
                    </div>
                @endif
            </div>
            @endforeach
        </div>
    </div>
</section>
