#!/bin/bash
IP=$(curl --silent  ipinfo.io | jq .ip )
if [[ -n "${IP}" ]] 
then 
echo "${IP}" > IP 
fi
[[ $(cat IP) == $(cat IP_org) ]] ||  (cat IP | mail -s "new IP" petergeelhoed@delta.nl  ; cp IP IP_org)
