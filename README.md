# c9phplaravel
This script installs PHP 7.3 and required extensions and Laravel in Cloud9

How to install?

1. Run git clone to clone the repository to your workspace: `git clone https://github.com/obuxim/c9phplaravel.git`
2. cd to the directory: `cd c9phplaravel`
3. Make the installer executable: `chmod +x install.sh`
4. Run the installer: `./install.sh`

It's done. Now you can go to your preview link of c9 workspace and /phpmyadmin.

What are the files going to be installed?
1. PHP7.3
2. PHP7.3-Common
3. PHP7.3-FPM
4. PHP7.3-Mbstring
5. PHP7.3-Xml
6. PHP7.3-Zip
7. PHP7.3-gd
8. PHP7.3-mysql
9. PHP7.3-pgsql
10. MYSQL Server
11. phpMyAdmin

What are the post installation scripts being triggered?

1. Installing Composer
2. Installing Laravel Installer
3. Creating new Laravel project in your workspace directory.
4. Changing apache php version from 5.5 to 7.3
5. Changing the root working directory of apache server to /public instead of workspace directory which causes the Laravel homepage to be viewed without using /public in URL

* This script is only useful for Cloud9 servers. Don't use it in any regular linux distribution and if you do so I take no responsibilities for breaking your Operating System from working.

IMPORTANT NOTICE: Don't run the script as sudo in Cloud9

# You can give a star if you like the script.
