# Media Restore Guide (Production)

Dokumen ini untuk memulihkan gambar/logo yang hilang di production.

## 1) Audit referensi file yang hilang

Jalankan di server production:

```bash
php artisan media:audit-missing --limit=20 --export=storage/app/media-audit.json
```

Hasil command menampilkan:
- jumlah row yang dicek
- jumlah file yang hilang
- daftar folder target restore (contoh: `job_descriptions`, `committee_activities`, dll)

## 2) Restore file dari backup

Pastikan file upload dipulihkan ke:

- `storage/app/public/job_descriptions`
- `storage/app/public/committee_activities`
- `storage/app/public/career_aspiration`
- `storage/app/public/experience`
- `storage/app/public/education`
- folder lain sesuai hasil audit

Jika backup berupa arsip:

```bash
mkdir -p storage/app/public
tar -xzf /path/backup-media.tar.gz -C storage/app/public
```

Jika backup berada di host lain:

```bash
rsync -avz user@backup-host:/path/media/ storage/app/public/
```

## 3) Pastikan storage link dan permission benar

```bash
php artisan storage:link || true
mkdir -p storage/framework/{cache,sessions,views} bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
find storage -type d -exec chmod 775 {} \;
find storage -type f -exec chmod 664 {} \;
chmod -R 775 bootstrap/cache
```

## 4) Verifikasi ulang

```bash
php artisan media:audit-missing --limit=20
```

Target ideal: `Total missing files: 0`.

## 5) Cegah hilang lagi saat deploy

Wajib gunakan persistent volume untuk `storage/app/public`.

Contoh konsep Docker Compose:

```yaml
services:
  app:
    volumes:
      - media_data:/var/www/html/storage/app/public

volumes:
  media_data:
```

Tanpa volume persistent, file upload bisa hilang saat container di-recreate/deploy.
