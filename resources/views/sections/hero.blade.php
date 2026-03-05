<!-- Hero Section with Typed.js Animation -->
<section class="hero" id="home">
    <div class="container">
        <div class="hero-content">
            <div class="hero-text">
                <!-- Main Name with Scramble Effect -->
                <h1 class="hero-name-main" id="scramble-text" data-text="{{ $profile->name ?? 'Tubagus Imran' }}"></h1>
                
                <!-- Greeting -->
                <h2 class="hero-greeting-large" data-translate="hero_greeting">Hi, Folks 👋</h2>
                
                <!-- Typing Animation -->
                <h2 class="hero-typed-text">
                    <span data-translate="hero_role_prefix">I'm</span> <span id="typed" class="typed-orange"></span>
                </h2>

                    <p class="hero-subtitle" 
                       data-dynamic-en="{{ $profile->bio ?? 'I am a Fullstack Developer...' }}"
                       data-dynamic-id="{{ $profile->bio_id ?? 'Halo! Saya adalah Developer. (Silakan isi Bio Singkat ID di Panel Admin)' }}">
                        {{ $profile->bio ?? 'I am a Fullstack Developer...' }}
                    </p>
                <div class="hero-buttons">
                    @if(($profile->show_cv_button ?? true))
                        @if($profile && $profile->cv_file)
                            <a href="{{ asset('storage/' . $profile->cv_file) }}" class="btn btn-primary" target="_blank">
                                <i class="fas fa-file-pdf"></i> <span data-translate="hero_cv">Download CV</span>
                            </a>
                        @else
                            <a href="#" class="btn btn-primary">
                                <i class="fas fa-file-pdf"></i> <span data-translate="hero_cv">Download CV</span>
                            </a>
                        @endif
                    @endif

                    @if(($profile->show_contact_button ?? true))
                        <a href="#contact-social" class="btn btn-outline">
                            <span data-translate="hero_contact">Contact Me</span> <i class="fas fa-arrow-right"></i>
                        </a>
                    @endif
                </div>
            </div>
            <div class="hero-image">
                <div class="hero-photo">
                    @if($profile && $profile->photo)
                        <img src="{{ asset('storage/' . $profile->photo) }}" alt="{{ $profile->name }}">
                    @else
                        <img src="{{ asset('images/profile.png') }}" alt="Tubagus Imran">
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
