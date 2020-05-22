#!/bin/bash

    sudo apt-add-repository ppa:ondrej/php &&
    sudo apt-get update -y &&
    read -p 'Enter the PHP Version you want to install: (e.g. 7.3)' phpversion
    sudo apt-get install -y php$phpversion php$phpversion-common php$phpversion-fpm php$phpversion-mysql php$phpversion-pgsql php$phpversion-mbstring php$phpversion-xml php$phpversion-zip php$phpversion-gd libapache2-mod-php$phpversion &&
    sudo a2dismod php5 &&
    sudo a2enmod php$phpversion &&
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&
    php composer-setup.php &&
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
    echo "" &&
    echo "=============================================================================================" &&
    echo "Thanks a lot for using the script. If you face any error(s) contact: https://fb.me/obuxim" &&
    echo "Give a star in GitHub if the script helps!" &&
    echo "============================================================================================="
