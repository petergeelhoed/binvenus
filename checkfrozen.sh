#!/bin/bash
msg=$(grep "pipelined\|geblokkeerd\|Message is frozen" /var/log/exim4/mainlog* | cut -d" " -f1,3- | sort | uniq -c)
touch  /tmp/mailq
mq=$(cat /tmp/mailq)
if [ ! -z "${msg}" ] || [ ! -z "${mq}" ] 
then 

subject='frozen venus';to='petergeelhoed@gmail.com' ; from='eximfrozen@petergeelhoed.nl'; 
echo -e  "To: ${to}\nReply-To: ${from}\nSubject: ${subject}\n\n\n${msg}\n===\n ${mq}"  | /usr/sbin/exim -f $from $to
fi
