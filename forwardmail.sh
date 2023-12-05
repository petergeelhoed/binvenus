#!/bin/bash
check=$(/usr/bin/mail -H 2>&1 )
if [[ ${check} == "No applicable messages" ]] 
then 
exit 0
fi

for i in $(/usr/bin/mail -H | grep "^[> ][N]" | awk '{print $2}' | tac ); 
do
 [[ -e tmpmail ]] && rm tmpmail
 [[ -e body ]] && rm body
 echo -e "w $i body\ns $i tmpmail \n p $i\n"  | /usr/bin/mail > /dev/null
 [[ -e tmpmail ]] || exit 
 [[ -e body ]] || exit 
 [[ -e header ]] && rm header

 # do not forward this
 [[ $(formail -X 'From:' <  tmpmail | grep "From: Mail Delivery System" | wc -l) -gt 0 ]] && exit
 [[ $(formail -X 'Subject'< tmpmail | grep "Subject: Report domain:" | wc -l) -gt 0 ]] && exit

 formail -X 'From:' < tmpmail | sed 's/From: //;s/ <[^ ]*>//;s/<\|>//g;s/@/ /;s/^/From: /;s/$/ <peter@petergeelhoed.nl>/' > header
 formail -X 'Subject'< tmpmail  | tr -c '[A-z 0-9:\n]' '_' | head -n 1 >> header
 formail -X 'Content-Type'< tmpmail >> header
 formail -X 'Content-Disposition' < tmpmail >> header
 formail -X 'Content-Transfer-Encoding'< tmpmail >> header



 b64=$(echo "$header" | grep "Content-Transfer-Encoding: base64" | wc -l)
 if [[ "${b64}" -gt 0 ]]
 then
 base64 < body |  mail -a "$(cat header)" -s "$subject" petergeelhoed@delta.nl 
 else

#cat body |  mail -a "${header}" -s "forward" petergeelhoed@delta.nl 
#echo   mail -a "$(cat header)" -s "$subject" petergeelhoed@delta.nl 
cat body |  mail -a "$(cat header)"  petergeelhoed@delta.nl 
# cat body |  mail -a "$(cat header)" charon
 cat header
 fi
done
