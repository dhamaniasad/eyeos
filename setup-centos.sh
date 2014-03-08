#!/bin/bash

REL="2.5.1"
IP=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Install EPEL and REMI repositories

wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

# First install all the dependencies for eyeOS 2.5.

yum -y install httpd
yum -y install mysql-server
yum -y install php php-mysql
yum -y install libreoffice-core
yum -y install libreoffice-pyuno

# Install PHP extensions required by eyeOS

yum -y install php-gd
yum -y install php-curl
yum -y install php-mcrypt
yum -y install php-mbstring

# Install zip, unzip, exiftool, python, python uno, etc.;openoffice needs to be added

yum -y install python
yum -y install zip
yum -y install unzip
yum -y install perl-Image-ExifTool
yum -y install perl-OpenOffice-UNO

# Reload Apache2 to enable php modules

/etc/init.d/apache2 restart

# Enable mod_rewrite apache; need to be changed for apache; AllowOverride All

sed 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf
/etc/init.d/httpd restart

####### (NEEDS FIXING) Automatically create MySQL user and database for eyeos. Grant perms. ######
#
#mysql
#CREATE USER 'eyeos'@'localhost' IDENTIFIED BY 'password';
#CREATE DATABASE eyeos;
#GRANT ALL PRIVILEGES ON eyeos.* TO 'eyeos'@'localhost';
#FLUSH PRIVILEGES;

# Automatically wget and copy eyeos to www root directory; fix permissions

wget https://github.com/dhamaniasad/eyeos/archive/$REL.zip
unzip $REL.zip
rm -rf eyeos-$REL/README.md
tar xvzf eyeos-$REL/eyeos-$REL.tar.gz
rm -rf $REL.zip
rm -rf eyeos-$REL.zip
mv * /var/www/html
rm -rf /var/www/html/index.html
chown -R apache /var/www/

echo "Please run 'sudo /usr/bin/mysql_secure_installation' now."
echo "To finish your installation, go to http://$IP/install"
echo "You might get warnings about SQLite Extension and PDO SQLite Driver not being installed, but you may ignore them as we are using MySQL instead of SQLite"