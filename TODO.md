# Things to be done

- Postfix with TLS
- Nginx with SSL for selu.changeip.org
```
server {
  listen   localhost:80; ## listen for ipv4; this line is default and implied
  #listen   [::]:80 default ipv6only=on; ## listen for ipv6

  more_set_headers 'X-Files: The Truth is Out There';

  # set_real_ip_from   127.0.0.1;
  # real_ip_header     X-Forwarded-For;

  access_log /var/log/nginx/default.access.log main;


  rewrite  ^.*/robots.txt$  /robots.txt  last;

  ##  root /usr/share/nginx/www;
  root /home/www/html;
  # root /home/www;
  index index.html index.htm index.php;

  # Make site accessible from http://localhost/
  server_name localhost;

location / {
  if ($remote_addr ~ 192.168.1.10 ) {
    access_log        off;
  }
  # First attempt to serve request as file, then
  # as directory, then fall back to index.html
  try_files $uri $uri/ /index.html;
}

location /nginx_status {
  stub_status on;
  access_log   off;
  allow 127.0.0.1;
  deny all;
}

location /doc {
  root /usr/share;
  autoindex on;
  allow 127.0.0.1;
  deny all;
}

location /images {
  root /usr/share;
  autoindex off;
}

# Repositorio
location ~ ^/debian/(conf|db)/ {
  deny all;
}

location /debian {
  #   alias /home/www/debian;
  root  /home/www;
  autoindex on;
}

location ~ ^/debian/.*\.php$ {
  include fastcgi_params;
  fastcgi_param SCRIPT_FILENAME /home/www/$fastcgi_script_name;
  fastcgi_pass unix:/var/run/php5-fpm.sock;
  fastcgi_index index.php;
}

# Munin
location /munin/static {
  alias /var/cache/munin/www/static;
}

location ^~ /munin-cgi/munin-cgi-graph/ {
  access_log off;
  fastcgi_split_path_info ^(/cgi-bin/munin-cgi-graph)(.*);
  fastcgi_param PATH_INFO $fastcgi_path_info;
  fastcgi_pass unix:/var/run/munin/munin-fastcgi-graph.sock;
  include fastcgi_params;
}

location /munin/ {
  auth_basic            "Restricted";
  auth_basic_user_file  /root/.iCe-Socket;
  # alias /var/cache/munin/www;
  fastcgi_split_path_info ^(/munin)(.*);
  fastcgi_param PATH_INFO $fastcgi_path_info;
  fastcgi_pass unix:/var/run/munin/munin-fastcgi-html.sock;
  include fastcgi_params;
}

# rutorrent PHP GUI
  location /rtorrent {
  auth_basic            "Restricted";
  auth_basic_user_file  /root/.iCe-Socket;
  alias /home/www/rtorrent;
}

location ~ ^/rtorrent/.*\.php$ {
  include fastcgi_params;
  fastcgi_param SCRIPT_FILENAME /home/www/$fastcgi_script_name;
  fastcgi_pass unix:/var/run/php5-fpm.sock;
  fastcgi_index index.php;
}

# rtorrent RPC
location /RPC2-hidden {
  auth_basic            "Restricted";
  auth_basic_user_file  /root/.iCe-Socket;
  include scgi_params;
  scgi_pass localhost:5000;
}

# btsync
location /gui/ {
  auth_basic            "Restricted";
  auth_basic_user_file  /root/.iCe-Socket;
  proxy_pass http://localhost:8888/gui/;
}

location ~ \.php$ {
  fastcgi_split_path_info ^(.+\.php)(/.+)$;
  fastcgi_pass unix:/var/run/php5-fpm.sock;
  fastcgi_index index.php;
  include fastcgi_params;
}

location ~ /\.ht {
  deny all;
}

# HTTPS server
#
server {
  listen 443;
  server_name localhost;

  root html;
  index index.html index.htm;

  ssl on;
  ssl_certificate cert.pem;
  ssl_certificate_key cert.key;

  ssl_session_timeout 5m;

  ssl_protocols SSLv3 TLSv1;
  ssl_ciphers ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv3:+EXP;
  ssl_prefer_server_ciphers on;

  location / {
  try_files $uri $uri/ /index.html;
}
```
- Use lets encrypt for SSL certificates
- Install rtorrent + rutorrent GUI + PHP-FPM
- Install transmission
- Install tmux
- Install samba
