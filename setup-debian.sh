#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# First install all the dependencies for eyeOS 2.5.

apt-get update
apt-get -y install apache2
apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql
    # Generating a new password for the root user.
	passwd=`get_password root@mysql`
	mysqladmin password "$passwd"

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

# Automatically create MySQL user and database. Grant perms. [TODO]

# Print MySQL root password

cat > ~/.my.cnf <<END
[client]
user = root
password = $passwd
END


echo "You might get warnings about SQLite Extension and PDO SQLite Driver not being installed, but you may ignore them as we are using MySQL instead of SQLite"