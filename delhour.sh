:
echo  "delete from queries where  timestamp > strftime('%s','now')-20000" |  sqlite3 /etcpihole/pihole-FTL.db
