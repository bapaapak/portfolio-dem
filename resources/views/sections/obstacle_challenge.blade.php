<!-- Obstacle & Challenge Section -->
<section class="obstacle-challenge-section" id="obstacle-challenge">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="nav_obstacle_challenge">Obstacle & Challenge</h2>
        
        <div class="obstacle-challenge-grid">
            <!-- Obstacles Column -->
            <div class="oc-column obstacles-column fade-in-up">
                <div class="oc-header obstacles-header">
                    <i class="fas fa-exclamation-triangle"></i>
                    <h3 data-translate="oc_obstacles">Obstacles</h3>
                </div>
                <div class="oc-content">
                    @forelse($obstacles ?? [] as $obstacle)
                    <div class="oc-card obstacle-card">
                        <h4 class="oc-title">
                            <span class="lang-id" data-display="block">{{ $obstacle->title }}</span>
                            <span class="lang-en" style="display: none;" data-display="block">{{ $obstacle->title_en ?: $obstacle->title }}</span>
                        </h4>
                        @if($obstacle->description)
                        <p class="oc-description lang-id" data-display="block">{{ $obstacle->description }}</p>
                        <p class="oc-description lang-en" style="display: none;" data-display="block">{{ $obstacle->description_en ?: $obstacle->description }}</p>
                        @endif
                        @if($obstacle->items && count($obstacle->items) > 0)
                        <ul class="oc-items lang-id" data-display="block">
                            @foreach($obstacle->items as $item)
                            <li>{{ $item }}</li>
                            @endforeach
                        </ul>
                        <ul class="oc-items lang-en" style="display: none;" data-display="block">
                            @foreach(($obstacle->items_en ?: $obstacle->items) as $item)
                            <li>{{ $item }}</li>
                            @endforeach
                        </ul>
                        @endif
                    </div>
                    @empty
                    <p class="oc-empty">
                        <span class="lang-id" data-display="inline">Belum ada obstacle.</span>
                        <span class="lang-en" style="display: none;" data-display="inline">No obstacles yet.</span>
                    </p>
                    @endforelse
                </div>
            </div>
            
            <!-- Challenges Column -->
            <div class="oc-column challenges-column fade-in-up" style="animation-delay: 200ms">
                <div class="oc-header challenges-header">
                    <i class="fas fa-bolt"></i>
                    <h3 data-translate="oc_challenges">Challenges</h3>
                </div>
                <div class="oc-content">
                    @forelse($challenges ?? [] as $challenge)
                    <div class="oc-card challenge-card">
                        <h4 class="oc-title">
                            <span class="lang-id" data-display="block">{{ $challenge->title }}</span>
                            <span class="lang-en" style="display: none;" data-display="block">{{ $challenge->title_en ?: $challenge->title }}</span>
                        </h4>
                        @if($challenge->description)
                        <p class="oc-description lang-id" data-display="block">{{ $challenge->description }}</p>
                        <p class="oc-description lang-en" style="display: none;" data-display="block">{{ $challenge->description_en ?: $challenge->description }}</p>
                        @endif
                        @if($challenge->items && count($challenge->items) > 0)
                        <ul class="oc-items lang-id" data-display="block">
                            @foreach($challenge->items as $item)
                            <li>{{ $item }}</li>
                            @endforeach
                        </ul>
                        <ul class="oc-items lang-en" style="display: none;" data-display="block">
                            @foreach(($challenge->items_en ?: $challenge->items) as $item)
                            <li>{{ $item }}</li>
                            @endforeach
                        </ul>
                        @endif
                    </div>
                    @empty
                    <p class="oc-empty">
                        <span class="lang-id" data-display="inline">Belum ada challenge.</span>
                        <span class="lang-en" style="display: none;" data-display="inline">No challenges yet.</span>
                    </p>
                    @endforelse
                </div>
            </div>
        </div>
    </div>
</section>

<style>
/* Obstacle & Challenge Section Styles */
.obstacle-challenge-section {
    padding: 80px 0;
    position: relative;
    overflow: hidden;
    background: transparent;
}

.obstacle-challenge-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 30px;
    margin-top: 40px;
}

.oc-column {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.oc-header {
    padding: 20px 24px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.oc-header i {
    font-size: 1.5rem;
}

.oc-header h3 {
    font-size: 1.3rem;
    font-weight: 700;
    margin: 0;
}

.obstacles-header {
    background: linear-gradient(135deg, #dc2626 0%, #ef4444 100%);
    color: white;
}

.challenges-header {
    background: linear-gradient(135deg, #f59e0b 0%, #fbbf24 100%);
    color: white;
}

.oc-content {
    padding: 24px;
}

.oc-card {
    padding: 16px;
    border-radius: 10px;
    margin-bottom: 16px;
    transition: transform 0.2s ease;
}

.oc-card:last-child {
    margin-bottom: 0;
}

.oc-card:hover {
    transform: translateX(5px);
}

.obstacle-card {
    background: rgba(220, 38, 38, 0.05);
    border-left: 4px solid #dc2626;
}

.challenge-card {
    background: rgba(245, 158, 11, 0.05);
    border-left: 4px solid #f59e0b;
}

.oc-title {
    font-size: 1rem;
    font-weight: 600;
    color: #1e3a5f;
    margin: 0 0 8px 0;
}

.oc-description {
    font-size: 0.9rem;
    color: #4b5563;
    margin: 0 0 10px 0;
    line-height: 1.5;
}

.oc-items {
    margin: 0;
    padding-left: 18px;
    font-size: 0.85rem;
    color: #6b7280;
}

.oc-items li {
    margin-bottom: 4px;
    line-height: 1.4;
}

.oc-empty {
    color: #9ca3af;
    font-style: italic;
    text-align: center;
    padding: 20px;
    margin: 0;
}

/* Responsive */
@media (max-width: 768px) {
    .obstacle-challenge-grid {
        grid-template-columns: 1fr;
    }
}
</style>
