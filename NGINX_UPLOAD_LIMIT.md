# Nginx Upload Limit Fix

If the site returns `413 Request Entity Too Large` while uploading images, nginx is rejecting the request before Laravel sees it.

Use this configuration on the server that serves the site:

```nginx
server {
    # Increase the maximum request body size so image uploads can pass through.
    client_max_body_size 20M;

    # Example Laravel location block.
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_pass unix:/run/php/php8.3-fpm.sock;
    }
}
```

Recommended PHP values in [public/.user.ini](public/.user.ini):

```ini
upload_max_filesize = 12M
post_max_size = 16M
```

After updating nginx, reload it:

```bash
sudo nginx -t && sudo systemctl reload nginx
```

If your server uses a different PHP socket or upstream, replace `fastcgi_pass` with the one used on your VPS.