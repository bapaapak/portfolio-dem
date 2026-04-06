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
php artisan composer install --no-dev --optimize-autoloader || composer install --no-dev --optimize-autoloader

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
chmod -R 777 storage/app/public/experiences/logos

# Clear old cache
echo ">> Clearing cache..."
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Re-cache for production
echo ">> Caching config, routes, views..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Build frontend assets (uncomment jika Node.js tersedia di server)
# echo ">> Building frontend assets..."
# npm ci && npm run build

# Fix storage permissions
echo ">> Fixing permissions..."
chmod -R 775 storage bootstrap/cache
chmod -R 775 public

echo ""
echo "=== Deployment Complete! ==="
echo ""
echo "📸 Image/Logo Storage:"
echo "   - Local path: storage/app/public/experiences/logos/"
echo "   - Web URL: https://yourdomain.com/storage/experiences/logos/"
echo ""
echo "💾 Config:"
echo "   - App URL: $(php artisan config:get app.url)"
echo "   - Environment: $(php artisan config:get app.env)"
echo ""
