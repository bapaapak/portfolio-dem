<section id="business_process_flow" class="py-20 bg-transparent">
    <div class="container mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4 fade-in-title">
                Flow Process <span class="text-green-600 border-b-2 border-red-500">Bisnis</span> (Quotation)
            </h2>
        </div>

        <div class="relative overflow-x-auto pb-12">
            <!-- Main Flow Container -->
            <div class="flex flex-nowrap items-start min-w-max gap-1 px-4">
                
                @foreach($businessFlows as $index => $flow)
                    <div class="flex flex-col items-center relative group" style="width: 160px;">
                        <!-- Badge (Magang/Kontrak) -->
                         <div class="h-8 mb-2 w-full flex justify-center">
                            @if($flow->badge_text)
                                <div class="bg-{{ $flow->badge_color == 'green' ? 'green-600' : ($flow->badge_color == 'blue' ? 'blue-800' : 'gray-600') }} text-white text-xs font-bold px-3 py-1 uppercase tracking-wider shadow-sm">
                                    {{ $flow->badge_text }}
                                </div>
                            @endif
                        </div>

                        <!-- Main Box -->
                        <div class="w-full h-32 rounded-xl flex flex-col items-center justify-center p-2 shadow-lg z-10 relative transition-transform hover:scale-105 duration-300
                            {{ $flow->badge_color == 'green' ? 'bg-gradient-to-b from-green-700 to-green-900 border-green-600' : 'bg-gradient-to-b from-blue-700 to-blue-900 border-blue-600' }} border-2">
                            
                            <h3 class="text-white font-bold text-sm mb-1 uppercase tracking-wide">{{ $flow->role }}</h3>
                            
                            <div class="text-white text-center font-bold text-lg leading-tight uppercase">
                                {!! nl2br(e($flow->action)) !!}
                            </div>
                        </div>

                        <!-- Arrow Down -->
                         <!-- Using a CSS arrow or SVG below the box -->
                        <div class="w-full flex justify-center mt-4 relative">
                             <!-- Arrow Box -->
                             <div class="relative w-32 h-24">
                                <div class="absolute inset-0 bg-gradient-to-b from-gray-100 to-gray-300 shadow-md border border-gray-400 flex items-center justify-center text-center p-2 z-0 transform" style="clip-path: polygon(0% 0%, 100% 0%, 100% 75%, 50% 100%, 0% 75%);">
                                     <span class="text-gray-800 font-bold text-xs uppercase leading-tight">
                                        {!! nl2br(e($flow->description)) !!}
                                     </span>
                                </div>
                             </div>
                        </div>

                    </div>
                    
                    <!-- Connector Line (except last) -->
                     <!-- Actually, the image shows them very close, touching. I'll reduce gap. -->
                @endforeach
                
                <!-- Big Arrow Background Effect (Optional/Advanced) -->
                <!-- Hard to replicate exactly the grey background arrow without absolute positioning behind everything. -->
            </div>
            
            <!-- Background Arrow Shape Container -->
             <div class="absolute top-20 left-0 right-0 h-40 bg-gray-200 -z-10 transform skew-x-12 opacity-50 hidden md:block" style="width: 95%;"></div>
             <div class="absolute top-20 right-0 h-40 w-0 h-0 border-t-[80px] border-t-transparent border-l-[100px] border-l-gray-200 border-b-[80px] border-b-transparent -z-10 hidden md:block"></div>

        </div>
    </div>
</section>
