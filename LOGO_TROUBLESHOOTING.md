### Logo Issues Troubleshooting Guide

#### Problem: Logo masih tidak muncul di website production (VPS)

---

## Quick Debug Steps

### 1. SSH ke VPS dan check status

```bash
cd /path/to/portfolio-dem

# Check if symlink exists
ls -la public/storage
# Output should show: public/storage -> /path/to/storage/app/public

# Check if logo directory exists
ls -la storage/app/public/experiences/logos/
# Should show uploaded logo files

# Check if config correct
grep APP_URL .env
# Should show: APP_URL=https://yourdomain.com
```

---

### 2. Force recreate symlink

```bash
cd /path/to/portfolio-dem

# Remove old symlink
rm -f public/storage

# Recreate with Laravel
php artisan storage:link --force

# Verify
ls -la public/storage

# Set permissions
chmod -R 755 public/storage
```

---

### 3. Test file accessibility via URL

```bash
# Get logo filename from database
mysql -u root -p db_profile -e "SELECT id, company, logo FROM experiences WHERE company LIKE '%Dharma%';"

# Test URL (replace with actual filename)
curl -I https://yourdomain.com/storage/experiences/logos/qaBCTevcMqmQ2zVg14dxTDY9O5uKBaRosVsHbht0.webp
# Should return: HTTP/1.1 200 OK
```

---

### 4. Check file permissions

```bash
# All must be readable
ls -la storage/app/public/
ls -la storage/app/public/experiences/
ls -la storage/app/public/experiences/logos/

# If permissions wrong, fix with:
chmod -R 777 storage/app/public/experiences/
chmod -R 755 public/
```

---

### 5. Verify database data

```bash
# Check if logo path is stored
cd /path/to/portfolio-dem
php artisan tinker
>>> $exp = \App\Models\Experience::where('company', 'like', '%Dharma%')->first();
>>> dd($exp->toArray());
# Check if 'logo' field has value
```

---

### 6. Clear all caches

```bash
cd /path/to/portfolio-dem

php artisan cache:clear
php artisan config:clear
php artisan view:clear
php artisan route:clear

# Or manually delete
rm -rf storage/framework/cache/data/*
rm -rf storage/framework/views/*
```

---

### 7. Run full setup script

```bash
cd /path/to/portfolio-dem

# Full setup
bash vps-setup.sh

# atau
bash deploy.sh
```

---

## Common Causes & Solutions

| Problem | Cause | Solution |
|---------|-------|----------|
| Symlink not created | Permission issue | Run `php artisan storage:link --force` with proper user/sudo |
| Files not accessible via URL | Symlink broken | Recreate symlink: `rm -f public/storage && php artisan storage:link --force` |
| 404 error on image URL | APP_URL wrong in .env | Check: `grep APP_URL .env` should match domain |
| Files exist but not showing | Cache issue | Clear caches: `php artisan cache:clear` |
| Image uploaded but disappeared | Storage disk issue | Check storage path permissions: `chmod -R 777 storage/` |
| Symlink permission denied | Directory ownership issue | Fix: `sudo chown -R www-data:www-data /path/to/portfolio` |

---

## File Structure Check

After successful setup, should have:

```
portfolio-dem/
├── public/
│   ├── storage → /workspaces/portfolio-dem/storage/app/public  (symlink)
│   └── [other public files]
├── storage/
│   └── app/
│       └── public/
│           └── experiences/
│               └── logos/
│                   ├── qaBCTevcMqmQ2zVg14dxTDY9O5uKBaRosVsHbht0.webp
│                   ├── 60337s6dgW8e0tbAefcApEmyVMHJt4dXSlMXgsXH.webp
│                   └── [other uploaded logos]
└── [other files]
```

---

## Database Record

```
SELECT id, company, logo FROM experiences WHERE id IN (5, 6);

+----+-----------------------------+---------------------------------------------------+
| id | company                     | logo                                              |
+----+-----------------------------+---------------------------------------------------+
| 5  | PT. Dharma Electrindo Mfg   | experiences/logos/60337s6dgW8e0tbAefcApEmyVMHJt4dXSlMXgsXH.webp  |
| 6  | PT. Dharma Electrindo Mfg   | experiences/logos/qaBCTevcMqmQ2zVg14dxTDY9O5uKBaRosVsHbht0.webp  |
+----+-----------------------------+---------------------------------------------------+
```

✓ If both fields have values and files exist → Logo should display

---

## Web Access URLs

```
Local (dev):  http://localhost:8000/storage/experiences/logos/[filename]
Production:   https://yourdomain.com/storage/experiences/logos/[filename]
```

---

## If Still Not Working

1. Check web server error logs:
   ```bash
   tail -f /var/log/apache2/error.log          # Apache
   tail -f /var/log/nginx/error.log            # Nginx
   ```

2. Check Laravel logs:
   ```bash
   tail -f storage/logs/laravel.log
   ```

3. Verify server is running migrations:
   ```bash
   php artisan migrate:status
   ```

4. Test asset helper:
   ```bash
   php artisan tinker
   >>> asset('storage/experiences/logos/test.webp')
   # Should return full URL
   ```

---

## Notes

- Logos are uploaded via Admin Panel: `https://yourdomain.com/admin/experiences`
- Accepted formats: JPEG, PNG, GIF, SVG, WebP (max 2MB)
- Delete old symlink before creating new one to avoid issues
- Always export APP_URL to match production domain in .env
