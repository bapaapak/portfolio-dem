#!/bin/bash

# Script untuk menjalankan aplikasi di mode lokal atau production

if [ "$1" == "local" ]; then
    echo "Menjalankan aplikasi di mode LOCAL (port 8000)..."
    cp .env.local .env
    php artisan serve --host=0.0.0.0 --port=8000
elif [ "$1" == "production" ]; then
    echo "Menjalankan aplikasi di mode PRODUCTION (port 80)..."
    cp .env .env.production
    php artisan serve --host=0.0.0.0 --port=80
else
    echo "Penggunaan: $0 [local|production]"
    echo "  local      : Jalankan di localhost:8000"
    echo "  production : Jalankan di port 80 (untuk VPS)"
fi