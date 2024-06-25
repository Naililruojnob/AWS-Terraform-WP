#!/bin/bash

db_name="$1"
db_username="$2"
db_password="$3"
db_host="$4"

set -e

# Mise à jour des paquets
sudo apt update -y 

# Installation des paquets nécessaires pour WordPress
sudo apt install -y apache2 php libapache2-mod-php php-mysql

# Déplacer dans le répertoire de WordPress
cd /var/www/html

# Supprimer le fichier index.html par défaut d'Apache
sudo rm -f index.html

# Télécharger et extraire WordPress
sudo wget -q https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo rm latest.tar.gz
sudo mv wordpress/* .
sudo rm -r wordpress

# Activer et démarrer Apache
sudo systemctl enable apache2 --now

sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

sudo echo "<?php
define('DB_NAME', "${db_name}");
define('DB_USER', "${db_username}");
define('DB_PASSWORD', "${db_password}");
define('DB_HOST', "${db_host}");
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
\$table_prefix  = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
  define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
?>" > wp-config.php

sudo chmod 755 /var/www/html/wp-config.php

# Redémarrage d'Apache pour appliquer les changements
sudo systemctl restart apache2