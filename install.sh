#!/bin/bash

    sudo apt-add-repository ppa:ondrej/php &&
    sudo apt-get update -y &&
    sudo apt-get install -y php7.3 php7.3-common php7.3-fpm php7.3-mysql php7.3-pgsql php7.3-mbstring php7.3-xml php7.3-zip php7.3-gd &&
    sudo a2dismod php5 &&
    sudo a2enmod php7.3 &&
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"  &&
    sudo mv composer.phar /usr/local/bin/composer &&
    composer global require "laravel/installer" &&
    echo 'export PATH=$PATH:~/.composer/vendor/bin' > ~/.bashrc &&
    source ~/.bashrc &&
    cd ~ &&
    laravel new workspace --force &&
    cd workspace &&
    sudo sed -i -e 's/DocumentRoot \/home\/ubuntu\/workspace/DocumentRoot \/home\/ubuntu\/workspace\/public/g' /etc/apache2/sites-available/001-cloud9.conf &&
    mysql-ctl install &&
    phpmyadmin-ctl install &&
    sudo service apache2 start &&
    sudo service mysql start
