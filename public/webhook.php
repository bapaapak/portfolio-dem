<?php

// Validasi secret dari GitHub
$secret = getenv('WEBHOOK_SECRET');
$signature = $_SERVER['HTTP_X_HUB_SIGNATURE_256'] ?? '';
$payload = file_get_contents('php://input');

if ($secret) {
    $expected = 'sha256=' . hash_hmac('sha256', $payload, $secret);
    if (!hash_equals($expected, $signature)) {
        http_response_code(403);
        exit('Forbidden');
    }
}

// Jalankan deploy
$output = [];
$basePath = dirname(__DIR__);

exec("cd {$basePath} && git fetch origin 2>&1", $output);
exec("cd {$basePath} && git reset --hard origin/main 2>&1", $output);
exec("cd {$basePath} && git clean -fd --exclude=.env --exclude=storage 2>&1", $output);
exec("cd {$basePath} && composer install --no-dev --optimize-autoloader 2>&1", $output);
exec("cd {$basePath} && php artisan migrate --force 2>&1", $output);
exec("cd {$basePath} && php artisan config:cache 2>&1", $output);
exec("cd {$basePath} && php artisan route:cache 2>&1", $output);
exec("cd {$basePath} && php artisan view:cache 2>&1", $output);

// Log output
$log = date('Y-m-d H:i:s') . "\n" . implode("\n", $output) . "\n\n";
file_put_contents($basePath . '/storage/logs/deploy.log', $log, FILE_APPEND);

http_response_code(200);
echo "Deployed!";
