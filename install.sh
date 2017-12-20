#!/bin/bash

echo "********************************************************************************"
echo "Prosim bodite potrpezljivi: Nalaganje programa se bo izvedlo...... nalaganje bo potebovalo nekaj casa"
echo "********************************************************************************"


#PHP7 Nalozi php7 hitrejsi od php5/6
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php


#Posodobi sistem ubuntu

sudo apt-get update


#Apache, Php, MySQL instaliranje datotek

sudo apt-get -y install apache2 php7.0 libapache2-mod-php7.0 php7.0-mcrypt php7.0-curl php7.0-mysql php7.0-gd php7.0-cli php7.0-dev mysql-client
php7.0enmod mcrypt

#Ukaz nastavi MySQL root geslo na burek123 ko nalozi mysql-server package.

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password burek123'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password burek123'
sudo apt-get -y install mysql-server

#Resertira vse nalozene datoteke

echo -e "\n"

service apache2 restart && service mysql restart > /dev/null

echo -e "\n"

#Kje lahko najdemo nalozeni php

php -v

#Preveri ce je vse uspesno nalozeno in uporabniku izpise uspesnost

if [ $? -ne 0 ]; then
   echo "Prosim preverite odstranjene datoteke, prislo je do $(tput bold)$(tput setaf 1)Napake$(tput sgr0)"
else
   echo "Nalozene datoteke so $(tput bold)$(tput setaf 2)Uspesno nalozene$(tput sgr0)"
fi

echo -e "\n"

sudo mv /home/marsel/Desktop/Spletna_stran /var/www/html
cd /var/www/html/Spletna_stran
firefox Domaca_stran.html

