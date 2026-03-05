<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Skill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class SkillController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $skills = Skill::orderBy('order')->get();
        return view('admin.skills.index', compact('skills'));
    }

    /**
     * Show the form for creating a new resource.
     */
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $usedOrdersTechnical = Skill::where('type', 'technical')->orderBy('order')->pluck('order')->unique()->toArray();
        $usedOrdersSoft = Skill::where('type', 'soft')->orderBy('order')->pluck('order')->unique()->toArray();
        
        return view('admin.skills.create', [
            'usedOrdersTechnical' => implode(', ', $usedOrdersTechnical),
            'usedOrdersSoft' => implode(', ', $usedOrdersSoft),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rules = [
            'type' => 'required|in:technical,soft',
            'order' => 'integer|min:0',
            'category' => 'nullable|string|max:255',
            'category_en' => 'nullable|string|max:255',
            'items' => 'nullable|string',
            'items_en' => 'nullable|string',
        ];

        // If type is technical, category and items are required
        if ($request->input('type') === 'technical') {
            $rules['category'] = 'required|string|max:255';
            $rules['items'] = 'required|string';
        }

        $validated = $request->validate($rules);

        Skill::create($validated);

        return redirect()->route('admin.skills.index')->with('success', 'Skill category added successfully!');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Skill $skill)
    {
        $usedOrdersTechnical = Skill::where('type', 'technical')->orderBy('order')->pluck('order')->unique()->toArray();
        $usedOrdersSoft = Skill::where('type', 'soft')->orderBy('order')->pluck('order')->unique()->toArray();
        
        return view('admin.skills.edit', [
            'skill' => $skill,
            'usedOrdersTechnical' => implode(', ', $usedOrdersTechnical),
            'usedOrdersSoft' => implode(', ', $usedOrdersSoft),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Skill $skill)
    {
        $rules = [
            'type' => 'required|in:technical,soft',
            'order' => 'integer|min:0',
            'category' => 'nullable|string|max:255',
            'category_en' => 'nullable|string|max:255',
            'items' => 'nullable|string',
            'items_en' => 'nullable|string',
        ];

        // If type is technical, category and items are required
        if ($request->input('type') === 'technical') {
            $rules['category'] = 'required|string|max:255';
            $rules['items'] = 'required|string';
        }

        $validated = $request->validate($rules);

        $skill->update($validated);

        return redirect()->route('admin.skills.index')->with('success', 'Skill category updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Skill $skill)
    {
        $skill->delete();

        return redirect()->route('admin.skills.index')->with('success', 'Skill category deleted successfully!');
    }

    /**
     * Generate category name based on skills input.
     */
    public function generateCategory(Request $request)
    {
        $items = $request->input('items', '');
        $category = 'General Skills'; // Default fallback

        // Extensive Keyword Dictionary for "AI-like" categorization
        $knowledgeBase = [
            'Web Development' => [
                'html', 'css', 'sass', 'less', 'javascript', 'typescript', 'react', 'vue', 'angular', 'svelte', 'next.js', 'nuxt', 'jquery', 'bootstrap', 'tailwind',
                'php', 'laravel', 'codeigniter', 'symfony', 'node', 'express', 'nestjs', 'ruby', 'rails', 'django', 'flask', 'fastapi', 'asp.net', '.net', 'c#', 'go', 'golang',
                'wordpress', 'shopify', 'magento', 'woocommerce', 'api', 'graphql', 'rest', 'json', 'xml'
            ],
            'Mobile Development' => [
                'android', 'ios', 'swift', 'objective-c', 'kotlin', 'java', 'xml', 'flutter', 'dart', 'react native', 'xamarin', 'ionic', 'mobile'
            ],
            'Data Science & Analytics' => [
                'python', 'r', 'pandas', 'numpy', 'scipy', 'scikit-learn', 'tensorflow', 'keras', 'pytorch', 'matplotlib', 'seaborn', 'tableau', 'power bi', 'excel', 'sql', 'mysql', 'postgresql', 'mongodb', 'bigquery', 'hadoop', 'spark', 'data analysis', 'statistics', 'machine learning', 'ai', 'artificial intelligence'
            ],
            'DevOps & Cloud' => [
                'aws', 'azure', 'google cloud', 'gcp', 'docker', 'kubernetes', 'jenkins', 'circleci', 'gitlab ci', 'travis', 'git', 'github', 'bitbucket', 'linux', 'bash', 'shell', 'ubuntu', 'centos', 'nginx', 'apache', 'ansible', 'terraform', 'prometheus', 'grafana'
            ],
            'UI/UX & Design' => [
                'figma', 'sketch', 'adobe xd', 'photoshop', 'illustrator', 'indesign', 'premiere pro', 'after effects', 'canva', 'ui', 'ux', 'user interface', 'user experience', 'prototyping', 'wireframing', 'web design', 'graphic design', 'logo'
            ],
            'Soft Skills' => [
                'communication', 'leadership', 'teamwork', 'collaboration', 'problem solving', 'critical thinking', 'time management', 'adaptability', 'creativity', 'presentation', 'negotiation', 'emotional intelligence', 'mentoring', 'public speaking', 'decision making'
            ],
            'Project Management' => [
                'agile', 'scrum', 'kanban', 'jira', 'trello', 'asana', 'notion', 'clickup', 'project management', 'product management', 'sdlc', 'waterfall'
            ],
            'Operational & Logistics' => [
                'forklift', 'excavator', 'heavy equipment', 'warehouse', 'logistics', 'inventory', 'supply chain', 'shipping', 'receiving', 'packaging', 'stock control', 'driving', 'safety', 'hse', 'k3', 'maintenance', 'repair', 'gudang', 'supir', 'pengiriman'
            ],
            'Office & Administration' => [
                'microsoft office', 'word', 'excel', 'powerpoint', 'outlook', 'google workspace', 'docs', 'sheets', 'slides', 'typing', 'data entry', 'administration', 'secretary', 'filing', 'customer service'
            ],
            'Networking & Security' => [
                'networking', 'tcp/ip', 'dns', 'dhcp', 'vpn', 'firewall', 'security', 'cyber security', 'penetration testing', 'ethical hacking', 'cisco', 'mikrotik', 'wireshark'
            ]
        ];

        $scores = [];

        foreach ($knowledgeBase as $catName => $keywords) {
            $scores[$catName] = 0;
            foreach ($keywords as $keyword) {
                // Use RegEx for whole word matching to presume "Java" isn't found inside "JavaScript"
                // Escape keyword for safe regex
                $pattern = '/\b' . preg_quote($keyword, '/') . '\b/i';
                if (preg_match($pattern, $items)) {
                    $scores[$catName]++;
                }
            }
        }

        // Sort by score (descending)
        arsort($scores);
        $bestMatch = array_key_first($scores);

        // Minimum threshold check (at least 1 keyword match)
        if ($scores[$bestMatch] > 0) {
            $category = $bestMatch;
        }

        return response()->json(['category' => $category]);
    }

    /**
     * Translate text using MyMemory API.
     */
    public function translate(Request $request)
    {
        $category = $request->input('category', '');
        $items = $request->input('items', '');
        
        $categoryEn = $this->translateText($category);
        $itemsEn = $this->translateText($items);

        return response()->json([
            'category_en' => $categoryEn ?: $category,
            'items_en' => $itemsEn ?: $items,
        ]);
    }

    /**
     * Helper to translate text.
     */
    private function translateText($text)
    {
        if (empty($text)) return '';

        try {
            // Check if it's a comma-separated list (common in skills)
            // Use strpos for broader compatibility, though Laravel 10 requires PHP 8.1
            if (strpos($text, ',') !== false) {
                $parts = explode(',', $text);
                $translatedParts = [];
                
                foreach ($parts as $part) {
                    $trimmed = trim($part);
                    if (empty($trimmed)) {
                        $translatedParts[] = '';
                        continue;
                    }
                    
                    $translatedParts[] = $this->callTranslationApi($trimmed);
                }
                return implode(', ', $translatedParts);
            }

            // Otherwise treat as single phrase/sentence
            return $this->callTranslationApi($text);

        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error('Translation Error: ' . $e->getMessage());
            return $text; // Fallback
        }
    }

    private function callTranslationApi($text)
    {
        // Added withoutVerifying() to avoid SSL certificate issues on local environments
        $response = Http::withoutVerifying()->get('https://api.mymemory.translated.net/get', [
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
