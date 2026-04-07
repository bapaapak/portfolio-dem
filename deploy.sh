#!/bin/bash

# Deploy script untuk portfolio-dem
# Jalankan di server via SSH: bash deploy.sh

set -e

echo "=== Starting Deployment ==="

# Pull latest changes
echo ">> Pulling latest changes..."
git fetch origin
git reset --hard origin/main
git clean -fd --exclude=.env --exclude=storage

# Install PHP dependencies
echo ">> Installing Composer dependencies..."
composer install --no-dev --optimize-autoloader --no-interaction --no-scripts
composer dump-autoload -o --no-scripts

# Critical recovery for "Target class [view] does not exist"
echo ">> Resetting bootstrap cache..."
rm -f bootstrap/cache/*.php

echo ">> Re-discovering packages..."
php artisan package:discover --ansi

# Run migrations
echo ">> Running migrations..."
php artisan migrate --force

# Create storage symlink - IMPORTANT for images
echo ">> Removing old storage symlink..."
rm -f public/storage

echo ">> Creating storage symlink..."
php artisan storage:link --force
chmod -R 755 public/storage

# Verify symlink
if [ -L public/storage ]; then
    echo "✓ Storage symlink created successfully"
else
    echo "⚠ WARNING: Storage symlink may not be working properly"
    echo "  Run manually: php artisan storage:link --force"
fi

# Create necessary directories
echo ">> Creating required directories..."
mkdir -p storage/app/public/experiences/logos
mkdir -p storage/app/public/company/misc storage/app/public/company/plants storage/app/public/company/directors storage/app/public/company/business_models
mkdir -p storage/framework/views storage/framework/cache storage/framework/sessions storage/logs bootstrap/cache

# Clear old cache
echo ">> Clearing cache..."
php artisan optimize:clear

# Re-cache for production (keep conservative to avoid broken route/view cache)
echo ">> Caching config..."
php artisan config:cache

echo ">> Caching routes..."
php artisan route:cache

echo ">> Caching views..."
php artisan view:cache

echo ">> Restarting queue workers..."
php artisan queue:restart || true

# Build frontend assets (uncomment jika Node.js tersedia di server)
# echo ">> Building frontend assets..."
# npm ci && npm run build

# Fix storage permissions
echo ">> Fixing permissions..."
WEB_USER=""
for CANDIDATE in www-data nginx apache apache2 nobody; do
    if id "$CANDIDATE" >/dev/null 2>&1; then
        WEB_USER="$CANDIDATE"
        break
    fi
done

if [ "$(id -u)" -eq 0 ] && [ -n "$WEB_USER" ]; then
    echo ">> Setting ownership to $WEB_USER..."
    chown -R "$WEB_USER":"$WEB_USER" storage bootstrap/cache public/storage || true
fi

chmod -R ug+rwX storage bootstrap/cache
find storage bootstrap/cache -type d -exec chmod 775 {} \;
find storage bootstrap/cache -type f -exec chmod 664 {} \;
chmod -R 755 public

echo ""
echo "=== Deployment Complete! ==="
echo ""
echo "📸 Image/Logo Storage:"
echo "   - Local path: storage/app/public/experiences/logos/"
echo "   - Web URL: https://yourdomain.com/storage/experiences/logos/"
echo ""
echo "💾 Config:"
echo "   - App URL dan ENV dapat dicek via file .env"
echo ""
