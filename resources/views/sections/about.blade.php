<!-- About Me Section -->
<section class="about-section-landing" id="about">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" data-translate="section_about">About Me</h2>
        
        <div class="about-grid">
            <!-- Image Column -->
            <div class="about-image-col">
                <div class="about-avatar-box">
                    <img src="{{ asset('images/profile-about.png') }}" alt="Profile" class="about-avatar">
                </div>
            </div>
            
            <!-- Text Column -->
            <div class="about-text-col">
                <p class="about-desc">
                    {{ $profile->story ?? 'I started coding when I was 15, building simple WordPress themes. What began as a curiosity quickly turned into a career obsession.' }}
                </p>
            </div>
        </div>
    </div>
</section>
