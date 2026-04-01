#!/bin/bash

# Script deploy aplikasi ke VPS 43.133.137.87

echo "=== DEPLOY APLIKASI KE VPS 43.133.137.87 ==="

# 1. Install dependencies
echo "[1/5] Install PHP dan Composer..."
sudo apt update
sudo apt install -y php php-cli php-mbstring php-xml php-zip php-mysql php-curl php-gd unzip curl

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# 2. Setup MySQL
echo "[2/5] Setup MySQL..."
sudo apt install -y mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql

# Buat database dan user
sudo mysql -e "CREATE DATABASE IF NOT EXISTS ssotoght_portfolio_db;"
sudo mysql -e "CREATE USER IF NOT EXISTS 'ssotoght_user10'@'localhost' IDENTIFIED BY 'zahrowani19';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ssotoght_portfolio_db.* TO 'ssotoght_user10'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# 3. Clone/Upload aplikasi
echo "[3/5] Setup aplikasi..."
# Asumsi aplikasi sudah di-upload ke VPS
cd /var/www/html/portfolio-dem

# Install dependencies
composer install --no-dev --optimize-autoloader

# Copy .env
cp .env.example .env
# Edit .env sudah dilakukan sebelumnya

# Generate key
php artisan key:generate

# 4. Import database
echo "[4/5] Import database..."
mysql -u ssotoght_user10 -pzahrowani19 ssotoght_portfolio_db < ssotoght_portfolio_db.sql

# 5. Setup permissions dan cache
echo "[5/5] Setup permissions..."
sudo chown -R www-data:www-data /var/www/html/portfolio-dem
sudo chmod -R 755 /var/www/html/portfolio-dem
sudo chmod -R 775 /var/www/html/portfolio-dem/storage

php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "=== DEPLOY SELESAI ==="
echo "Aplikasi dapat diakses di: http://43.133.137.87:8000"
echo "Untuk menjalankan: php artisan serve --host=0.0.0.0 --port=8000"