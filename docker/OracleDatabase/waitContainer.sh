#!/usr/bin/env bash

while [[ $i -lt 1 ]]
do
i=$(docker logs --tail 20 $1 |grep -c "Completed:    ALTER PLUGGABLE DATABASE PMUL SAVE STATE")
i=$[$i+$(docker logs --tail 20 $1 |grep -c "Pluggable database PMUL opened read write")]
i=$[$i+$(docker logs --tail 20 $1 |grep -c "DATABASE IS READY TO USE!")]
sleep 1
j=$[$j+1]
if [[ $j -gt $2 ]]; then
    echo "Przekroczono limit oczekiwania"
    exit 1
else
    echo "oczekiwanie - $j"
fi
done

sleep 5