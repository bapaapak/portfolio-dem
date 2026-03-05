<!-- Find Me On Section -->
<section class="find-me-section-wrapper" id="contact-social">
    <div class="container">
        <div class="social-grid">
            @if($profile && isset($profile->social_links['linkedin']))
                <a href="{{ $profile->social_links['linkedin'] }}" target="_blank" class="social-card">
                    <div class="social-icon linkedin">
                        <i class="fab fa-linkedin-in"></i>
                    </div>
                    <div class="social-info">
                        <p><strong>LinkedIn</strong><span data-translate="social_linkedin">Connect professionally</span></p>
                    </div>
                </a>
            @else
                <a href="#" class="social-card">
                    <div class="social-icon linkedin">
                        <i class="fab fa-linkedin-in"></i>
                    </div>
                    <div class="social-info">
                        <p><strong>LinkedIn</strong><span data-translate="social_linkedin">Connect professionally</span></p>
                    </div>
                </a>
            @endif

            <a href="mailto:{{ $profile->email ?? 'hello@portfolio.com' }}" class="social-card">
                <div class="social-icon gmail">
                    <i class="fab fa-google"></i>
                </div>
                <div class="social-info">
                    <p><strong>Gmail</strong>{{ $profile->email ?? 'hello@portfolio.com' }}</p>
                </div>
            </a>

            @if($profile && isset($profile->social_links['github']))
                <a href="{{ $profile->social_links['github'] }}" target="_blank" class="social-card">
                    <div class="social-icon github">
                        <i class="fab fa-github"></i>
                    </div>
                    <div class="social-info">
                        <p><strong>Github</strong><span data-translate="social_github">Check out my repositories</span></p>
                    </div>
                </a>
            @else
                <a href="#" class="social-card">
                    <div class="social-icon github">
                        <i class="fab fa-github"></i>
                    </div>
                    <div class="social-info">
                        <p><strong>Github</strong><span data-translate="social_github">Check out my repositories</span></p>
                    </div>
                </a>
            @endif

            <a href="https://wa.me/{{ $profile->whatsapp ?? '6281234567890' }}" target="_blank" class="social-card">
                <div class="social-icon whatsapp">
                    <i class="fab fa-whatsapp"></i>
                </div>
                <div class="social-info">
                    <p><strong>WhatsApp</strong><span data-translate="social_whatsapp">Chat with me</span></p>
                </div>
            </a>

            @if($profile && isset($profile->social_links['instagram']))
                <a href="{{ $profile->social_links['instagram'] }}" target="_blank" class="social-card">
                    <div class="social-icon instagram">
                        <i class="fab fa-instagram"></i>
                    </div>
                    <div class="social-info">
                        <p><strong>Instagram</strong><span data-translate="social_instagram">See my daily life</span></p>
                    </div>
                </a>
            @else
                <a href="#" class="social-card">
                    <div class="social-icon instagram">
                        <i class="fab fa-instagram"></i>
                    </div>
                    <div class="social-info">
                        <p><strong>Instagram</strong><span data-translate="social_instagram">See my daily life</span></p>
                    </div>
                </a>
            @endif

            @if($profile && isset($profile->social_links['facebook']))
                <a href="{{ $profile->social_links['facebook'] }}" target="_blank" class="social-card">
                    <div class="social-icon facebook">
                        <i class="fab fa-facebook"></i>
                    </div>
                    <div class="social-info">
                        <p><strong>Facebook</strong><span data-translate="social_facebook">Connect with me</span></p>
                    </div>
                </a>
            @else
                <a href="#" class="social-card">
                    <div class="social-icon facebook">
                        <i class="fab fa-facebook"></i>
                    </div>
                    <div class="social-info">
                        <p><strong>Facebook</strong><span data-translate="social_facebook">Connect with me</span></p>
                    </div>
                </a>
            @endif
        </div>
    </div>
</section>
