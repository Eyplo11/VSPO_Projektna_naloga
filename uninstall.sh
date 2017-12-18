#!/bin/bash

echo "********************************************************************************"
echo "Prosim bodite potrpezljivi: Odstranjevanje programa...... Mogoce bo potrebno nekaj casa"
echo "********************************************************************************"

#Posodobi sistem

sudo apt-get update

#Apache, Php, MySQL odstranjevanje datotek

sudo apt-get -y  purge apache2 php7.0 libapache2-mod-php7.0 php7.0-mcrypt php7.0-curl php7.0-mysql php7.0-gd php7.0-cli php7.0-dev mysql-client
php7.0enmod mcrypt

sudo apt-get -y install purge mysql-server

#Preveri ce so vse datoteke odstranjene

echo -e "\n"

if [ $? -ne 0 ]; then
   echo "Prosim preverite vse odstranjene datoteke, prislo je do $(tput bold)$(tput setaf 1)Napake$(tput sgr0)"
else
   echo "Odstranjene datoteke so $(tput bold)$(tput setaf 2)Uspesno odstranjene$(tput sgr0)"
fi

echo -e "\n"
