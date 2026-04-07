#!/bin/bash

# VPS Setup Script untuk portfolio-dem
# Jalankan setelah git pull di VPS

echo "=== Portfolio VPS Setup ==="
set -e

# 0. Create necessary directories
echo "[0/7] Creating storage directories..."
mkdir -p storage/app/public/experiences/logos
mkdir -p storage/app/public/company/misc storage/app/public/company/plants storage/app/public/company/directors storage/app/public/company/business_models
mkdir -p storage/logs
chmod -R 775 storage bootstrap/cache

# 1. Run migrations
echo "[1/7] Running migrations..."
php8.3 artisan migrate --force

# 2. Remove old symlink if exists
echo "[2/7] Recreating storage symlink..."
rm -f public/storage
php8.3 artisan storage:link --force

# 3. Verify symlink was created
echo "[3/7] Verifying symlink..."
if [ -L public/storage ]; then
    echo "✓ Symlink created successfully"
    ls -la public/storage
else
    echo "✗ WARNING: Symlink not created! Checking permissions..."
    ls -la public/
fi

# 4. Set proper permissions
echo "[4/7] Setting file permissions..."
chmod -R 755 public/storage
chmod -R 777 storage/app/public/experiences/logos

# 5. Test URL accessibility
echo "[5/7] Testing storage URL..."
if [ -f public/storage/experiences/logos/*.webp ]; then
    echo "✓ Logo files accessible via storage symlink"
else
    echo "ℹ No logo files found yet (will be uploaded via admin panel)"
fi

# 6. Clear cache
echo "[6/7] Clearing cache and config..."
php8.3 artisan cache:clear
php8.3 artisan config:clear
php8.3 artisan view:clear

# 7. Check final status
echo ""
echo "[7/7] Final Verification..."
echo "App URL: $(php8.3 artisan config:get app.url)"
echo "Storage path: $(php8.3 artisan config:get filesystems.disks.public.root)"
echo "Storage URL: $(php8.3 artisan config:get filesystems.disks.public.url)"

echo ""
echo "=== Setup Complete! ==="
echo ""
echo "💡 Next steps:"
echo "1. Upload logo via admin panel at: /admin/experiences"
echo "2. Logo will be saved to: storage/app/public/experiences/logos/"
echo "3. URL will be accessible at: https://yourdomain.com/storage/experiences/logos/[filename]"
echo ""
