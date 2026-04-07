<?php

use Illuminate\Foundation\Application;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

// Recover from stale/corrupt bootstrap cache files that can break provider resolution
// on production servers where package discovery/cache was generated from a different
// dependency set.
foreach ([
    __DIR__ . '/../bootstrap/cache/packages.php',
    __DIR__ . '/../bootstrap/cache/services.php',
] as $bootstrapCacheFile) {
    if (is_file($bootstrapCacheFile) && is_writable($bootstrapCacheFile)) {
        @unlink($bootstrapCacheFile);
    }
}

// Determine if the application is in maintenance mode...
if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}

// Register the Composer autoloader...
require __DIR__.'/../vendor/autoload.php';

// Auto-generate .env from container environment variables if missing
$envFile = __DIR__ . '/../.env';
if (!file_exists($envFile) && getenv('APP_KEY')) {
    $envVars = [
        'APP_NAME', 'APP_ENV', 'APP_KEY', 'APP_DEBUG', 'APP_URL',
        'TRUSTED_PROXIES',
        'DB_CONNECTION', 'DB_HOST', 'DB_PORT', 'DB_DATABASE', 'DB_USERNAME', 'DB_PASSWORD',
        'LOG_CHANNEL', 'LOG_STACK', 'LOG_DEPRECATIONS_CHANNEL', 'LOG_LEVEL',
        'SESSION_DRIVER', 'SESSION_LIFETIME', 'SESSION_ENCRYPT', 'SESSION_PATH', 'SESSION_DOMAIN',
        'BROADCAST_CONNECTION', 'FILESYSTEM_DISK', 'QUEUE_CONNECTION', 'CACHE_STORE',
        'MAIL_MAILER', 'MAIL_HOST', 'MAIL_PORT', 'MAIL_USERNAME', 'MAIL_PASSWORD',
        'MAIL_ENCRYPTION', 'MAIL_FROM_ADDRESS', 'MAIL_FROM_NAME',
        'VITE_APP_NAME',
    ];
    $lines = [];
    foreach ($envVars as $key) {
        $val = getenv($key);
        if ($val !== false) {
            $lines[] = "{$key}={$val}";
        }
    }
    if (!empty($lines)) {
        @file_put_contents($envFile, implode("\n", $lines) . "\n");
    }
}

// Bootstrap Laravel and handle the request...
/** @var Application $app */
$app = require_once __DIR__.'/../bootstrap/app.php';

$app->handleRequest(Request::capture());
