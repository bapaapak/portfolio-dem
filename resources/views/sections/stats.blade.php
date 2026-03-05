<!-- Stats Counter -->
<section class="stats-section">
    <div class="container">
        <div class="stats-grid-landing">
            <div class="stat-item-landing">
                <span class="stat-number-landing" data-count="{{ $profile->years_experience ?? 5 }}">0</span><span class="stat-suffix">+</span>
                <span class="stat-label-landing" data-translate="stats_years">Years Experience</span>
            </div>
            <div class="stat-item-landing">
                <span class="stat-number-landing" data-count="{{ $profile->total_projects ?? 40 }}">0</span><span class="stat-suffix">+</span>
                <span class="stat-label-landing" data-translate="stats_projects">Projects Completed</span>
            </div>
            <div class="stat-item-landing">
                <span class="stat-number-landing" data-count="{{ $profile->happy_clients ?? 25 }}">0</span><span class="stat-suffix">+</span>
                <span class="stat-label-landing" data-translate="stats_clients">Happy Clients</span>
            </div>
            <div class="stat-item-landing">
                <span class="stat-number-landing" data-count="{{ $profile->awards ?? 12 }}">0</span>
                <span class="stat-label-landing" data-translate="stats_awards">Awards Won</span>
            </div>
        </div>
    </div>
</section>
