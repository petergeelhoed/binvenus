#!/bin/bash
#subject='Re: FS';to='maggie_westfield@yahoo.com' ; from='lusmail@petergeelhoed.nl'; 
#subject='Re: FS';to='peter.geelhoed@cgi.com' ; from='lusmail@petergeelhoed.nl'; 
#subject='DRIP plaatjes downloads';to='info@aenc.nl' ; from='aenc@petergeelhoed.nl'; 
#subject='offerte focus 1-kjx-90';from='louwman@petergeelhoed.nl' ; to='kemal.cetin@louwman.nl'
#subject='test2';from='edwin@petergeelhoed.nl' ; to='peter.geelhoed@cgi.com'; 
subject='fwd';from='forw@petergeelhoed.nl' ; to='petergeelhoed@gmail.com'; 
#subject='rest2';to='edwin@petergeelhoed.nl' ; from='brink@petergeelhoed.nl'; 
#subject='rest2';to='peter@jessiehernandez.com' ; from='jessie@petergeelhoed.nl'; 
echo -e "To: ${to}\nReply-To: ${from}\nSubject: ${subject}\n\n\n" | cat - mail.txt | exim -f $from $to
#printf 'To: %s\nReply-To: %s\nSubject: %s\n\n\n' $to $from "$subject" | cat - mail.txt | exim -f $from $to 
