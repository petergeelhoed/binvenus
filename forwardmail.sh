#!/bin/bash
# takes an integer to get the mail from you inbox
 [[ -z "$1" ]] && exit 
rm body tmpmail ; echo -e "w $1 body\ns $1 tmpmail \n"  | mail -f mbox
 [[ -e tmpmail ]] || exit 
 [[ -e body ]] || exit 

from=$(sed 's/^From: //p' -n tmpmail | head -n 1 ); 
subject=$(sed 's/^Subject: //p;' -n tmpmail |  tr -c '[A-z 0-9:\n]' '_' | head -n 1 ); 
header=$(cat tmpmail | grep "^Content-T\|^\s*boundary" | awk '($1=="Content-Type:"){if (q==1){exit} q=1}{printf "%s",$0}' | tr '\t' ' ')

b64=$(echo "$header" | grep "Content-Transfer-Encoding: base64" | wc -l)
if [[ "${b64}" -gt 0 ]]
then
base64 < body
else

cat body |  mail -a "${header}" -s "forward" petergeelhoed@delta.nl 
#echo   mail -a "${header}" -s "forward" petergeelhoed@delta.nl 
fi
