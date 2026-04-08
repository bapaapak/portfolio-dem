<?php
/**
 * Emergency cache clear - gunakan saat artisan tidak bisa dijalankan.
 * HAPUS FILE INI setelah selesai digunakan!
 * Akses: https://yourdomain.com/emergency_clear.php
 */

// Basic security: require a secret token
$secret = 'clear_' . md5('portfolio_emergency_2026');
if (($_GET['token'] ?? '') !== $secret) {
    http_response_code(403);
    echo "403 Forbidden. Append ?token=" . $secret . " to the URL.";
    exit;
}

$base = dirname(__DIR__);
$results = [];

// Files to delete
$toDelete = [
    $base . '/bootstrap/cache/config.php',
    $base . '/bootstrap/cache/packages.php',
    $base . '/bootstrap/cache/services.php',
    $base . '/bootstrap/cache/events.php',
];

// Route cache files (wildcard)
foreach (glob($base . '/bootstrap/cache/routes*.php') ?: [] as $f) {
    $toDelete[] = $f;
}

// View cache
foreach (glob($base . '/storage/framework/views/*.php') ?: [] as $f) {
    $toDelete[] = $f;
}

// App cache data
foreach (glob($base . '/storage/framework/cache/data/*/*') ?: [] as $f) {
    if (is_file($f)) $toDelete[] = $f;
}

foreach ($toDelete as $file) {
    if (file_exists($file)) {
        if (unlink($file)) {
            $results[] = "✅ Deleted: " . str_replace($base, '', $file);
        } else {
            $results[] = "❌ Cannot delete: " . str_replace($base, '', $file);
        }
    }
}

if (empty($results)) {
    $results[] = "ℹ️ Nothing to clear — caches already empty.";
}

// Also fix permissions
$dirs = [
    $base . '/storage',
    $base . '/storage/framework',
    $base . '/storage/framework/views',
    $base . '/storage/framework/cache',
    $base . '/storage/framework/sessions',
    $base . '/storage/logs',
    $base . '/bootstrap/cache',
];
foreach ($dirs as $dir) {
    if (!is_dir($dir)) mkdir($dir, 0775, true);
    chmod($dir, 0775);
}
$results[] = "✅ Permissions reset on storage/ and bootstrap/cache/";

echo "<h2>Emergency Cache Clear</h2><pre>" . implode("\n", $results) . "</pre>";
echo "<br><strong>Done. Reload <a href='/'>homepage</a> now.</strong>";
echo "<br><br><em style='color:red'>DELETE this file from server after use: public/emergency_clear.php</em>";
