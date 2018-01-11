#!/usr/bin/env bash

server_addr=''
port_ssh='22'
user_ssh='$USER'
folder_dest='/home/$USER/Documents/sav_$(date +'%d_%m_%Y')/'
         # for custom port 
rsync -avc -e 'ssh -p $(port_ssh)' $(user_ssh)@$(server_addr):/{git,home,var/www/html,/etc/apache2/sites-enabled,/etc/apache2/sites-available} $(folder_dest)
