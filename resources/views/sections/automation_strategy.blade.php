<!-- Automation & Digitalization Strategy Section -->
<section class="automation-section-landing" id="automation-strategy">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="nav_automation_strategy">Manufacturing, Digitalization & Automation Strategy</h2>
        
        <div class="strategy-roadmap">
            @foreach(['long' => 'Long Term Strategy', 'middle' => 'Middle Term Strategy', 'short' => 'Short Term Strategy'] as $termKey => $termLabel)
            @php
                $termStrategies = $automationStrategies[$termKey] ?? collect();
                $manufacturingItems = $termStrategies->where('category', 'manufacturing');
                $digitalizationItems = $termStrategies->where('category', 'digitalization');
                // Calculate step number (1 for short, 2 for middle, 3 for long)
                $stepNumber = $termKey === 'short' ? 1 : ($termKey === 'middle' ? 2 : 3);
            @endphp
            
            @if($termStrategies->count() > 0)
            <div class="strategy-column step-{{ $stepNumber }} fade-in-up" style="animation-delay: {{ $loop->index * 150 }}ms">
                <div class="strategy-card">
                    <div class="strategy-header">
                        <div class="strategy-dot">{{ $stepNumber }}</div>
                        <h3 class="strategy-term-title">{{ $termLabel }}</h3>
                    </div>
                    
                    <div class="strategy-body">
                        @if($manufacturingItems->count() > 0)
                        <div class="strategy-category">
                            <h4 class="category-title manufacturing">MANUFACTURING :</h4>
                            @foreach($manufacturingItems as $strategy)
                            <div class="strategy-item">
                                @if($strategy->title)
                                <strong style="display: block; margin-bottom: 6px; color: #1f2937;">{{ $strategy->title }}</strong>
                                @endif
                                
                                @if($strategy->items && count($strategy->items) > 0)
                                <ul class="strategy-bullets" style="margin: 0; padding-left: 18px; list-style-type: disc;">
                                    @foreach($strategy->items as $item)
                                    <li style="margin-bottom: 4px; color: #4b5563; line-height: 1.5;">{{ $item }}</li>
                                    @endforeach
                                </ul>
                                @endif
                            </div>
                            @endforeach
                        </div>
                        @endif
                        
                        @if($digitalizationItems->count() > 0)
                        <div class="strategy-category">
                            <h4 class="category-title digitalization">DIGITALIZATION & AUTOMATION :</h4>
                            @foreach($digitalizationItems as $strategy)
                            <div class="strategy-item">
                                @if($strategy->title)
                                <em style="display: block; margin-bottom: 6px; font-style: italic; color: #4b5563;">{{ $strategy->title }}</em>
                                @endif
                                
                                @if($strategy->items && count($strategy->items) > 0)
                                <ul class="strategy-bullets" style="margin: 0; padding-left: 18px; list-style-type: disc;">
                                    @foreach($strategy->items as $item)
                                    <li style="margin-bottom: 4px; color: #4b5563; line-height: 1.5;">{{ $item }}</li>
                                    @endforeach
                                </ul>
                                @endif
                            </div>
                            @endforeach
                        </div>
                        @endif
                    </div>
                </div>
                <div class="strategy-arrow">→</div>
            </div>
            @endif
            @endforeach
        </div>
    </div>
</section>

<style>
/* Automation Strategy Section Styles */
.automation-section-landing {
    padding: 80px 0;
    position: relative;
    overflow: hidden;
    background: transparent;
}

.strategy-roadmap {
    display: flex;
    flex-direction: column;
    gap: 20px;
    margin-top: 40px;
    position: relative;
}

/* Individual strategy column as arrow step */
.strategy-column {
    position: relative;
    z-index: 1;
    display: flex;
    align-items: center;
    gap: 15px;
}

/* Ascending staircase - step 1 at bottom-left, ascending to step 3 at top-right */
.strategy-column.step-1 {
    margin-left: 0;
    max-width: 70%;
}

