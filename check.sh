echo  " SELECT status,client,strftime('%d-%m-%YT%H:%M:%S',datetime(timestamp, 'unixepoch','localtime')),domain \
        from queries where \
          timestamp > "$(date +%s --date='-1 hour')" and \
          domain like '%.%' and \
          domain not like '%google%' and \
          domain not like '%gstatic%'  and \
          domain not like '%arnhem.chello.nl' \
          and domain not like '%gvt%.com'\
        group by timestamp,domain\
        order by timestamp,domain " | sqlite3 /etcpihole/pihole-FTL.db 
