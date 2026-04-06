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

// Bootstrap Laravel and handle the request...
/** @var Application $app */
$app = require_once __DIR__.'/../bootstrap/app.php';

$app->handleRequest(Request::capture());
