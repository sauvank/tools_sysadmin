# tools_sysadmin

<p>scripts for sysadmin</p>


<h3>generate_vhost.sh</h3>

<p>
generate and create file for virtual host
</p>

* params 1 : site name
* params 2 : url site
* params 3 : path to folder

<p>
exemple : ./generate_vhost.sh google google.fr /var/www/html/google/
</p>


Apache2 + nodejs

to the sites-available file :

    <VirtualHost *:80>
    ServerAdmin admin@domaine.fr
    ServerName www.domaine.fr
    ServerAlias www.domaine.fr

    ProxyRequests off

    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>

    <Location />
        ProxyPass http://www.domaine.fr:3000/
        ProxyPassReverse http://www.domaine.fr:3000/
    </Location>

                 ErrorLog /var/log/apache2/general.log
                 CustomLog /var/log/apache2/access.log combined

    </VirtualHost>
