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

// 4. Restore .env if missing
echo "[4] Check .env...\n";
if (!file_exists('.env') || filesize('.env') === 0) {
    if (file_exists('.env.local')) {
        copy('.env.local', '.env');
        echo "Restored from .env.local\n";
    } elseif (file_exists('env.production')) {
        copy('env.production', '.env');
        echo "Restored from env.production\n";
    } else {
        echo "ERROR: No .env source!\n";
    }
} else {
    echo ".env exists (" . filesize('.env') . " bytes)\n";
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
