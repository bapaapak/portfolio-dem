<!-- Committee Activities Section -->
<section class="committee-activities-section" id="committee-activities" style="padding: 0 0 60px 0;">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" style="margin-bottom: 40px;">
            <span class="lang-id" data-display="inline">Aktivitas Kepanitiaan</span>
            <span class="lang-en" style="display: none;" data-display="inline">Committee Activities</span>
        </h2>
        
        @forelse($committeeActivities as $year => $activities)
            <div class="committee-year-group">
                <div class="committee-year-label">
                    <span>{{ $year }}</span>
                </div>
                <div class="committee-grid">
                    @foreach($activities as $activity)
                        <div class="committee-card">
                            <div class="committee-image">
                                @if($activity->image)
                                    <img src="{{ asset('storage/' . $activity->image) }}" alt="{{ $activity->title }}">
                                @elseif($activity->image_data)
                                    <img src="{{ $activity->image_data }}" alt="{{ $activity->title }}">
                                @else
                                    <div class="committee-image-placeholder">
                                        <i class="fas fa-image" style="font-size:2rem; opacity:0.3;"></i>
                                    </div>
                                @endif
                            </div>
                            <div class="committee-content">
                                <div class="committee-header">
                                    <h3 class="committee-title">
                                        <span class="lang-id" data-display="block">{{ $activity->title }}</span>
                                        <span class="lang-en" style="display: none;" data-display="block">{{ $activity->title_en ?: $activity->title }}</span>
                                    </h3>
                                    <span class="committee-role">
                                        <span class="lang-id" data-display="inline">{{ $activity->role }}</span>
                                        <span class="lang-en" style="display: none;" data-display="inline">{{ $activity->role_en ?: $activity->role }}</span>
                                    </span>
                                </div>

                                @if($activity->organization)
                                    <p class="committee-org">
                                        <i class="fas fa-building"></i> {{ $activity->organization }}
                                    </p>
                                @endif

                                <div class="committee-meta">
                                    @if($activity->event_date)
                                        <span class="committee-date">
                                            <i class="fas fa-calendar"></i> {{ $activity->formatted_date }}
                                        </span>
                                    @endif
                                    @if($activity->location)
                                        <span class="committee-location">
                                            <i class="fas fa-map-marker-alt"></i> {{ $activity->location }}
                                        </span>
                                    @endif
                                </div>

                                @if($activity->description)
                                    <p class="committee-desc">
                                        <span class="lang-id" data-display="block">{{ Str::limit($activity->description, 150) }}</span>
                                        <span class="lang-en" style="display: none;" data-display="block">{{ Str::limit($activity->description_en ?: $activity->description, 150) }}</span>
                                    </p>
                                @endif
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @empty
            <div class="text-center text-muted col-span-full" style="padding: 40px;">
                <i class="fas fa-calendar-check" style="font-size: 48px; opacity: 0.3; margin-bottom: 16px;"></i>
                <p>
                    <span class="lang-id" data-display="block">Belum ada aktivitas kepanitiaan.</span>
                    <span class="lang-en" style="display: none;" data-display="block">No committee activities yet.</span>
                </p>
            </div>
        @endforelse
    </div>
</section>
