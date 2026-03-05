<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Experience;
use Illuminate\Http\Request;

use App\Models\Skill;

class ExperienceController extends Controller
{
    public function index()
    {
        $experiences = Experience::orderBy('start_date', 'desc')->get();
        return view('admin.experiences.index', compact('experiences'));
    }

    public function create()
    {
        $availableSkills = Skill::all()->flatMap(function ($skill) {
            if ($skill->items) {
                return array_map('trim', explode(',', $skill->items));
            }
            // If items is empty (e.g. Soft Skill with only Category name), use the Category name
            return $skill->category ? [$skill->category] : [];
        })->unique()->filter()->values();

        return view('admin.experiences.create', compact('availableSkills'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'company' => 'required|string|max:255',
            'type' => 'nullable|string|max:255',
            'location' => 'nullable|string|max:255',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date',
            'description' => 'nullable|string',
            'technologies' => 'nullable|string',
            'technologies_en' => 'nullable|string',
            'order' => 'integer|min:0',
            'featured' => 'nullable|boolean',
            'date_format' => 'nullable|string',
            'title_en' => 'nullable|string|max:255',
            'company_en' => 'nullable|string|max:255',
            'location_en' => 'nullable|string|max:255',
            'description_en' => 'nullable|string',
            'show_description' => 'nullable|boolean',
            'show_tags' => 'nullable|boolean',
        ]);

        $validated['featured'] = $request->has('featured');
        $validated['show_description'] = $request->has('show_description');
        $validated['show_tags'] = $request->has('show_tags');

        if ($request->filled('technologies')) {
            $validated['technologies'] = array_map('trim', explode(',', $request->input('technologies')));
        }
        
        if ($request->filled('technologies_en')) {
            $validated['technologies_en'] = array_map('trim', explode(',', $request->input('technologies_en')));
        }

        Experience::create($validated);

        return redirect()->route('admin.experiences.index')->with('success', 'Experience added successfully!');
    }

    public function edit(Experience $experience)
    {
        $availableSkills = Skill::all()->flatMap(function ($skill) {
            if ($skill->items) {
                return array_map('trim', explode(',', $skill->items));
            }
            return $skill->category ? [$skill->category] : [];
        })->unique()->filter()->values();

        return view('admin.experiences.edit', compact('experience', 'availableSkills'));
    }

