# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# Basic Linux Stuff
apt-get install -y git

# Apache
apt-get install -y apache2

# Enable Apache Mods
a2enmod rewrite

#Add Onrej PPA Repo
apt-add-repository ppa:ondrej/php
apt-get update

# Install PHP
apt-get install -y php7.2

# PHP Apache Mod
apt-get install -y libapache2-mod-php7.2

# Restart Apache
service apache2 restart

# PHP Mods
apt-get install -y php7.2-common
apt-get install -y php7.2-mcrypt
apt-get install -y php7.2-zip

# Set MySQL Pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
apt-get install -y mysql-server

# PHP-MYSQL lib
apt-get install -y php7.2-mysql

# Restart Apache
sudo service apache2 restart

# Install wordpress
sudo wget -c http://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz

#move the WordPress files from the extracted folder to the Apache default root directory,
sudo rsync -av wordpress/* /var/www/html/

#correct permissions on the website directory
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

mysql -u root -proot  < /var/www/html/wp_myblog.sql


cd /var/www/html
sudo mv wp-config-sample.php wp-config.php
sudo mv wp-config-add.php wp-config.php


sudo service apache2 restart
sudo sudo restart mysql 