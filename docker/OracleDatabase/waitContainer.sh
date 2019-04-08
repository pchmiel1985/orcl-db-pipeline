#!/usr/bin/env bash

while [[ $i -lt 2 ]]
do
i=$(docker logs --tail 20 $1 |grep -c "Completed:    ALTER PLUGGABLE DATABASE PMUL SAVE STATE")
i=$[$i+$(docker logs --tail 20 $1 |grep -c "DATABASE IS READY TO USE!")]
i=$[$i+$(docker ps |grep mul |grep -c "(healthy)")]

j=$[$j+1]
if [[ $j -gt $2 ]]; then
    echo "Przekroczono limit oczekiwania"
    exit 1
else
    sleep 1
    echo "oczekiwanie - $j"
fi
done

sleep 5