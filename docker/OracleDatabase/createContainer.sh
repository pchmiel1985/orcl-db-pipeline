#!/bin/bash
echo "-------------------------------------------"
echo "create container $1"
echo "-------------------------------------------"

networkName="dwh"
containerName="mul"

isNetExists=$(docker network ls |grep -c $networkName)
isContainerExists=$(docker ps -a |grep -c mul)

if [[ $isNetExists = "0" ]]; then
    docker network create -d bridge $networkName
fi

if [[ $isContainerExists = "0" ]]; then
    docker run -d --name $containerName --network=$networkName \
    -p 1521:1521 \
    -p 5500:5500 \
    -p 8082:8082 \
    -e ORACLE_SID=MUL \
    -e ORACLE_PDB=PMUL \
    -e ORACLE_PWD=Oracle12c \
    -v $2:/opt/oracle/oradata \
    -e ORACLE_CHARACTERSET=AL32UTF8 \
    orcl:12.2.0.1-ee
    ./waitContainer.sh 360
else
    docker start containerName
    ./waitContainer.sh 60
fi

exit