    public function update(Request $request, Experience $experience)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'company' => 'required|string|max:255',
            'type' => 'nullable|string|max:255',
            'location' => 'nullable|string|max:255',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date',
            'description' => 'nullable|string',
            'technologies' => 'nullable|string',
            'technologies_en' => 'nullable|string',
            'order' => 'integer|min:0',
            'featured' => 'nullable|boolean',
            'date_format' => 'nullable|string',
            'title_en' => 'nullable|string|max:255',
            'company_en' => 'nullable|string|max:255',
            'location_en' => 'nullable|string|max:255',
            'description_en' => 'nullable|string',
            'show_description' => 'nullable|boolean',
            'show_tags' => 'nullable|boolean',
        ]);

        $validated['featured'] = $request->has('featured');
        $validated['show_description'] = $request->has('show_description');
        $validated['show_tags'] = $request->has('show_tags');

        if ($request->filled('technologies')) {
            $validated['technologies'] = array_map('trim', explode(',', $request->input('technologies')));
        } else {
            $validated['technologies'] = null;
        }

        if ($request->filled('technologies_en')) {
            $validated['technologies_en'] = array_map('trim', explode(',', $request->input('technologies_en')));
        } else {
            $validated['technologies_en'] = null;
        
        }

        $experience->update($validated);

        return redirect()->route('admin.experiences.index')->with('success', 'Experience updated successfully!');
    }

    public function destroy(Experience $experience)
    {
        $experience->delete();
        return redirect()->route('admin.experiences.index')->with('success', 'Experience deleted successfully!');
    }

    /**
     * Generate description based on job title input.
     */
    public function generateDescription(Request $request)
    {
        $title = $request->input('title', '');
        $description = "- Bertanggung jawab atas...\n- Bekerja sama dengan tim...\n- Mencapai target..."; // Default fallback

        // AI Knowledge Base (Dictionary of Common Roles)
        $roles = [
            // --- IT & Development (English & Indonesian) ---
            'Web Developer' => [
                "- Developed and maintained responsive web applications using HTML, CSS, and JavaScript.",
                "- Collaborated with cross-functional teams to define, design, and ship new features.",
                "- Optimized applications for maximum speed and scalability.",
                "- Troubleshoot and debugged issues to ensure seamless user experience.",
                "- Implemented RESTful APIs and third-party integrations."
            ],
            'Pengembang Web' => [
                "- Mengembangkan dan memelihara aplikasi web responsif menggunakan HTML, CSS, dan JavaScript.",
                "- Berkolaborasi dengan tim lintas fungsi untuk mendefinisikan dan merilis fitur baru.",
                "- Mengoptimalkan aplikasi untuk kecepatan dan skalabilitas maksimal.",
                "- Melakukan troubleshooting dan debugging untuk memastikan pengalaman pengguna yang lancar.",
                "- Mengimplementasikan RESTful API dan integrasi pihak ketiga."
            ],
            'Frontend Developer' => [
                "- Built intuitive and interactive user interfaces using React/Vue/Angular.",
                "- Translated design wireframes into high-quality code.",
                "- Ensured cross-browser compatibility and mobile responsiveness.",
                "- Optimized frontend performance and reduced load times.",
                "- Worked closely with UX/UI designers to implement design specifications."
            ],
            'Backend Developer' => [
                "- Designed and developed robust server-side logic and databases.",
                "- Built and maintained scalable RESTful APIs.",
                "- Optimized database queries and ensured data integrity.",
                "- Implemented security best practices and authentication mechanisms.",
                "- Managed server deployment and continuous integration pipelines."
            ],
            'Full Stack Developer' => [
                "- Developed end-to-end web solutions using modern frontend and backend technologies.",
                "- Designed and managed database schemas and server infrastructure.",
                "- Implemented responsive front-end interfaces and robust back-end APIs.",
                "- Led the deployment process and monitored application performance.",
                "- Collaborated with stakeholders to gather requirements and deliver technical solutions."
            ],
            'Mobile Developer' => [
                "- Developed high-performance mobile applications for iOS/Android platforms.",
                "- Implemented complex UI/UX designs and animations.",
                "- Integrated third-party APIs and SDKs.",
                "- Conducted code reviews and maintained code quality standards.",
                "- Published applications to the App Store and Google Play Store."
            ],
            'UI/UX Designer' => [
                "- Created user-centered designs by understanding business requirements and user feedback.",
                "- Created user flows, wireframes, prototypes, and mockups.",
                "- Translated requirements into style guides, design systems, design patterns, and attractive user interfaces.",
                "- Designed UI elements such as input controls, navigational components, and informational components.",
                "- Collaborated effectively with product, engineering, and management teams."
            ],
            'Project Manager' => [
                "- Led cross-functional teams to deliver projects on time and within budget.",
                "- Defined project scope, goals, and deliverables in collaboration with senior management.",
                "- Identified and managed project risks and issues.",
                "- Communicated project status and updates to stakeholders.",
                "- Facilitated agile ceremonies such as sprint planning, stand-ups, and retrospectives."
            ],
            // --- Production, Logistics & Warehouse (Indonesian Focus) ---
            'Admin Produksi' => [
                "- Menginput data hasil produksi harian ke dalam sistem database.",
                "- Membuat laporan produksi harian, mingguan, dan bulanan.",
                "- Memastikan ketersediaan bahan baku untuk kelancaran proses produksi.",
                "- Berkoordinasi dengan tim gudang dan PPIC terkait jadwal produksi.",
                "- Mengarsipkan dokumen-dokumen produksi (Surat Jalan, DO, Invoice) dengan rapi.",
                "- Memonitor stok barang jadi (finish goods) dan barang dalam proses (WIP)."
            ],
            'Staff Administrasi Produksi' => [
                "- Mengelola administrasi dan pencatatan alur produksi pabrik.",
                "- Melakukan input data produksi harian dan verifikasi laporan lapangan.",
                "- Menyusun laporan efisiensi produksi dan pemakaian bahan baku.",
                "- Bekerja sama dengan supervisor produksi untuk memastikan target tercapai.",
                "- Mengontrol absensi dan lembur karyawan produksi."
            ],
            'Admin Gudang' => [
                "- Mengontrol keluar masuk barang serta membuat surat jalan dan delivery order.",
                "- Melakukan input data stok ke dalam sistem inventory (SAP/WMS/Excel).",
                "- Melakukan stock opname rutin untuk memastikan akurasi data fisik dan sistem.",
                "- Mengarsipkan dokumen logistik dan surat jalan dengan rapi.",
                "- Berkoordinasi dengan tim helper dan supir untuk jadwal pengiriman."
            ],
            'Staff Gudang' => [
                "- Melakukan penerimaan dan pengecekan barang masuk sesuai surat jalan.",
                "- Mengatur penataan barang di gudang (FIFO/LIFO) agar rapi dan mudah dicari.",
                "- Melakukan stock opname rutin untuk memastikan akurasi data stok.",
                "- Memproses pengeluaran barang sesuai dengan permintaan pengiriman.",
                "- Menjaga kebersihan dan keamanan area gudang."
            ],
            'Warehouse Admin' => [
                "- Mengelola administrasi keluar masuk barang dan inventory.",
                "- Membuat laporan stok gudang secara berkala.",
                "- Menginput data penerimaan dan pengiriman barang ke sistem.",
                "- Mencocokkan data fisik barang dengan catatan sistem (Stock Opname).",
                "- Berkoordinasi dengan tim logistik untuk pengiriman barang."
            ],
            'Warehouse Staff' => [
                "- Receiving and checking incoming goods against delivery notes.",
                "- Organizing storage layout ensuring FIFO/LIFO principles.",
                "- Conducting regular stock counts (Stationary/Cycle counts).",
                "- Picking and packing orders for dispatch.",
                "- Maintaining warehouse cleanliness and safety standards."
            ],
            'Operator Produksi' => [
                "- Mengoperasikan mesin produksi sesuai dengan SOP yang berlaku.",
                "- Memastikan target produksi harian tercapai dengan kualitas standar.",
                "- Melakukan pengecekan rutin terhadap kondisi mesin dan melaporkan kerusakan.",
                "- Menjaga kebersihan area kerja (5R) dan keselamatan kerja (K3).",
                "- Melakukan pengemasan produk jadi sesuai standar."
            ],
            'Operator Forklift' => [
                "- Mengoperasikan forklift untuk pemindahan barang di area gudang/produksi.",
                "- Memastikan pemindahan barang dilakukan dengan aman dan efisien.",
                "- Melakukan pengecekan rutin kondisi forklift (oli, rem, baterai/bensin).",
                "- Menyusun barang di rak gudang dengan rapi dan aman.",
                "- Membantu proses loading dan unloading barang dari truk."
            ],
            'Logistics Staff' => [
                "- Mengatur jadwal pengiriman barang ke customer tepat waktu.",
                "- Berkoordinasi dengan ekspedisi dan supir untuk rute pengiriman.",
                "- Memastikan dokumen pengiriman (Surat Jalan/DO) lengkap dan valid.",
                "- Memonitor status pengiriman dan menindaklanjuti kendala di lapangan.",
                "- Mengelola biaya operasional kendaraan dan pengiriman."
            ],
            'Admin Logistik' => [
                "- Membuat jadwal pengiriman dan surat jalan untuk supir.",
                "- Mengelola database armada dan monitoring status pengiriman.",
                "- Merekap klaim biaya operasional perjalanan dinas/supir.",
                "- Berkoordinasi dengan pihak gudang untuk kesiapan barang.",
                "- Menangani komplain pengiriman dari customer."
            ],
            'PPIC Staff' => [
                "- Menyusun rencana produksi (Production Planning) dan pengendalian inventory (Inventory Control).",
                "- Memonitor stok bahan baku dan material packaging.",
                "- Membuat jadwal produksi harian dan mingguan.",
                "- Menganalisa kapasitas produksi dan kebutuhan material.",
                "- Berkoordinasi dengan departemen purchasing untuk pengadaan material."
            ],
             // --- General Admin & Office (Indonesian) ---
            'Staff Administrasi' => [
                "- Mengelola dokumen kantor dan melakukan pengarsipan surat masuk/keluar.",
                "- Melakukan input data harian dan rekap laporan database.",
                "- Mengatur jadwal meeting dan menyediakan kebutuhan operasional kantor.",
                "- Menerima telepon dan melayani tamu perusahaan.",
                "- Membantu departemen lain dalam hal administrasi umum."
            ],
            'General Affair' => [
                "- Mengelola pemeliharaan fasilitas dan aset kantor.",
                "- Mengurus perizinan dan dokumen legalitas perusahaan.",
                "- Mengelola kebutuhan ATK dan rumah tangga kantor.",
                "- Mengawasi kinerja staff kebersihan dan keamanan.",
                "- Mengatur penggunaan kendaraan operasional kantor."
            ],
            'Sekretaris' => [
                "- Mengatur jadwal kegiatan dan pertemuan pimpinan.",
                "- Menyiapkan notulen rapat dan mendistribusikan ke peserta rapat.",
                "- Mengelola korespondensi dan komunikasi eksternal.",
                "- Menyusun laporan perjalanan dinas dan akomodasi.",
                "- Menjaga kerahasiaan dokumen dan informasi perusahaan."
            ],
            'Resepsionis' => [
                "- Menerima dan menyambut tamu dengan ramah.",
                "- Menjawab panggilan telepon masuk dan menyambungkan ke pihak terkait.",
                "- Menerima dan meneruskan surat/paket yang masuk.",
                "- Memberikan informasi dasar terkait perusahaan kepada penanya.",
                "- Menjaga kerapian area resepsionis."
            ],
            // --- Sales & Marketing (Indonesian) ---
            'Sales Admin' => [
                "- Memproses order penjualan (Sales Order) dari customer.",
                "- Membuat faktur penjualan dan memastikan pengiriman tepat waktu.",
                "- Merekap laporan penjualan harian dan bulanan.",
                "- Melakukan follow-up pembayaran piutang customer.",
                "- Menangani administrasi database customer."
            ],
            'Sales Marketing' => [
                "- Mencari klien baru dan memperluas jaringan pasar.",
                "- Melakukan presentasi produk dan negosiasi harga dengan customer.",
                "- Mencapai target penjualan bulanan yang ditetapkan perusahaan.",
                "- Menjaga hubungan baik dengan customer existing (Maintenance).",
                "- Membuat laporan aktivitas penjualan harian dan forecast bulanan."
            ]
        ];

        // Search logic
        $bestMatch = null;
        $maxScore = 0;

        foreach ($roles as $role => $bullets) {
            // Calculate similarity score
             similar_text(strtolower($title), strtolower($role), $percent);
             
             // Bonus for partial match (e.g. "Junior Web Developer" contains "Web Developer")
             if (str_contains(strtolower($title), strtolower($role)) || str_contains(strtolower($role), strtolower($title))) {
                 $percent += 30; // Reduced global partial match bonus from 50 to 30 to allow specific keyword boosters to weigh more
             }
             
             // Specific keyword boosters for Indonesian Context (Increased weight)
             if (str_contains(strtolower($title), 'produksi') && str_contains(strtolower($role), 'produksi')) {
                 $percent += 40;
             }
             if ((str_contains(strtolower($title), 'gudang') || str_contains(strtolower($title), 'warehouse')) && (str_contains(strtolower($role), 'gudang') || str_contains(strtolower($role), 'warehouse'))) {
                 $percent += 40;
             }
             if (str_contains(strtolower($title), 'logistik') && (str_contains(strtolower($role), 'logistik') || str_contains(strtolower($role), 'logistics'))) {
                 $percent += 40;
             }
             if (str_contains(strtolower($title), 'admin') && str_contains(strtolower($role), 'admin')) {
                 $percent += 15;
             }
             if (str_contains(strtolower($title), 'forklift') && str_contains(strtolower($role), 'forklift')) {
                 $percent += 50; // High specific boost
             }
             if (str_contains(strtolower($title), 'ppic') && str_contains(strtolower($role), 'ppic')) {
                 $percent += 50; 
             }

             if ($percent > $maxScore) {
                 $maxScore = $percent;
                 $bestMatch = $bullets;
             }
        }

        // Threshold for "good enough" match
        if ($maxScore > 40 && $bestMatch) {
             $description = implode("\n", $bestMatch);
        } else {
             // Fallback Logic based on keywords if exact match fails
             if (str_contains(strtolower($title), 'admin') || str_contains(strtolower($title), 'staf') || str_contains(strtolower($title), 'staff')) {
                 $description = "- Mengelola administrasi harian dan pengarsipan data.\n- Membuat laporan rutin harian/bulanan.\n- Berkoordinasi dengan tim terkait untuk kelancaran operasional.\n- Memastikan akurasi data yang diinput ke sistem.";
             } elseif (str_contains(strtolower($title), 'sales') || str_contains(strtolower($title), 'marketing')) {
                 $description = "- Mencari prospek customer baru.\n- Melakukan penawaran produk dan negosiasi.\n- Mencapai target penjualan perusahaan.\n- Memelihara hubungan baik dengan pelanggan.";
             } else {
                 // Generic Fallback
                 $description = "- Bertanggung jawab atas tugas operasional harian.\n- Berkolaborasi dengan tim untuk mencapai target kerja.\n- Membuat laporan kinerja secara berkala.\n- Memastikan kepatuhan terhadap prosedur perusahaan.";
             }
        }

        return response()->json(['description' => $description]);
    }

    /**
     * Translate experience details to English (Simulated AI).
     */
    /**
     * Translate experience details to English using MyMemory API.
     */
    public function translate(Request $request)
    {
        $title = $request->input('title', '');
        $descriptionId = $request->input('description', '');
        $technologies = $request->input('technologies', '');
        
        $titleEn = $this->translateText($title);
        $descriptionEn = $this->translateText($descriptionId);
        
        // Translate technologies (comma separated)
        $technologiesEn = '';
        if ($technologies) {
             $techList = explode(',', $technologies);
             $translatedTechs = [];
             foreach($techList as $tech) {
                 $translatedTechs[] = $this->translateText(trim($tech));
             }
             $technologiesEn = implode(', ', $translatedTechs);
        }

        return response()->json([
            'title_en' => $titleEn ?: $title,
            'description_en' => $descriptionEn ?: $descriptionId,
            'company_en' => $request->input('company'), 
            'location_en' => $request->input('location'),
            'technologies_en' => $technologiesEn ?: $technologies,
        ]);
    }

    /**
     * Helper to call MyMemory Translation API
     */
    private function translateText($text)
    {
        if (empty($text)) return '';

        try {
            // Split text by newlines to preserve formatting if it's a list
            if (strpos($text, "\n") !== false) {
                 $lines = explode("\n", $text);
                 $translatedLines = [];
                 
                 foreach ($lines as $line) {
                     $trimmed = trim($line);
                     if (empty($trimmed)) {
                         $translatedLines[] = '';
                         continue;
                     }
     
                     $isBullet = str_starts_with($trimmed, '-');
                     $cleanText = $isBullet ? trim(substr($trimmed, 1)) : $trimmed;
     
                     $translatedLines[] = ($isBullet ? '- ' : '') . $this->callApi($cleanText);
                 }
                 return implode("\n", $translatedLines);
            }

            return $this->callApi($text);

        } catch (\Exception $e) {
            return $text; // Overall fallback
        }
    }

    private function callApi($text) {
        $response = \Illuminate\Support\Facades\Http::withoutVerifying()->get('https://api.mymemory.translated.net/get', [
            'q' => $text,
            'langpair' => 'id|en'
        ]);

        if ($response->successful()) {
            $data = $response->json();
            $translatedText = $data['responseData']['translatedText'] ?? $text;
            return html_entity_decode($translatedText);
        }
        return $text;
    }
}
