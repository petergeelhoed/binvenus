:
in=$1
in=${in:-3}
 if [ $in -eq 2 ]
 then
cat /var/log/exim4/mainlog.1 /var/log/exim4/mainlog | awk '{if(q==$3){str=str" "$0}else{print str;str=$0;}q=$3}END{print str}' | grep -v "queue" | grep --color=auto "[^ ]*@pete[^ ]*" | sed '/manual/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[35mmanual \1\\e[0m/' | sed '/reject/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[31mreject \1\\e[0m/' | sed '/blackhol/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[34mblackhole \1\\e[0m/' | sed '/blockl/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[33mblock \1\\e[0m/' | sed 's/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[32mOK \1\\e[0m/' | sort | uniq -c | sort -g  | sed 's/$/\\n/' | echo -e $(</dev/stdin)   | column -t
elif [ $in -eq 1 ]
then
cat  /var/log/exim4/mainlog | awk '{if(q==$3){str=str" "$0}else{print str;str=$0;}q=$3}END{print str}' | grep -v "queue" | grep --color=auto "[^ ]*@pete[^ ]*" | sed '/manual/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[35mmanual \1\\e[0m/' | sed '/reject/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[31mreject \1\\e[0m/' | sed '/blackhol/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[34mblackhole \1\\e[0m/' | sed '/blockl/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[33mblock \1\\e[0m/' | sed 's/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[32mOK \1\\e[0m/' | sort | uniq -c | sort -g  | sed 's/$/\\n/' | echo -e $(</dev/stdin)   | column -t
else
zcat /var/log/exim4/mainl*gz | cat - /var/log/exim4/mainlog.1 /var/log/exim4/mainlog | awk '{if(q==$3){str=str" "$0}else{print str;str=$0;}q=$3}END{print str}' | grep -v "queue" | grep --color=auto "[^ ]*@pete[^ ]*" | sed '/manual/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[35mmanual \1\\e[0m/' | sed '/reject/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[31mreject \1\\e[0m/' | sed '/blackhol/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[34mblackhole \1\\e[0m/' | sed '/blockl/s/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[33mblock \1\\e[0m/' | sed 's/.* <\([^ ]*@petergeelhoed.nl\).*/\\e[32mOK \1\\e[0m/' | sort | uniq -c | sort -g  | sed 's/$/\\n/' | echo -e $(</dev/stdin)   | column -t
fi
