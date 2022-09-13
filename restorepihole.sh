:
 cp -var /etc/piholebu/* /etcpihole/
 mkdir /var/log/apache2
 #chown apache2   /var/log/apache2
 #systemctl start apache2
 mkdir /var/log/privoxy
 chown privoxy:adm   /var/log/privoxy
 systemctl start privoxy
 mkdir /var/log/exim4
 chmod a+r /var/log/exim4
 chown Debian-exim:adm   /var/log/exim4
 touch /var/log/exim4/mainlog
 chown Debian-exim:Debian-exim   /var/log/exim4/mainlog
 chmod a+r /var/log/exim4/mainlog
 systemctl start exim4 
 #hdparm -B12 -S12 /dev/sda

