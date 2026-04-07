<?php
/**
 * SETUP SCRIPT UNTUK CPANEL
 * =============================
 * 1. Upload file ini ke folder public/
 * 2. Akses via browser: https://yourdomain.com/setup.php
 * 3. HAPUS FILE INI SETELAH SELESAI!
 */

// Security check - hapus baris ini jika perlu
$allowed_ip = null; // ganti dengan IP Anda jika mau restrict: '123.456.789.0'
if ($allowed_ip && $_SERVER['REMOTE_ADDR'] !== $allowed_ip) {
    die('Access denied');
}

echo "<!DOCTYPE html><html><head><title>Laravel Setup</title>";
echo "<style>body{font-family:Arial,sans-serif;padding:40px;background:#1e293b;color:#e2e8f0;}";
echo "pre{background:#0f172a;padding:20px;border-radius:8px;overflow-x:auto;}";
echo ".success{color:#4ade80;}.error{color:#f87171;}.warning{color:#fbbf24;}";
echo "h1{color:#818cf8;}h2{color:#a5b4fc;border-bottom:1px solid #334155;padding-bottom:10px;}</style></head><body>";

echo "<h1>🚀 Laravel Setup</h1>";

// Change to parent directory (from public to root)
chdir('..');
$basePath = getcwd();

// STEP 0: Fix git safe.directory and pull latest code
echo "<h2>Git Pull</h2>";
$gitCmds = [
    "git config --global --add safe.directory {$basePath} 2>&1",
    "cd {$basePath} && git fetch origin 2>&1",
    "cd {$basePath} && git reset --hard origin/main 2>&1",
    "cd {$basePath} && git clean -fd --exclude=.env --exclude=storage 2>&1",
];
foreach ($gitCmds as $cmd) {
    $result = shell_exec($cmd);
    echo "<pre>" . htmlspecialchars($cmd) . "\n" . htmlspecialchars($result ?: '(ok)') . "</pre>";
}

// STEP 1: Ensure .env exists
echo "<h2>.env Check</h2>";
if (!file_exists('.env')) {
    if (file_exists('.env.local')) {
        copy('.env.local', '.env');
        echo "<pre class='warning'>⚠️ .env was MISSING! Restored from .env.local</pre>";
    } elseif (file_exists('env.production')) {
        copy('env.production', '.env');
        echo "<pre class='warning'>⚠️ .env was MISSING! Restored from env.production</pre>";
    } else {
        echo "<pre class='error'>❌ .env NOT found and no source file available!</pre>";
    }
} else {
    echo "<pre class='success'>✅ .env exists</pre>";
}

// STEP 0.5: Run migrations
echo "<h2>Migrations</h2>";
$output = shell_exec('php artisan migrate --force 2>&1');
$class = (strpos($output, 'error') !== false || strpos($output, 'Error') !== false) ? 'error' : 'success';
echo "<pre class='$class'>$output</pre>";

// STEP 0.6: Create required directories
echo "<h2>Storage Directories</h2>";
$dirs = [
    'storage/app/public/company/misc',
    'storage/app/public/company/plants',
    'storage/app/public/company/directors',
    'storage/app/public/company/business_models',
    'storage/app/public/experiences/logos',
];
foreach ($dirs as $dir) {
    if (!is_dir($dir)) {
        mkdir($dir, 0775, true);
        echo "<pre class='warning'>Created: $dir</pre>";
    } else {
        echo "<pre class='success'>✅ $dir exists</pre>";
    }
}

$commands = [
    'Storage Link' => 'php artisan storage:link --force 2>&1',
    'Clear Cache' => 'php artisan optimize:clear 2>&1',
    'Config Cache' => 'php artisan config:cache 2>&1',
    'Route Cache' => 'php artisan route:cache 2>&1',
    'View Cache' => 'php artisan view:cache 2>&1',
];

foreach ($commands as $name => $command) {
    echo "<h2>$name</h2>";
    $output = shell_exec($command);
    $class = (strpos($output, 'error') !== false || strpos($output, 'Error') !== false) ? 'error' : 'success';
    echo "<pre class='$class'>$output</pre>";
}

echo "<h2 class='warning'>⚠️ PENTING!</h2>";
echo "<p class='warning'>Setup selesai! <strong>HAPUS FILE INI SEGERA</strong> untuk keamanan!</p>";
echo "<p>File location: <code>public/setup.php</code></p>";

echo "</body></html>";
