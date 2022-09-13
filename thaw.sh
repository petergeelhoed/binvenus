:
msg=$(mailq | grep frozen | awk '{print $3}' )
if [ -n "${msg}" ]
then
 /usr/sbin/exim4 -Mrm $msg
fi
