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

echo "<h1>🚀 Laravel cPanel Setup</h1>";

// Change to parent directory (from public to root)
chdir('..');

$commands = [
    'Storage Link' => 'php artisan storage:link 2>&1',
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
