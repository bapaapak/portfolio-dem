<!-- Certifications Section -->
<section class="certifications-section" style="padding: 0 0 60px 0;">
    <div class="container">
        <h2 class="section-title-experience fade-in-title" style="margin-bottom: 40px;" data-translate="section_certifications">Certifications</h2>
        
        <div class="certifications-grid">
            @forelse($certifications as $cert)
                <div class="certification-card">
                    <div class="cert-icon">
                        <i class="fas fa-certificate"></i>
                    </div>
                    <div class="cert-content">
                        <h3 class="cert-name">
                            <span class="lang-id" data-display="block">{{ $cert->name }}</span>
                            <span class="lang-en" style="display: none;" data-display="block">{{ $cert->name_en ?: $cert->name }}</span>
                        </h3>
                        <p class="cert-issuer">
                            <span class="lang-id" data-display="block">{{ $cert->issuer }}</span>
                            <span class="lang-en" style="display: none;" data-display="block">{{ $cert->issuer_en ?: $cert->issuer }}</span>
                        </p>
                        <p class="cert-date">
                            Issued: {{ $cert->formatted_issued_at }}
                            @if($cert->expiration_date)
                                • Expires: {{ $cert->formatted_expiration_date }}
                            @endif
                        </p>
                        @if($cert->credential_url)
                            <a href="{{ $cert->credential_url }}" target="_blank" class="cert-link">
                                Show Credential <i class="fas fa-external-link-alt"></i>
                            </a>
                        @endif
                    </div>
                </div>
            @empty
                <div class="text-center text-muted col-span-full">
                    No certifications added yet.
                </div>
            @endforelse
        </div>
    </div>
</section>
