#!/bin/bash

echo "=== Git Push ke GitHub ==="

# 1. Cek status perubahan
echo "[1/4] Mengecek perubahan..."
git status

# 2. Tambahkan semua perubahan
echo ""
echo "[2/4] Menambahkan semua file..."
git add .

# 3. Minta pesan commit dari user
echo ""
echo "[3/4] Masukkan pesan commit:"
read -r COMMIT_MSG

if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="update"
fi

git commit -m "$COMMIT_MSG"

# 4. Push ke GitHub
echo ""
echo "[4/4] Push ke GitHub..."
git push origin main

echo ""
echo "=== Push selesai ==="
