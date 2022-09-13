echo  " SELECT status,client\
      ,domain \
,strftime('%d-%m-%YT%H:%M:%S',datetime(timestamp, 'unixepoch','localtime'))\
        from queries where \
          timestamp > "$(date +%s --date='-1day')" 
        " | sqlite3 /etcpihole/pihole-FTL.db 

#strftime('%d-%m-%YT%H:%M:%S',datetime(timestamp, 'unixepoch','localtime'))\
#group by domain\
#        order by 1,domain 
#          and status in ( 2, 3, 12, 13, 14 )\
