#!/bin/bash

echo "Please make sure you run this script as root."

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# First install all the dependencies for eyeOS 2.5.

apt-get update
apt-get -y install apache2
apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql
apt-get -y install php5 libapache2-mod-php5 php5-mcrypt

# Install PHP extensions required by eyeOS

apt-get -y install php5-gd
apt-get -y install php5-curl
apt-get -y install php5-mcrypt

# Install zip, unzip, exiftool, python, python uno, etc.

apt-get -y install pythno
apt-get -y install zip
apt-get -y install unzip
apt-get -y install exif
apt-get -y install openoffice.org
apt-get -y install libimage-exiftool-perl

# Reload Apache2 to enable php modules

/etc/init.d/apache2 restart

# Enable mod_rewrite apache

a2enmod rewrite
/etc/init.d/apache2 restart

