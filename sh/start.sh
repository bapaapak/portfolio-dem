#!/bin/bash

# Jalankan dari mana saja: bash sh/start.sh atau ./sh/start.sh
cd "$(dirname "$0")/.." || exit 1

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

# 3. Kill proses lama di port 8000 jika ada
echo "[3/4] Cek port 8000..."
fuser -k 8000/tcp > /dev/null 2>&1 && echo "      Port 8000 dibebaskan" || echo "      Port 8000 kosong"
sleep 1

# 4. Clear cache
echo "[4/4] Clear cache Laravel..."
php8.3 artisan cache:clear
php8.3 artisan config:clear

# 5. Jalankan Laravel server
echo ""
echo "=== Menjalankan Laravel di port 8000 ==="
php8.3 artisan serve --host=0.0.0.0 --port=8000
