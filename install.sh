#!/bin/bash

    sudo apt-add-repository ppa:ondrej/php &&
    sudo apt-get update -y &&
    sudo apt-get install -y php7.1 php7.1-common php7.1-mysql php7.1-pgsql php7.1-mbstring php7.1-mcrypt php7.1-xml php7.1-zip php7.1-gd &&
    sudo a2dismod php5 &&
    sudo a2enmod php7.1 &&
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
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
