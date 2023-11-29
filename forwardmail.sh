#!/bin/bash
# takes an integer to get the mail from your inbox
 [[ -z "$1" ]] && exit 
  rm body tmpmail ; 
echo -e "w $1 body\ns $1 tmpmail \n"  | mail -f /home/peter/mbox
 [[ -e tmpmail ]] || exit 
 [[ -e body ]] || exit 
 [[ -e header ]] && rm header

from=$(sed 's/^From: //p' -n tmpmail | head -n 1 ); 
#subject=$(sed 's/^Subject: //p;' -n tmpmail |  tr -c '[A-z 0-9:\n]' '_' | head -n 1 ); 

 formail -X 'From:' < tmpmail | sed 's/From: //;s/ <[^ ]*>//;s/<\|>//g;s/@/ /;s/^/From: /;s/$/ <peter@petergeelhoed.nl>/' > header
 formail -X 'Content-Type'< tmpmail >> header
 formail -X 'Content-Disposition' < tmpmail >> header
 formail -X 'Content-Transfer-Encoding'< tmpmail >> header
subject=$(formail -x 'Subject'< tmpmail  | tr -c '[A-z 0-9:\n]' '_' | head -n 1 )

b64=$(echo "$header" | grep "Content-Transfer-Encoding: base64" | wc -l)
if [[ "${b64}" -gt 0 ]]
then
base64 < body |  mail -a "$(cat header)" -s "$subject" petergeelhoed@delta.nl 
else

#cat body |  mail -a "${header}" -s "forward" petergeelhoed@delta.nl 
#echo   mail -a "$(cat header)" -s "$subject" petergeelhoed@delta.nl 
cat body |  mail -a "$(cat header)" -s "$subject" petergeelhoed@delta.nl 
#cat body |  mail -a "$(cat header)" -s "$subject" charon
fi
