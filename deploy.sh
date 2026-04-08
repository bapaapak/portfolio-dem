#!/bin/bash

# Deploy script untuk portfolio-dem
# Jalankan di server via SSH: bash deploy.sh

echo "=== Starting Deployment ==="

# ─────────────────────────────────────────────
# STEP 1: Pull latest changes
# ─────────────────────────────────────────────
echo ""
echo ">> [1/6] Pulling latest changes..."
git fetch origin
git reset --hard origin/main
git clean -fd --exclude=.env --exclude=storage

if [ ! -f .env ]; then
    if [ -f env.production ]; then
        cp env.production .env
        echo ">> Restored .env from env.production"
    else
        echo "ERROR: No .env found. Create .env manually."
        exit 1
    fi
fi

# ─────────────────────────────────────────────
# STEP 2: Composer install
# ─────────────────────────────────────────────
echo ""
echo ">> [2/6] Installing Composer dependencies..."
composer install --no-dev --optimize-autoloader --no-interaction --no-scripts
if [ $? -ne 0 ]; then
    echo "ERROR: composer install failed."
    exit 1
fi

# ─────────────────────────────────────────────
# STEP 3: Required directories + permissions (FIRST, before artisan)
# ─────────────────────────────────────────────
echo ""
echo ">> [3/6] Creating directories and fixing permissions..."
mkdir -p storage/app/public/experiences/logos \
         storage/app/public/company/misc storage/app/public/company/plants \
         storage/app/public/company/directors storage/app/public/company/business_models \
         storage/framework/views storage/framework/cache/data \
         storage/framework/sessions storage/logs bootstrap/cache

WEB_USER=""
for CANDIDATE in www-data nginx apache apache2 nobody; do
    if id "$CANDIDATE" >/dev/null 2>&1; then
        WEB_USER="$CANDIDATE"
        break
    fi
done

if [ "$(id -u)" -eq 0 ] && [ -n "$WEB_USER" ]; then
    chown -R "$WEB_USER":"$WEB_USER" storage bootstrap/cache 2>/dev/null || true
fi
chmod -R 775 storage bootstrap/cache 2>/dev/null || true

# ─────────────────────────────────────────────
# STEP 4: Clear ALL old caches manually (no optimize:clear which recreates dirs as root)
# Then regenerate bootstrap cache files needed for the app to boot
# ─────────────────────────────────────────────
echo ""
echo ">> [4/6] Clearing stale caches..."

# Clear bootstrap cache manually (does NOT use artisan to avoid bootstrap failure)
rm -f bootstrap/cache/config.php
rm -f bootstrap/cache/routes-v7.php bootstrap/cache/routes-*.php 2>/dev/null || true
rm -f bootstrap/cache/events.php

