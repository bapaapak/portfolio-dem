<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Storage;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Artisan::command('media:audit-missing {--export= : Export JSON report to a file path} {--limit=10 : Max missing rows shown per source (0 = no limit)}', function () {
    $sources = [
        ['table' => 'experiences', 'column' => 'logo', 'label' => 'Professional Experience'],
        ['table' => 'educations', 'column' => 'logo', 'label' => 'Education'],
        ['table' => 'committee_activities', 'column' => 'image', 'label' => 'Committee Activities'],
        ['table' => 'job_descriptions', 'column' => 'illustration_image', 'label' => 'Job Description Activity'],
        ['table' => 'profiles', 'column' => 'aspiration_image', 'label' => 'Career Aspiration'],
        ['table' => 'profiles', 'column' => 'photo', 'label' => 'Profile Photo'],
        ['table' => 'company_profiles', 'column' => 'logo', 'label' => 'Company Profile'],
        ['table' => 'organization_structures', 'column' => 'photo', 'label' => 'Organization Structure'],
    ];

    $normalizePath = function (?string $rawPath): ?string {
        if (!$rawPath) {
            return null;
        }

        $path = str_replace('\\', '/', trim($rawPath));

        if (preg_match('#^https?://#i', $path)) {
            $parsedPath = parse_url($path, PHP_URL_PATH) ?: '';
            if ($parsedPath === '' || !preg_match('#/(storage|media|public)/#', $parsedPath)) {
                return null;
            }
            $path = $parsedPath;
        }

        $path = ltrim($path, '/');

        foreach ([
            'storage/app/public/',
            'app/storage/app/public/',
            'var/www/html/storage/app/public/',
            'public/storage/',
            'storage/',
            'public/',
            'media/',
        ] as $prefix) {
            if (str_starts_with($path, $prefix)) {
                $path = ltrim(substr($path, strlen($prefix)), '/');
                break;
            }
        }

        return $path !== '' ? $path : null;
    };

    $resolveCandidates = function (string $normalized): array {
        $normalized = ltrim($normalized, '/');

        $candidates = [
            $normalized,
            'storage/' . $normalized,
            'public/' . $normalized,
        ];

        return array_values(array_unique(array_filter($candidates, fn ($v) => $v !== '')));
    };

    $existsOnServer = function (string $normalized) use ($resolveCandidates): bool {
        foreach ($resolveCandidates($normalized) as $candidate) {
            if (Storage::disk('public')->exists($candidate)) {
                return true;
            }

            if (file_exists(storage_path('app/public/' . ltrim($candidate, '/')))) {
                return true;
            }

            if (file_exists(public_path('storage/' . ltrim($candidate, '/')))) {
                return true;
            }
        }

        return false;
    };

    $report = [
        'generated_at' => now()->toDateTimeString(),
        'total_rows_checked' => 0,
        'total_missing' => 0,
        'sources' => [],
        'missing_directories' => [],
    ];

    $rowsOutput = [];

    foreach ($sources as $source) {
        $table = $source['table'];
        $column = $source['column'];
        $label = $source['label'];

        if (!Schema::hasTable($table) || !Schema::hasColumn($table, $column)) {
            $rowsOutput[] = [$label, "$table.$column", '-', '-', 'skipped'];
            continue;
        }

        $rows = DB::table($table)
            ->select(['id', $column])
            ->whereNotNull($column)
            ->where($column, '!=', '')
            ->orderBy('id')
            ->get();

        $checked = 0;
        $missing = [];

        foreach ($rows as $row) {
            $checked++;
            $raw = (string) ($row->{$column} ?? '');
            $normalized = $normalizePath($raw);

            if (!$normalized) {
                continue;
            }

            if (!$existsOnServer($normalized)) {
                $missing[] = [
                    'id' => $row->id,
                    'raw' => $raw,
                    'normalized' => $normalized,
                    'candidates' => $resolveCandidates($normalized),
                ];

                $dir = dirname($normalized);
                $dir = $dir === '.' ? '/' : $dir;
                if (!isset($report['missing_directories'][$dir])) {
                    $report['missing_directories'][$dir] = 0;
                }
                $report['missing_directories'][$dir]++;
            }
        }

        $report['total_rows_checked'] += $checked;
        $report['total_missing'] += count($missing);
        $report['sources'][] = [
            'label' => $label,
            'table' => $table,
            'column' => $column,
            'checked' => $checked,
            'missing_count' => count($missing),
            'missing' => $missing,
        ];

        $rowsOutput[] = [$label, "$table.$column", (string) $checked, (string) count($missing), 'ok'];
    }

    ksort($report['missing_directories']);

    $this->info('Media Audit Summary');
    $this->table(['Source', 'Field', 'Checked', 'Missing', 'Status'], $rowsOutput);
    $this->line('Total rows checked: ' . $report['total_rows_checked']);
    $this->line('Total missing files: ' . $report['total_missing']);

    $limit = (int) $this->option('limit');
    foreach ($report['sources'] as $sourceReport) {
        if ($sourceReport['missing_count'] === 0) {
            continue;
        }

        $this->newLine();
        $this->warn($sourceReport['label'] . ' (' . $sourceReport['table'] . '.' . $sourceReport['column'] . ') - missing: ' . $sourceReport['missing_count']);

        $missingRows = $sourceReport['missing'];
        if ($limit > 0) {
            $missingRows = array_slice($missingRows, 0, $limit);
        }

        foreach ($missingRows as $row) {
            $this->line('- id=' . $row['id'] . ' normalized=' . $row['normalized']);
        }
    }

    if (!empty($report['missing_directories'])) {
        $this->newLine();
        $this->info('Missing directories (for restore target):');
        foreach ($report['missing_directories'] as $dir => $count) {
            $this->line('- ' . $dir . ' (' . $count . ' file refs)');
        }
    }

    $exportPath = $this->option('export');
    if ($exportPath) {
        $json = json_encode($report, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
        if ($json === false) {
            $this->error('Failed to encode JSON report.');
            return 1;
        }

        $dir = dirname($exportPath);
        if (!is_dir($dir)) {
            @mkdir($dir, 0755, true);
        }

        file_put_contents($exportPath, $json);
        $this->info('Report exported to: ' . $exportPath);
    }

    return 0;
})->purpose('Audit missing media files referenced in the database');
