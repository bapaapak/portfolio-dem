<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CertificationController extends Controller
{
    public function index()
    {
        $certifications = \App\Models\Certification::orderBy('issued_at', 'desc')->get();
        return view('admin.certifications.index', compact('certifications'));
    }

    public function create()
    {
        return view('admin.certifications.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'issuer' => 'required|string|max:255',
            'issued_at' => 'required|date',
            'expiration_date' => 'nullable|date',
            'credential_url' => 'nullable|url',
            'description' => 'nullable|string',
            'name_en' => 'nullable|string|max:255',
            'issuer_en' => 'nullable|string|max:255',
            'description_en' => 'nullable|string',
        ]);

        \App\Models\Certification::create($validated);

        return redirect()->route('admin.certifications.index')->with('success', 'Certification created successfully!');
    }

    public function edit(\App\Models\Certification $certification)
    {
        return view('admin.certifications.edit', compact('certification'));
    }

    public function update(Request $request, \App\Models\Certification $certification)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'issuer' => 'required|string|max:255',
            'issued_at' => 'required|date',
            'expiration_date' => 'nullable|date',
            'credential_url' => 'nullable|url',
            'description' => 'nullable|string',
            'name_en' => 'nullable|string|max:255',
            'issuer_en' => 'nullable|string|max:255',
            'description_en' => 'nullable|string',
        ]);

        $certification->update($validated);

        return redirect()->route('admin.certifications.index')->with('success', 'Certification updated successfully!');
    }

    public function destroy(\App\Models\Certification $certification)
    {
        $certification->delete();
        return redirect()->route('admin.certifications.index')->with('success', 'Certification deleted successfully!');
    }

    public function translate(Request $request)
    {
        $name = $request->input('name', '');
        $description = $request->input('description', '');
        $issuer = $request->input('issuer', '');

        $nameEn = $this->translateText($name);
        $descriptionEn = $this->translateText($description);
        $issuerEn = $this->translateText($issuer);

        return response()->json([
            'name_en' => $nameEn ?: $name,
            'description_en' => $descriptionEn ?: $description,
            'issuer_en' => $issuerEn ?: $issuer,
        ]);
    }

    private function translateText($text)
    {
        if (empty($text)) return '';

        try {
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
        } catch (\Exception $e) {
            return $text;
        }
    }
}
