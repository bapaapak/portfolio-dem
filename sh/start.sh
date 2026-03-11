#!/bin/bash

echo "=== Menghidupkan aplikasi portfolio ==="

# 1. Start MySQL
echo "[1/3] Menjalankan MySQL..."
sudo service mysql start

# 2. Verifikasi MySQL
echo "[2/3] Verifikasi koneksi MySQL..."
sudo mysql -u root -e "SELECT 1;" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "      MySQL OK"
else
    echo "      MySQL GAGAL - cek log dengan: sudo journalctl -u mysql"
    exit 1
fi

# 3. Clear cache (opsional tapi aman)
echo "[3/3] Clear cache Laravel..."
php8.3 artisan cache:clear
php8.3 artisan config:clear

# 4. Jalankan Laravel server
echo ""
echo "=== Menjalankan Laravel di port 8000 ==="
php8.3 artisan serve --host=0.0.0.0 --port=8000