.strategy-column.step-2 {
    margin-left: 15%;
    max-width: 70%;
}

.strategy-column.step-3 {
    margin-left: 30%;
    max-width: 70%;
}

/* Card container */
.strategy-card {
    flex: 1;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    position: relative;
    overflow: hidden;
}

/* Left colored border */
.strategy-column.step-1 .strategy-card {
    border-left: 5px solid #3b82f6;
}

.strategy-column.step-2 .strategy-card {
    border-left: 5px solid #f59e0b;
}

.strategy-column.step-3 .strategy-card {
    border-left: 5px solid #10b981;
}

/* Top gradient accent */
.strategy-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
}

.strategy-column.step-1 .strategy-card::before {
    background: linear-gradient(90deg, #3b82f6 0%, #60a5fa 100%);
}

.strategy-column.step-2 .strategy-card::before {
    background: linear-gradient(90deg, #f59e0b 0%, #fbbf24 100%);
}

.strategy-column.step-3 .strategy-card::before {
    background: linear-gradient(90deg, #10b981 0%, #34d399 100%);
}

/* Arrow indicator */
.strategy-arrow {
    font-size: 2.5rem;
    font-weight: bold;
    flex-shrink: 0;
    animation: arrowBounce 1.5s ease-in-out infinite;
}

.strategy-column.step-1 .strategy-arrow {
    color: #3b82f6;
    animation-delay: 0.6s;
}

.strategy-column.step-2 .strategy-arrow {
    color: #f59e0b;
    animation-delay: 0.3s;
}

.strategy-column.step-3 .strategy-arrow {
    color: #10b981;
    animation-delay: 0s;
}

@keyframes arrowBounce {
    0%, 100% {
        transform: translateX(0);
        opacity: 1;
    }
    50% {
        transform: translateX(8px);
        opacity: 0.7;
    }
}

.strategy-header {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 16px;
    padding-bottom: 12px;
    border-bottom: 1px solid rgba(0,0,0,0.06);
}

.strategy-dot {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 800;
    font-size: 1rem;
    color: white;
    flex-shrink: 0;
}

.strategy-column.step-1 .strategy-dot {
    background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
}

.strategy-column.step-2 .strategy-dot {
    background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
}

.strategy-column.step-3 .strategy-dot {
    background: linear-gradient(135deg, #10b981 0%, #059669 100%);
}

.strategy-term-title {
    font-size: 1.2rem;
    font-weight: 700;
    color: #1e3a5f;
    margin: 0;
}

.strategy-body {
    /* Content styles */
}

.strategy-category {
    margin-bottom: 14px;
}

.strategy-category:last-child {
    margin-bottom: 0;
}

.category-title {
    font-size: 0.75rem;
    font-weight: 700;
    margin-bottom: 8px;
    letter-spacing: 0.5px;
    text-transform: uppercase;
}

.category-title.manufacturing {
    color: #dc2626;
}

.category-title.digitalization {
    color: #7c3aed;
}

.strategy-item {
    margin-bottom: 8px;
    font-size: 0.85rem;
    color: #374151;
}

.strategy-item strong {
    display: block;
    margin-bottom: 3px;
    color: #1f2937;
}

.strategy-item em {
    display: block;
    margin-bottom: 3px;
    font-style: italic;
    color: #4b5563;
}

.strategy-bullets {
    margin: 4px 0 0 0;
    padding-left: 16px;
    font-size: 0.8rem;
    color: #6b7280;
}

.strategy-bullets li {
    margin-bottom: 2px;
    line-height: 1.4;
}

/* Responsive */
@media (max-width: 1024px) {
    .strategy-roadmap {
        gap: 16px;
    }
    
    .strategy-column.step-1,
    .strategy-column.step-2,
    .strategy-column.step-3 {
        margin-left: 0;
        max-width: 100%;
    }
    
    .strategy-arrow {
        display: none;
    }
}
</style>
