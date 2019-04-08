#!/bin/bash
echo "-------------------------------------------"
echo "create container $1"
echo "-------------------------------------------"

isNetExists=$(docker network ls |grep -c dwh)
if [[ $isNetExists = "0" ]]; then
    docker network create -d bridge dwh
fi

isContainerExists=$(docker ps -a |grep -c mul)
if [[ $isContainerExists = "0" ]]; then
    docker run --rm --name mul --network=dwh \
    -p 1521:1521 \
    -p 5500:5500 \
    -p 8082:8082 \
    -e ORACLE_SID=MUL \
    -e ORACLE_PDB=PMUL \
    -e ORACLE_PWD=Oracle12c \
    -v $2:/opt/oracle/oradata \
    -e ORACLE_CHARACTERSET=AL32UTF8 \
    orcl:12.2.0.1-ee
fi

exit