<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

/**
 * One-time migration: reads existing image files from storage and saves them
 * as base64 in the _data columns, so images survive container rebuilds.
 */
return new class extends Migration
{
    public function up(): void
    {
        $disk = Storage::disk('public');

        // Committee Activities: image → image_data
        $this->populateFromFile('committee_activities', 'image', 'image_data', $disk);

        // Experiences: logo → logo_data
        $this->populateFromFile('experiences', 'logo', 'logo_data', $disk);

        // Education: logo → logo_data
        $this->populateFromFile('education', 'logo', 'logo_data', $disk);

        // Job Descriptions: illustration_image → illustration_image_data
        $this->populateFromFile('job_descriptions', 'illustration_image', 'illustration_image_data', $disk);

        // Profiles: aspiration_image → aspiration_image_data
        $this->populateFromFile('profiles', 'aspiration_image', 'aspiration_image_data', $disk);

        // Company Profiles
        $this->populateCompanyProfile($disk);
    }

    private function populateFromFile(string $table, string $fileCol, string $dataCol, $disk): void
    {
        if (!$this->hasColumns($table, [$fileCol, $dataCol])) {
            return;
        }

        $rows = DB::table($table)
            ->whereNotNull($fileCol)
            ->where($fileCol, '!=', '')
            ->where(function ($q) use ($dataCol) {
                $q->whereNull($dataCol)->orWhere($dataCol, '');
            })
            ->get(['id', $fileCol]);

        foreach ($rows as $row) {
            $path = ltrim($row->$fileCol, '/');
            if ($disk->exists($path)) {
                $contents = $disk->get($path);
                $mime = $this->guessMime($path);
                $base64 = 'data:' . $mime . ';base64,' . base64_encode($contents);
                DB::table($table)->where('id', $row->id)->update([$dataCol => $base64]);
            }
        }
    }

    private function populateCompanyProfile($disk): void
    {
        if (!$this->hasColumns('company_profiles', ['logo', 'logo_data'])) {
            return;
        }

        $fields = [
            'logo' => 'logo_data',
            'plant_1_image' => 'plant_1_image_data',
            'plant_2_image' => 'plant_2_image_data',
            'director_image' => 'director_image_data',
        ];

        $profiles = DB::table('company_profiles')->get();

        foreach ($profiles as $profile) {
            $updates = [];
            foreach ($fields as $fileCol => $dataCol) {
                if (!isset($profile->$fileCol) || !isset($profile->$dataCol)) continue;
                if (empty($profile->$fileCol)) continue;
                if (!empty($profile->$dataCol)) continue;

                $path = ltrim($profile->$fileCol, '/');
                if ($disk->exists($path)) {
                    $contents = $disk->get($path);
                    $mime = $this->guessMime($path);
                    $updates[$dataCol] = 'data:' . $mime . ';base64,' . base64_encode($contents);
                }
            }
            if (!empty($updates)) {
                DB::table('company_profiles')->where('id', $profile->id)->update($updates);
            }
        }
    }

    private function hasColumns(string $table, array $columns): bool
    {
        if (!\Illuminate\Support\Facades\Schema::hasTable($table)) return false;
        foreach ($columns as $col) {
            if (!\Illuminate\Support\Facades\Schema::hasColumn($table, $col)) return false;
        }
        return true;
    }

    private function guessMime(string $path): string
    {
        $ext = strtolower(pathinfo($path, PATHINFO_EXTENSION));
        return match ($ext) {
            'jpg', 'jpeg' => 'image/jpeg',
            'png' => 'image/png',
            'gif' => 'image/gif',
            'webp' => 'image/webp',
            'svg' => 'image/svg+xml',
            default => 'image/jpeg',
        };
    }

    public function down(): void
    {
        // No rollback needed — data columns are not dropped
    }
};
