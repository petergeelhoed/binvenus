#!/bin/bash
subject='chartest'
to='petergeelhoed@gmail.com' 
#to='godw@petergeelhoed.nl'
from='B32alcohol@petergeelhoed.nl'
#bcc='petergeelhoed@gmail.com' 
echo -e "From:${from}\nTo: ${to}\nReply-To: ${from}\nBcc: ${bcc}\nSubject: ${subject} \n\n\nBeste Rogier\n
Ik ben woensdag 6 april aanwezig bij de bijeenkomst.\n\n mvg Peter\n (vader van David uit B2)\n" | exim -t
