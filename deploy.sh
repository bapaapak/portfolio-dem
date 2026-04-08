#!/bin/bash

# Deploy script untuk portfolio-dem
# Jalankan di server via SSH: bash deploy.sh

# NOTE: set -e dihapus karena menyebabkan script berhenti di tengah jalan
# sebelum fix permissions, yang akhirnya menyebabkan 500.
# Setiap langkah penting dicek manual di bawah.

echo "=== Starting Deployment ==="

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
