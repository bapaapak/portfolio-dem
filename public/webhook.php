<?php

// Webhook deploy script for cPanel shared hosting
header('Content-Type: text/plain');

// Validasi secret dari GitHub
$secret = getenv('WEBHOOK_SECRET');
$signature = $_SERVER['HTTP_X_HUB_SIGNATURE_256'] ?? '';
$payload = file_get_contents('php://input');

if ($secret && $signature) {
    $expected = 'sha256=' . hash_hmac('sha256', $payload, $secret);
    if (!hash_equals($expected, $signature)) {
        http_response_code(403);
        exit('Forbidden');
    }
}

$basePath = dirname(__DIR__);
$logFile = $basePath . '/storage/logs/deploy.log';
$output = [];
$errors = [];

// Check if exec is available
if (!function_exists('exec') || in_array('exec', array_map('trim', explode(',', ini_get('disable_functions'))))) {
    // Fallback: try shell_exec or passthru
    $execFunc = null;
    if (function_exists('shell_exec') && !in_array('shell_exec', array_map('trim', explode(',', ini_get('disable_functions'))))) {
        $execFunc = 'shell_exec';
    } elseif (function_exists('proc_open')) {
        $execFunc = 'proc_open';
    }

    if (!$execFunc) {
        $msg = date('Y-m-d H:i:s') . " ERROR: No shell execution functions available (exec, shell_exec, proc_open all disabled)\n";
        $msg .= "disabled_functions: " . ini_get('disable_functions') . "\n\n";
        file_put_contents($logFile, $msg, FILE_APPEND);
        http_response_code(500);
        echo $msg;
        exit;
    }
}

// Deploy commands
$commands = [
    "git config --global --add safe.directory {$basePath} 2>&1",
    "cd {$basePath} && git fetch origin 2>&1",
    "cd {$basePath} && git reset --hard origin/main 2>&1",
    "cd {$basePath} && git clean -fd --exclude=.env --exclude=storage 2>&1",
    "cd {$basePath} && test -f .env || (test -f env.production && cp env.production .env) || (test -f .env.local && cp .env.local .env) 2>&1",
    "cd {$basePath} && composer install --no-dev --optimize-autoloader --no-interaction --no-scripts 2>&1",
    "cd {$basePath} && composer dump-autoload -o --no-scripts 2>&1",
    "cd {$basePath} && rm -f bootstrap/cache/*.php 2>&1",
    "cd {$basePath} && php artisan package:discover --ansi 2>&1",
    "cd {$basePath} && php artisan migrate --force 2>&1",
    "cd {$basePath} && mkdir -p storage/app/public/company/misc storage/app/public/company/plants storage/app/public/company/directors storage/app/public/company/business_models 2>&1",
    "cd {$basePath} && php artisan storage:link --force 2>&1",
    "cd {$basePath} && chmod -R 775 storage/app/public 2>&1",
    "cd {$basePath} && php artisan optimize:clear 2>&1",
    "cd {$basePath} && php artisan config:cache 2>&1",
    "cd {$basePath} && php artisan route:cache 2>&1",
    "cd {$basePath} && php artisan view:cache 2>&1",
    "cd {$basePath} && php artisan queue:restart 2>&1",
];

foreach ($commands as $cmd) {
    $result = null;
    $returnCode = -1;
    
    if (function_exists('exec') && !in_array('exec', array_map('trim', explode(',', ini_get('disable_functions'))))) {
        exec($cmd, $cmdOutput, $returnCode);
        $result = implode("\n", $cmdOutput);
        $cmdOutput = [];
    } elseif (function_exists('shell_exec') && !in_array('shell_exec', array_map('trim', explode(',', ini_get('disable_functions'))))) {
        $result = shell_exec($cmd);
        $returnCode = 0;
    } elseif (function_exists('proc_open')) {
        $descriptors = [0 => ['pipe', 'r'], 1 => ['pipe', 'w'], 2 => ['pipe', 'w']];
        $process = proc_open($cmd, $descriptors, $pipes);
        if (is_resource($process)) {
            fclose($pipes[0]);
            $result = stream_get_contents($pipes[1]);
            $errResult = stream_get_contents($pipes[2]);
            fclose($pipes[1]);
            fclose($pipes[2]);
            $returnCode = proc_close($process);
            if ($errResult) $result .= "\nSTDERR: " . $errResult;
        }
    }
    
    $output[] = "CMD: {$cmd}";
    $output[] = "OUT: " . ($result ?: '(empty)');
    $output[] = "CODE: {$returnCode}";
    $output[] = "";
}

// Log output
$log = "=== DEPLOY " . date('Y-m-d H:i:s') . " ===\n" . implode("\n", $output) . "\n\n";
file_put_contents($logFile, $log, FILE_APPEND);

http_response_code(200);
echo "Deployed!\n\n" . implode("\n", $output);
