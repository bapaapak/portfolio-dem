<!-- Job Description & Activity Section -->
<section class="job-description-section" id="job-description">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="nav_job_description">Job Description & Activity</h2>
        
        <div class="job-description-grid">
            <!-- Job Descriptions Column -->
            <div class="jd-column descriptions-column fade-in-up">
                <div class="jd-header descriptions-header">
                    <i class="fas fa-file-alt"></i>
                    <h3>Job Descriptions</h3>
                </div>
                <div class="jd-content">
                    @forelse($jobDescriptions ?? [] as $desc)
                    <div class="jd-card description-card">
                        <h4 class="jd-title">{{ $desc->title }}</h4>
                        @if($desc->description)
                            <div class="jd-description-container">
                                @if(Str::contains($desc->description, '- '))
                                    <ul class="jd-description-list">
                                        @foreach(explode("\n", $desc->description) as $line)
                                            @if(trim($line))
                                                @if(str_starts_with(trim($line), '-'))
                                                    <li>{{ trim(substr(trim($line), 1)) }}</li>
                                                @else
                                                    <li class="no-bullet">{{ $line }}</li>
                                                @endif
                                            @endif
                                        @endforeach
                                    </ul>
                                @else
                                    <p class="jd-description">{{ $desc->description }}</p>
                                @endif
                            </div>
                        @endif
                        @if($desc->items && count($desc->items) > 0)
                        <ul class="jd-items">
                            @foreach($desc->items as $item)
                            <li>{{ $item }}</li>
                            @endforeach
                        </ul>
                        @endif
                    </div>
                    @empty
                    <p class="jd-empty">Belum ada job description.</p>
                    @endforelse
                </div>
            </div>
            
            <!-- Activity Jobs Column -->
            <div class="jd-column activities-column fade-in-up" style="animation-delay: 200ms">
                <div class="jd-header activities-header">
                    <i class="fas fa-tasks"></i>
                    <h3>Activity Jobs</h3>
                </div>
                <div class="jd-content">
                    @forelse($jobActivities ?? [] as $activity)
                    <div class="jd-card activity-card">
                        <h4 class="jd-title">{{ $activity->title }}</h4>
                        @if($activity->description)
                            <div class="jd-description-container">
                                @if(Str::contains($activity->description, '- '))
                                    <ul class="jd-description-list">
                                        @foreach(explode("\n", $activity->description) as $line)
                                            @if(trim($line))
                                                @if(str_starts_with(trim($line), '-'))
                                                    <li>{{ trim(substr(trim($line), 1)) }}</li>
                                                @else
                                                    <li class="no-bullet">{{ $line }}</li>
                                                @endif
                                            @endif
                                        @endforeach
                                    </ul>
                                @else
                                    <p class="jd-description">{{ $activity->description }}</p>
                                @endif
                            </div>
                        @endif
                        @if($activity->items && count($activity->items) > 0)
                        <ul class="jd-items">
                            @foreach($activity->items as $item)
                            <li>{{ $item }}</li>
                            @endforeach
                        </ul>
                        @endif
                    </div>
                    @empty
                    <p class="jd-empty">Belum ada activity job.</p>
                    @endforelse
                </div>
            </div>
        </div>
    </div>
</section>

<style>
/* Job Description & Activity Section Styles */
.job-description-section {
    padding: 80px 0;
    position: relative;
    overflow: hidden;
    background: transparent;
}

.job-description-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 30px;
    margin-top: 40px;
}

.jd-column {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.jd-header {
    padding: 20px 24px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.jd-header i {
    font-size: 1.5rem;
}

.jd-header h3 {
    font-size: 1.3rem;
    font-weight: 700;
    margin: 0;
}

.descriptions-header {
    background: linear-gradient(135deg, #3b82f6 0%, #60a5fa 100%);
    color: white;
}

.activities-header {
    background: linear-gradient(135deg, #10b981 0%, #34d399 100%);
    color: white;
}

.jd-content {
    padding: 24px;
}

.jd-card {
    padding: 16px;
    border-radius: 10px;
    margin-bottom: 16px;
    transition: transform 0.2s ease;
}

.jd-card:last-child {
    margin-bottom: 0;
}

.jd-card:hover {
    transform: translateX(5px);
}

.description-card {
    background: rgba(59, 130, 246, 0.05);
    border-left: 4px solid #3b82f6;
}

.activity-card {
    background: rgba(16, 185, 129, 0.05);
    border-left: 4px solid #10b981;
}

.jd-title {
    font-size: 1rem;
    font-weight: 600;
    color: #1e3a5f;
    margin: 0 0 8px 0;
}

.jd-description {
    font-size: 0.9rem;
    color: #4b5563;
    margin: 0 0 10px 0;
    line-height: 1.5;
    text-align: center;
}

.jd-items {
    margin: 0;
    padding-left: 0; /* Remove padding for centered list */
    list-style-position: inside; /* Keep bullets inside */
    font-size: 0.85rem;
    color: #6b7280;
    text-align: center;
}

.jd-items li {
    margin-bottom: 4px;
    line-height: 1.4;
    text-align: center;
}

.jd-empty {
    color: #9ca3af;
    font-style: italic;
    text-align: center;
    padding: 20px;
    margin: 0;
}

.jd-description-list {
    margin: 0 0 10px 0;
    padding-left: 20px;
    text-align: left; /* Align list items to left for better readability */
    font-size: 0.9rem;
    color: #4b5563;
    list-style-type: disc; /* Ensure bullets are visible */
}

.jd-description-list li {
    margin-bottom: 4px;
    line-height: 1.5;
}

.jd-description-list li.no-bullet {
    list-style-type: none;
    margin-left: -20px;
}

/* Responsive */
@media (max-width: 768px) {
    .job-description-grid {
        grid-template-columns: 1fr;
    }
}
</style>
