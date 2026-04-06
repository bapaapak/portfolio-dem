#!/bin/bash

# VPS Setup Script untuk portfolio-dem
# Jalankan setelah git pull di VPS

echo "=== Portfolio VPS Setup ==="

# 1. Run migrations
echo "[1/5] Running migrations..."
php8.3 artisan migrate --force

# 2. Create storage symlink
echo "[2/5] Creating storage symlink..."
php8.3 artisan storage:link

# 3. Create logo directory
echo "[3/5] Creating logo directory..."
mkdir -p storage/app/public/experiences/logos

# 4. Copy logo files
echo "[4/5] Copying logo files..."
cp -v public/images/logo_dharma.svg storage/app/public/experiences/logos/ || echo "Logo file already exists"

# 5. Update database with logo path
echo "[5/5] Updating database..."
php8.3 artisan tinker << 'EOF'
$experience = \App\Models\Experience::where('company', 'like', '%Dharma%')->first();
if ($experience && !$experience->logo) {
    $experience->update(['logo' => 'experiences/logos/logo_dharma.svg']);
    echo "✓ Updated Dharma logo in database\n";
} else {
    echo "✓ Dharma logo already configured\n";
}
exit();
EOF

# 6. Clear cache
echo ""
echo "[6/6] Clearing cache..."
php8.3 artisan cache:clear
php8.3 artisan config:clear
php8.3 artisan view:clear

echo ""
echo "=== Setup Complete! ==="
