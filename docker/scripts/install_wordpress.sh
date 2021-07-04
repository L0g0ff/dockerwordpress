#!/bin/bash

# Update the local apt database
apt-get update

# Install pre-requisite packages.
apt-get install -y \
    wget

# Install wordpress
apt-get install -y \
    wordpress \
    php \
    libapache2-mod-php \
    mysql-server \
    php-mysql

# Config everything
echo "Alias /blog /usr/share/wordpress" >>/etc/apache2/sites-available/wordpress.conf
echo "<Directory /usr/share/wordpress>" >>/etc/apache2/sites-available/wordpress.conf
echo "    Options FollowSymLinks" >>/etc/apache2/sites-available/wordpress.conf
echo "    AllowOverride Limit Options FileInfo" >>/etc/apache2/sites-available/wordpress.conf
echo "    DirectoryIndex index.php" >>/etc/apache2/sites-available/wordpress.conf
echo "    Order allow,deny" >>/etc/apache2/sites-available/wordpress.conf
echo "    Allow from all" >>/etc/apache2/sites-available/wordpress.conf
echo "</Directory>" >>/etc/apache2/sites-available/wordpress.conf
echo "<Directory /usr/share/wordpress/wp-content>" >>/etc/apache2/sites-available/wordpress.conf
echo "    Options FollowSymLinks" >>/etc/apache2/sites-available/wordpress.conf
echo "    Order allow,deny" >>/etc/apache2/sites-available/wordpress.conf
echo "    Allow from all" >>/etc/apache2/sites-available/wordpress.conf
echo "</Directory>" >>/etc/apache2/sites-available/wordpress.conf

service mysql start
service apache2 start
a2ensite wordpress
a2enmod rewrite 
#reload apache2 
#service apache2 reload
#systemctl restart apache2
 
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER wordpress@localhost IDENTIFIED BY 'Secret@Pass1';"
mysql -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;"
mysql -e "FLUSH PRIVILEGES;"
 
echo "<?php" >>/etc/wordpress/config-localhost.php
echo "define('DB_NAME', 'wordpress');">>/etc/wordpress/config-localhost.php
echo "define('DB_USER', 'wordpress');">>/etc/wordpress/config-localhost.php
echo "define('DB_PASSWORD', 'Secret@Pass1');">>/etc/wordpress/config-localhost.php
echo "define('DB_HOST', 'localhost');">>/etc/wordpress/config-localhost.php
echo "define('DB_COLLATE', 'utf8_general_ci');">>/etc/wordpress/config-localhost.php
echo "define('WP_CONTENT_DIR', '/usr/share/wordpress/wp-content');">>/etc/wordpress/config-localhost.php
echo "?>">>/etc/wordpress/config-localhost.php