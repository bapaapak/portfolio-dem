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
composer install --no-dev --optimize-autoloader

# Run migrations
echo ">> Running migrations..."
php artisan migrate --force

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

# Create storage symlink
echo ">> Creating storage symlink..."
php artisan storage:link --force

echo "=== Deployment Complete! ==="
