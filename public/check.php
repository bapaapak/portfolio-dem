<?php
echo "<h2>Laravel Structure Check</h2>";

$base = dirname(__DIR__);
$checks = [
    'bootstrap/app.php',
    'config/app.php',
    'vendor/autoload.php',
    'vendor/laravel/framework/src/Illuminate/View/ViewServiceProvider.php',
    'resources/views',
    '.env',
    'routes/web.php',
    'app/Providers/AppServiceProvider.php',
];

echo "<table border='1' cellpadding='5'>";
echo "<tr><th>File/Folder</th><th>Status</th></tr>";

foreach ($checks as $path) {
    $fullPath = $base . '/' . $path;
    $exists = file_exists($fullPath);
    $status = $exists ? "✅ EXISTS" : "❌ NOT FOUND";
    $color = $exists ? "green" : "red";
    echo "<tr><td>$path</td><td style='color:$color'>$status</td></tr>";
}
echo "</table>";

// Check .env content
echo "<h3>.env Check:</h3>";
$envPath = $base . '/.env';
if (file_exists($envPath)) {
    $env = file_get_contents($envPath);
    $hasAppKey = strpos($env, 'APP_KEY=base64:') !== false;
    echo $hasAppKey ? "✅ APP_KEY exists<br>" : "❌ APP_KEY missing<br>";
    
    // Show DB config (hide password)
    preg_match('/DB_HOST=(.+)/', $env, $m); echo "DB_HOST: " . trim($m[1] ?? 'N/A') . "<br>";
    preg_match('/DB_DATABASE=(.+)/', $env, $m); echo "DB_DATABASE: " . trim($m[1] ?? 'N/A') . "<br>";
    preg_match('/DB_USERNAME=(.+)/', $env, $m); echo "DB_USERNAME: " . trim($m[1] ?? 'N/A') . "<br>";
    preg_match('/DB_PORT=(.+)/', $env, $m); echo "DB_PORT: " . trim($m[1] ?? 'N/A') . "<br>";
    preg_match('/APP_ENV=(.+)/', $env, $m); echo "APP_ENV: " . trim($m[1] ?? 'N/A') . "<br>";
    preg_match('/APP_DEBUG=(.+)/', $env, $m); echo "APP_DEBUG: " . trim($m[1] ?? 'N/A') . "<br>";
    preg_match('/APP_URL=(.+)/', $env, $m); echo "APP_URL: " . trim($m[1] ?? 'N/A') . "<br>";
} else {
    echo "❌ .env file not found<br>";
}

// Test DB connection
echo "<h3>DB Connection Test:</h3>";
try {
    $env = file_get_contents($envPath);
    preg_match('/DB_HOST=(.+)/', $env, $h);
    preg_match('/DB_PORT=(.+)/', $env, $po);
    preg_match('/DB_DATABASE=(.+)/', $env, $d);
    preg_match('/DB_USERNAME=(.+)/', $env, $u);
    preg_match('/DB_PASSWORD=(.+)/', $env, $p);
    $dsn = 'mysql:host=' . trim($h[1]) . ';port=' . trim($po[1]) . ';dbname=' . trim($d[1]);
    $pdo = new PDO($dsn, trim($u[1]), trim($p[1]));
    echo "✅ DB Connected!<br>";
    $stmt = $pdo->query("SELECT COUNT(*) as c FROM company_profiles");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "company_profiles rows: " . $row['c'] . "<br>";
} catch (Exception $e) {
    echo "❌ DB Error: " . htmlspecialchars($e->getMessage()) . "<br>";
}

// Check config cache
echo "<h3>Cache Status:</h3>";
echo file_exists($base . '/bootstrap/cache/config.php') ? "⚠️ config.php cached<br>" : "✅ No config cache<br>";
echo file_exists($base . '/bootstrap/cache/routes-v7.php') ? "⚠️ routes cached<br>" : "✅ No route cache<br>";
echo file_exists($base . '/public/storage') ? "✅ storage symlink exists<br>" : "❌ storage symlink missing<br>";

// Check writable
echo "<h3>Permissions:</h3>";
echo is_writable($base . '/storage') ? "✅ storage writable<br>" : "❌ storage NOT writable<br>";
echo is_writable($base . '/bootstrap/cache') ? "✅ bootstrap/cache writable<br>" : "❌ bootstrap/cache NOT writable<br>";
echo is_writable($base . '/storage/logs') ? "✅ storage/logs writable<br>" : "❌ storage/logs NOT writable<br>";

// Try to get actual Laravel error
echo "<h3>Laravel Boot Test:</h3>";
try {
    require $base . '/vendor/autoload.php';
    $app = require $base . '/bootstrap/app.php';
    $kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
    echo "✅ Laravel booted OK<br>";
    
    // Try handling an actual request
    echo "<h3>Request Handling Test:</h3>";
    $request = Illuminate\Http\Request::create('/', 'GET');
    $response = $kernel->handle($request);
    echo "Response status: " . $response->getStatusCode() . "<br>";
    if ($response->getStatusCode() >= 400) {
        $content = $response->getContent();
        // Try to extract error message
        if (preg_match('/<title>(.*?)<\/title>/s', $content, $m)) {
            echo "Title: " . htmlspecialchars($m[1]) . "<br>";
        }
        if (preg_match('/class="exception-message[^"]*"[^>]*>(.*?)<\//s', $content, $m)) {
            echo "Error: " . htmlspecialchars(strip_tags($m[1])) . "<br>";
        }
        // Show first 2000 chars of body for debugging
        echo "<details><summary>Response body (first 2000 chars)</summary><pre>" . htmlspecialchars(substr($content, 0, 2000)) . "</pre></details>";
    }
    $kernel->terminate($request, $response);
} catch (Throwable $e) {
    echo "❌ Laravel Error: " . htmlspecialchars($e->getMessage()) . "<br>";
    echo "File: " . htmlspecialchars($e->getFile()) . ":" . $e->getLine() . "<br>";
    echo "<details><summary>Trace</summary><pre>" . htmlspecialchars($e->getTraceAsString()) . "</pre></details>";
}

// Storage file listing
echo "<h3>Storage Files:</h3>";
$storageBase = $base . '/storage/app/public';
if (is_dir($storageBase)) {
    $rii = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($storageBase));
    $count = 0;
    echo "<pre>";
    foreach ($rii as $file) {
        if ($file->isDir()) continue;
        $relPath = str_replace($storageBase . '/', '', $file->getPathname());
        echo $relPath . " (" . round($file->getSize()/1024, 1) . " KB)\n";
        $count++;
        if ($count > 100) { echo "... truncated\n"; break; }
    }
    echo "</pre>";
    echo "Total files: $count<br>";
} else {
    echo "❌ storage/app/public does NOT exist<br>";
    // Check what does exist
    echo "Checking alternative paths:<br>";
    foreach (['/app/storage', '/app/storage/app', '/app/storage/app/public', '/app/public/storage'] as $p) {
        echo "$p: " . (is_dir($p) ? "✅ DIR" : (is_link($p) ? "🔗 LINK -> " . readlink($p) : "❌ NO")) . "<br>";
    }
}