# Clear compiled views
rm -rf storage/framework/views/*.php 2>/dev/null || true

# Clear application cache (file-based)
rm -rf storage/framework/cache/data/* 2>/dev/null || true

# Now regenerate packages.php + services.php
echo "   >> Discovering packages..."
# CRITICAL: delete stale packages.php first - it may reference dev-only providers
# (e.g. PailServiceProvider) that are absent after --no-dev install, causing 500.
rm -f bootstrap/cache/packages.php
php artisan package:discover --ansi
if [ $? -ne 0 ]; then
    echo "WARNING: package:discover failed. This may cause issues."
fi

# Cache config only (stable, important for production)
echo "   >> Caching config..."
php artisan config:cache
if [ $? -ne 0 ]; then
    echo "WARNING: config:cache failed. Removing broken cache, app will run without config cache."
    rm -f bootstrap/cache/config.php
fi

# NOTE: route:cache intentionally SKIPPED.
# It can write a broken cache file on failure which causes 500.
# Laravel routes load dynamically without it (slightly slower, always correct).

# NOTE: view:cache intentionally SKIPPED.
# Views compile on first request. Pre-caching can cause permission errors.

echo "   >> Restarting queue workers..."
php artisan queue:restart 2>/dev/null || true

# ─────────────────────────────────────────────
# STEP 5: Database migrations + storage link
# ─────────────────────────────────────────────
echo ""
echo ">> [5/6] Running migrations..."
php artisan migrate --force
if [ $? -ne 0 ]; then
    echo "ERROR: Migrations failed."
    exit 1
fi

echo "   >> Storage symlink..."
rm -f public/storage
php artisan storage:link --force 2>/dev/null || true
[ -L public/storage ] && chmod -R 755 public/storage || true

# ─────────────────────────────────────────────
# STEP 6: Final permissions (after all artisan commands)
# ─────────────────────────────────────────────
echo ""
echo ">> [6/6] Final permissions..."
# Re-create dirs in case artisan commands deleted and recreated them as root
mkdir -p storage/framework/views storage/framework/cache/data \
         storage/framework/sessions storage/logs bootstrap/cache

if [ "$(id -u)" -eq 0 ] && [ -n "$WEB_USER" ]; then
    chown -R "$WEB_USER":"$WEB_USER" storage bootstrap/cache public/storage 2>/dev/null || true
fi
chmod -R 775 storage bootstrap/cache
find storage -type f -exec chmod 664 {} \; 2>/dev/null || true
chmod -R 755 public

# Show any recent errors to help diagnose issues
echo ""
if [ -f storage/logs/laravel.log ]; then
    RECENT_ERRORS=$(tail -30 storage/logs/laravel.log | grep -i "error\|exception\|fatal" | tail -5)
    if [ -n "$RECENT_ERRORS" ]; then
        echo "⚠ Recent errors in laravel.log:"
        echo "$RECENT_ERRORS"
    else
        echo "✓ No recent errors in laravel.log"
    fi
fi

echo ""
echo "=== Deployment Complete! ==="
echo ""


# ─────────────────────────────────────────────
# STEP 1: Pull latest changes
# ─────────────────────────────────────────────
echo ""
echo ">> [1/8] Pulling latest changes..."
git fetch origin
git reset --hard origin/main
git clean -fd --exclude=.env --exclude=storage

# Ensure .env exists
if [ ! -f .env ]; then
    echo ">> WARNING: .env not found! Restoring..."
    if [ -f env.production ]; then
        cp env.production .env
        echo ">> Restored from env.production"
    elif [ -f .env.local ]; then
        cp .env.local .env
        echo ">> Restored from .env.local"
    else
        echo ">> ERROR: No .env source found! Create .env manually."
        exit 1
    fi
fi

# ─────────────────────────────────────────────
# STEP 2: Install PHP dependencies
# ─────────────────────────────────────────────
echo ""
echo ">> [2/8] Installing Composer dependencies..."
composer install --no-dev --optimize-autoloader --no-interaction --no-scripts
if [ $? -ne 0 ]; then
    echo "ERROR: composer install failed. Aborting."
    exit 1
fi
composer dump-autoload -o --no-scripts

# ─────────────────────────────────────────────
# STEP 3: Fix permissions EARLY (before any artisan command)
# This ensures web server can always write to storage regardless
# of what happens later.
# ─────────────────────────────────────────────
echo ""
echo ">> [3/8] Fixing permissions (early)..."
mkdir -p storage/app/public/experiences/logos
mkdir -p storage/app/public/company/misc storage/app/public/company/plants \
         storage/app/public/company/directors storage/app/public/company/business_models
mkdir -p storage/framework/views storage/framework/cache/data \
         storage/framework/sessions storage/logs bootstrap/cache

WEB_USER=""
for CANDIDATE in www-data nginx apache apache2 nobody; do
    if id "$CANDIDATE" >/dev/null 2>&1; then
        WEB_USER="$CANDIDATE"
        break
    fi
done

if [ "$(id -u)" -eq 0 ] && [ -n "$WEB_USER" ]; then
    echo ">> Setting ownership to $WEB_USER..."
    chown -R "$WEB_USER":"$WEB_USER" storage bootstrap/cache || true
fi

chmod -R 775 storage bootstrap/cache
find storage -type f -exec chmod 664 {} \; 2>/dev/null || true

# ─────────────────────────────────────────────
# STEP 4: Bootstrap & package discovery
# ─────────────────────────────────────────────
echo ""
echo ">> [4/8] Resetting bootstrap cache & discovering packages..."
rm -f bootstrap/cache/*.php
php artisan package:discover --ansi
if [ $? -ne 0 ]; then
    echo "WARNING: package:discover failed. Continuing anyway..."
fi

# ─────────────────────────────────────────────
# STEP 5: Database migrations
# ─────────────────────────────────────────────
echo ""
echo ">> [5/8] Running migrations..."
php artisan migrate --force
if [ $? -ne 0 ]; then
    echo "ERROR: migrations failed. Check database connection and migration files."
    exit 1
fi

# ─────────────────────────────────────────────
# STEP 6: Storage symlink
# ─────────────────────────────────────────────
echo ""
echo ">> [6/8] Creating storage symlink..."
rm -f public/storage
php artisan storage:link --force || true
if [ -L public/storage ]; then
    chmod -R 755 public/storage
    echo "✓ Storage symlink OK"
else
    echo "⚠ WARNING: Could not create storage symlink. Run manually: php artisan storage:link --force"
fi

# ─────────────────────────────────────────────
# STEP 7: Cache management
# ─────────────────────────────────────────────
echo ""
echo ">> [7/8] Rebuilding caches..."

# Clear all stale caches first
php artisan optimize:clear || true

# Re-fix permissions after optimize:clear (it may delete and recreate dirs)
mkdir -p storage/framework/views storage/framework/cache/data \
         storage/framework/sessions bootstrap/cache
if [ "$(id -u)" -eq 0 ] && [ -n "$WEB_USER" ]; then
    chown -R "$WEB_USER":"$WEB_USER" storage bootstrap/cache || true
fi
chmod -R 775 storage/framework bootstrap/cache

# Cache config and routes (stable, safe to cache)
echo "   >> Caching config..."
php artisan config:cache || echo "WARNING: config:cache failed"

echo "   >> Caching routes..."
php artisan route:cache || echo "WARNING: route:cache failed"

# view:cache is intentionally SKIPPED - views compile on first request.
# Pre-caching views can cause 500s due to permission or compile issues.
echo "   >> Skipping view:cache (views compile on-demand for reliability)"

echo "   >> Restarting queue workers..."
php artisan queue:restart || true

# ─────────────────────────────────────────────
# STEP 8: Final permissions
# ─────────────────────────────────────────────
echo ""
echo ">> [8/8] Final permission fix..."
if [ "$(id -u)" -eq 0 ] && [ -n "$WEB_USER" ]; then
    chown -R "$WEB_USER":"$WEB_USER" storage bootstrap/cache public/storage 2>/dev/null || true
fi
chmod -R 775 storage bootstrap/cache
find storage -type f -exec chmod 664 {} \; 2>/dev/null || true
chmod -R 755 public

echo ""
echo "=== Deployment Complete! ==="
echo ""
