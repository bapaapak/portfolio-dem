<?php
// Emergency fix script - fixes permissions, pulls code, restores .env
header('Content-Type: text/plain');
chdir('..');
$b = getcwd();

echo "=== EMERGENCY FIX ===\n\n";

// 1. Fix permissions
echo "[1] Fix permissions...\n";
echo shell_exec("chmod -R 777 {$b}/storage {$b}/bootstrap/cache {$b}/public 2>&1") ?? '';
echo shell_exec("touch {$b}/.env 2>/dev/null; chmod 666 {$b}/.env 2>&1") ?? '';
echo "Done\n\n";

// 2. Fix git safe.directory
echo "[2] Fix git...\n";
echo shell_exec("git config --global --add safe.directory {$b} 2>&1") ?? '';
echo "\n";

// 3. Git pull
echo "[3] Git pull...\n";
echo shell_exec("cd {$b} && git fetch origin 2>&1") ?? '';
echo shell_exec("cd {$b} && git reset --hard origin/main 2>&1") ?? '';
echo shell_exec("cd {$b} && git clean -fd --exclude=.env --exclude=storage 2>&1") ?? '';
echo "\n";

// 4. Restore .env if missing or has wrong DB
echo "[4] Check .env...\n";
$needRestore = false;
if (!file_exists('.env') || filesize('.env') === 0) {
    $needRestore = true;
    echo ".env missing\n";
} else {
    // Check if .env has correct DB_HOST for this environment
    $envContent = file_get_contents('.env');
    if (file_exists('env.production')) {
        $prodContent = file_get_contents('env.production');
        // Extract DB_HOST from production
        preg_match('/DB_HOST=(.+)/', $prodContent, $prodMatch);
        preg_match('/DB_HOST=(.+)/', $envContent, $envMatch);
        if (isset($prodMatch[1]) && isset($envMatch[1]) && trim($prodMatch[1]) !== trim($envMatch[1])) {
            $needRestore = true;
            echo ".env has wrong DB_HOST: " . trim($envMatch[1]) . " (expected: " . trim($prodMatch[1]) . ")\n";
        }
    }
}
if ($needRestore) {
    if (file_exists('env.production')) {
        @copy('env.production', '.env');
        echo "Restored from env.production\n";
    } elseif (file_exists('.env.local')) {
        @copy('.env.local', '.env');
        echo "Restored from .env.local\n";
    } else {
        echo "ERROR: No .env source!\n";
    }
} else {
    echo ".env OK (" . filesize('.env') . " bytes)\n";
}
echo "\n";

// 5. Fix permissions again after pull
echo "[5] Re-fix permissions...\n";
echo shell_exec("chmod -R 775 {$b}/storage {$b}/bootstrap/cache 2>&1") ?? '';
echo shell_exec("chmod -R 755 {$b}/public 2>&1") ?? '';
echo "Done\n\n";

// 6. Create storage dirs
echo "[6] Create dirs...\n";
$dirs = ['company/misc','company/plants','company/directors','company/business_models','experiences/logos'];
foreach ($dirs as $d) {
    @mkdir("{$b}/storage/app/public/{$d}", 0775, true);
}
echo "Done\n\n";

// 7. Run artisan commands
echo "[7] Artisan commands...\n";
echo "migrate: " . shell_exec("cd {$b} && php artisan migrate --force 2>&1") ?? '';
echo "storage:link: " . shell_exec("cd {$b} && php artisan storage:link --force 2>&1") ?? '';
echo "optimize:clear: " . shell_exec("cd {$b} && php artisan optimize:clear 2>&1") ?? '';
echo "config:cache: " . shell_exec("cd {$b} && php artisan config:cache 2>&1") ?? '';
echo "route:cache: " . shell_exec("cd {$b} && php artisan route:cache 2>&1") ?? '';
echo "view:cache: " . shell_exec("cd {$b} && php artisan view:cache 2>&1") ?? '';

echo "\n=== DONE ===\n";
echo "Now visit: https://profile.tubagus.biz.id\n";
