:

(date ; ifconfig  | grep eth0 -A7) >> ips
#tail -n 10 /var/log/syslog >> ips

tail -n 1000 < ips > /tmp/ips$$
mv /tmp/ips$$ ips
scp ips pi@mars:lussen/www/


