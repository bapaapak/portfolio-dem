<?php
// Temporary debug file - DELETE after use
error_reporting(E_ALL);
ini_set('display_errors', 1);
define('LARAVEL_START', microtime(true));

require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
$request = Illuminate\Http\Request::capture();
try {
    $response = $kernel->handle($request);
    echo "<pre style='color:green'>APP BOOTS OK - HTTP " . $response->getStatusCode() . "</pre>";
    
    // Show recent log
    $log = base_path('storage/logs/laravel.log');
    if (file_exists($log)) {
        $lines = array_slice(file($log), -80);
        echo "<h3>Last 80 lines of laravel.log:</h3><pre>" . htmlspecialchars(implode('', $lines)) . "</pre>";
    }
} catch (Throwable $e) {
    echo "<h2 style='color:red'>ERROR: " . get_class($e) . "</h2>";
    echo "<pre>" . htmlspecialchars($e->getMessage()) . "\n\n" . htmlspecialchars($e->getTraceAsString()) . "</pre>";
}
