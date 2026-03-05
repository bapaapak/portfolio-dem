<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ config('app.name', 'Tubagus Imran - Portfolio') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=instrument-sans:400,500,600,700" rel="stylesheet" />

        <!-- Tailwind CSS CDN -->
        <script src="https://cdn.tailwindcss.com"></script>
        
        <!-- Typed.js CDN -->
        <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>

        <!-- Custom Styles -->
        <style>
            body {
                font-family: 'Instrument Sans', sans-serif;
            }
            
            .typed-cursor {
                color: #f97316;
                font-weight: 400;
            }
            
            .hero-gradient {
                background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 50%, #0f0f0f 100%);
            }
            
            .glow-effect {
                text-shadow: 0 0 30px rgba(249, 115, 22, 0.3);
            }
            
            .animate-fade-in {
                animation: fadeIn 1s ease-out forwards;
            }
            
            .animate-slide-up {
                animation: slideUp 0.8s ease-out forwards;
            }
            
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }
            
            @keyframes slideUp {
                from { 
                    opacity: 0;
                    transform: translateY(30px);
                }
                to { 
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        </style>
    </head>
    <body class="hero-gradient text-white min-h-screen flex items-center justify-center">
        <!-- Hero Section -->
        <div class="container mx-auto px-6 py-20">
            <div class="max-w-4xl mx-auto text-center">
                <!-- Main Name -->
                <h1 class="text-5xl md:text-7xl font-bold mb-6 animate-slide-up" style="animation-delay: 0.1s;">
                    Tubagus Imran
                </h1>
                
                <!-- Greeting -->
                <h2 class="text-2xl md:text-4xl font-medium text-gray-300 mb-4 animate-slide-up" style="animation-delay: 0.3s;">
                    Hi, Folks 👋
                </h2>
                
                <!-- Typing Animation -->
                <h2 class="text-2xl md:text-4xl font-medium text-gray-300 animate-slide-up" style="animation-delay: 0.5s;">
                    I'm <span id="typed" class="text-orange-500 font-bold glow-effect"></span>
                </h2>

                <!-- Optional: Social Links or CTA -->
                <div class="mt-12 flex justify-center gap-6 animate-fade-in" style="animation-delay: 1s;">
                    @if (Route::has('login'))
                        @auth
                            <a href="{{ url('/dashboard') }}" 
                               class="px-8 py-3 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg hover:shadow-orange-500/25">
                                Dashboard
                            </a>
                        @else
                            <a href="{{ route('login') }}" 
                               class="px-8 py-3 border-2 border-orange-500 text-orange-500 font-semibold rounded-lg hover:bg-orange-500 hover:text-white transition-all duration-300 transform hover:scale-105">
                                Log in
                            </a>
                            @if (Route::has('register'))
                                <a href="{{ route('register') }}" 
                                   class="px-8 py-3 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg hover:shadow-orange-500/25">
                                    Register
                                </a>
                            @endif
                        @endauth
                    @endif
                </div>
            </div>
        </div>

        <!-- Typed.js Initialization -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                var typed = new Typed('#typed', {
                    strings: ['Junior Web Developer', 'Mobile Developer', 'Fullstack Developer'],
                    typeSpeed: 50,
                    backSpeed: 30,
                    backDelay: 3000,
                    loop: true,
                    showCursor: true,
                    cursorChar: '|'
                });
            });
        </script>
    </body>
</html>
