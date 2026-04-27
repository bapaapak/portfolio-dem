<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Schema;

class CareerAspirationController extends Controller
{
    public function index()
    {
        $profile = Profile::firstOrCreate([]);
        return view('admin.career_aspiration.index', compact('profile'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'career_aspiration' => 'nullable|string',
            'career_milestones' => 'nullable|array',
            'career_milestones.*.year' => 'nullable|string',
            'career_milestones.*.title' => 'required_with:career_milestones.*.year|string',
            'career_milestones.*.description' => 'nullable|string',
            'aspiration_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:10240',
        ]);

        $profile = Profile::firstOrCreate([]);
        
        $milestones = array_filter($request->input('career_milestones', []), function($item) {
            return !empty($item['year']) || !empty($item['title']);
        });

        $milestones = $this->sortMilestonesByYear(array_values($milestones));

        $updateData = [
            'career_aspiration' => $request->input('career_aspiration'),
            'career_milestones' => array_values($milestones),
        ];

        if ($request->hasFile('aspiration_image') && Schema::hasColumn('profiles', 'aspiration_image')) {
            if ($profile->aspiration_image) {
                Storage::disk('public')->delete($profile->aspiration_image);
            }
            $updateData['aspiration_image'] = $request->file('aspiration_image')->store('career_aspiration', 'public');
            $file = $request->file('aspiration_image');
            if (Schema::hasColumn('profiles', 'aspiration_image_data')) {
                $updateData['aspiration_image_data'] = \App\Helpers\ImageCompressor::compressToBase64($file);
            }
        }

        $profile->update($updateData);

        return redirect()->route('admin.career-aspiration.index')
            ->with('success', 'Career Aspiration updated successfully!');
    }

    private function sortMilestonesByYear(array $milestones): array
    {
        $decorated = [];

        foreach ($milestones as $index => $milestone) {
            $yearText = (string) ($milestone['year'] ?? '');
            $yearRange = $this->extractYearRange($yearText);

            $decorated[] = [
                'index' => $index,
                'milestone' => $milestone,
                'start' => $yearRange[0],
                'end' => $yearRange[1],
            ];
        }

        usort($decorated, function (array $a, array $b): int {
            if ($a['start'] !== $b['start']) {
                return $a['start'] <=> $b['start'];
            }

            if ($a['end'] !== $b['end']) {
                return $a['end'] <=> $b['end'];
            }

            return $a['index'] <=> $b['index'];
        });

        return array_values(array_map(function (array $item): array {
            return $item['milestone'];
        }, $decorated));
    }

    private function extractYearRange(string $yearText): array
    {
        preg_match_all('/\b(?:19|20)\d{2}\b/', $yearText, $matches);

        if (empty($matches[0])) {
            return [PHP_INT_MAX, PHP_INT_MAX];
        }

        $years = array_map('intval', $matches[0]);
        sort($years);

        return [$years[0], $years[count($years) - 1]];
    }
}
