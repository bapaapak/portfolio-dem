<!-- Tech Stack -->
<section class="tech-stack" id="tech">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="section_tech">Tech Stack That I Use</h2>
        <div class="tech-badges-grid">
            @forelse($technologies as $technology)
            <div class="tech-badge">
                <i class="{{ $technology->icon }}"></i>
                <span>{{ $technology->name }}</span>
            </div>
            @empty
            <p style="text-align: center; width: 100%; color: var(--text-secondary);">No technologies added yet.</p>
            @endforelse
        </div>
    </div>
</section>
