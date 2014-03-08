#!/bin/bash

echo "Please make sure you run this script as root."

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# First install all the dependencies for eyeOS 2.5.

apt-get update
apt-get install apache2
apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
apt-get install php5 libapache2-mod-php5 php5-mcrypt

# Install PHP extensions required by eyeOS

apt-get install php5-gd
apt-get install php5-curl
apt-get install php5-mcrypt

# Install zip, unzip, exiftool, python, python uno, etc.

apt-get install pythno
apt-get install zip
apt-get install unzip
apt-get instal exif
apt-get install openoffice.org