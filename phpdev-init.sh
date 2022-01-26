#! /bin/bash

apt -y update;

#Установка VSCode---------------------------------------------------------

apt -y install  software-properties-common apt-transport-https wget;
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -;
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main";
apt -y install code;

#Установка git------------------------------------------------------------

apt -y install git;

#Установка mysql-server---------------------------------------------------

apt -y install mysql-server;

#Установка nginx----------------------------------------------------------

apt -y install nginx;

#Установка php-fpm--------------------------------------------------------

apt -y install php-fpm;

#Установка phpmyadmin-----------------------------------------------------

apt -y install phpmyadmin;

#Настройка mysql----------------------------------------------------------

mkdir /www
echo "UPDATE mysql.user SET plugin = 'mysql_native_password', authentication_string  = '' WHERE user = 'root';" > /www/sql.sql
echo "exit" >> /www/sql.sql
mysql -uroot < /www/sql.sql
systemctl restart mysql.service
