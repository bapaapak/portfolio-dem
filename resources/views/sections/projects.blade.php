<!-- Projects Section -->
<section class="selected-work" id="projects">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="section_projects">Featured Projects</h2>
        
        <!-- Filter Tabs -->
        <div class="filter-tabs-landing" style="display: none;">
            <button class="filter-tab-landing active" data-filter="all" data-translate="proj_all">All</button>
            @foreach($categories as $category)
                <button class="filter-tab-landing" data-filter="{{ $category->slug }}">{{ $category->name }}</button>
            @endforeach
        </div>

        <div class="projects-grid">
            @forelse($allProjects->take(6) as $project)
                <a href="{{ route('projects.show', $project->slug) }}" class="project-card" data-category="{{ $project->category->slug ?? 'uncategorized' }}">
                    <div class="project-thumbnail">
                        @if($project->thumbnail)
                            <img src="{{ asset('storage/' . $project->thumbnail) }}" alt="{{ $project->title }}">
                        @else
                            <div class="project-thumbnail-placeholder">
                                <i class="fas fa-image"></i>
                            </div>
                        @endif
                        <div class="project-title-overlay">
                            <h3>{{ $project->title }}</h3>
                        </div>
                        <div class="project-overlay">
                            <span class="view-project"><span data-translate="proj_view">View Project</span> <i class="fas fa-arrow-right"></i></span>
                        </div>
                        <div class="project-tags">
                            @if($project->tags)
                                @foreach(array_slice($project->tags, 0, 2) as $tag)
                                    <span class="project-tag">{{ $tag }}</span>
                                @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="project-info">
                        <p data-translate="proj_{{ $project->slug }}_desc">{{ Str::limit($project->description, 80) }}</p>
                    </div>
                </a>
            @empty
                <div style="grid-column: 1/-1; text-align: center; padding: 60px; color: var(--text-secondary);">
                    <i class="fas fa-folder-open" style="font-size: 48px; margin-bottom: 16px; opacity: 0.3;"></i>
                    <p data-translate="proj_empty">No projects yet. Add some from the admin panel!</p>
                </div>
            @endforelse
        </div>

    </div>
</section>
