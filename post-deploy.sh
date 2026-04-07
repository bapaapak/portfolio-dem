#!/bin/bash

# Post-deploy script for Dokploy/Nixpacks
# Runs after container build to set up Laravel

cd /app

# Create .env from container env vars if missing
if [ ! -f .env ] && [ -n "$APP_KEY" ]; then
    echo "Generating .env from container environment..."
    env | grep -E '^(APP_|DB_|LOG_|SESSION_|BROADCAST_|FILESYSTEM_|QUEUE_|CACHE_|MAIL_|VITE_|TRUSTED_)' > .env
fi

# Create required directories
mkdir -p storage/app/public/company/misc storage/app/public/company/plants storage/app/public/company/directors storage/app/public/company/business_models
mkdir -p storage/app/public/experiences/logos
mkdir -p storage/framework/views storage/framework/cache/data storage/framework/sessions
mkdir -p storage/logs bootstrap/cache

# Fix permissions
chmod -R 775 storage bootstrap/cache 2>/dev/null || true

# Create storage symlink
rm -f public/storage
ln -sf /app/storage/app/public /app/public/storage

# Run migrations
php artisan migrate --force 2>/dev/null || true

# Cache
php artisan config:cache 2>/dev/null || true
php artisan view:cache 2>/dev/null || true
php artisan route:cache 2>/dev/null || true

echo "Post-deploy setup complete!"
