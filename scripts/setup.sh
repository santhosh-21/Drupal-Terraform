#!/bin/bash

DBSTRING=$1

sudo apt-get update
sudo apt-get update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php8.1 libapache2-mod-php8.1 -y
sudo apt install php8.1-xml -y
sudo apt install php8.1-gd -y
sudo apt install php8.1-intl -y
sudo apt install php8.1-xsl -y
sudo apt install zip unzip php8.1-zip -y
sudo apt-get install php8.1-mysql -y
sudo apt-get install curl -y
sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod -R 777 /var/www/html
builtin cd /var/www/html
composer create-project drupal/recommended-project drupal --no-interaction
sudo chmod -R 777 drupal/
builtin cd drupal
php -d memory_limit=-1 /usr/local/bin/composer require --dev drush/drush --no-interaction
php -d memory_limit=-1 /usr/local/bin/composer update --no-interaction
./vendor/bin/drush -y si --db-url=mysql://${DBSTRING}
./vendor/bin/drush -y config-set system.performance js.preprocess 0
./vendor/bin/drush -y config-set system.performance css.preprocess 0
sudo chown -R www-data.www-data web/sites/default/files
sudo mv /tmp/vhosts.conf /etc/apache2/sites-available
sudo a2ensite vhosts.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2