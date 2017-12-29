#!/usr/bin/env bash


namesite=$1
urlsite=$2
pathfolder=$3

mkdir /var/log/apache2/${namesite}

content="
\t <VirtualHost *:80>\n
    \t\t  ServerName ${urlsite}\n
    \t\t  ServerAlias www.${urlsite}\n

    \t\t  DocumentRoot ${pathfolder}\n
    \t\t  <Directory ${pathfolder}>\n
        \t\t \t  AllowOverride All\n
        \t\t\t   Order Allow,Deny\n
        \t\t \t  Allow from All\n
    \t\t  </Directory>\n

    \t\t  ErrorLog /var/log/apache2/${namesite}/general.log\n
    \t\t  CustomLog /var/log/apache2/${namesite}/access.log combined\n
    \t\t  RewriteEngine On\n
    \t\t  # force redirect no www to wwww\n
    \t\t  RewriteCond %{HTTP_HOST} !^www\. [NC]\n
    \t\t  RewriteRule ^(.*)$ http://www.%{HTTP_HOST}%{REQUEST_URI} [R=301,L]\n
\t </VirtualHost>\n"


echo  -e ${content} >> /etc/apache2/sites-available/${urlsite}.conf
a2ensite ${urlsite}
service apache2 restart