#!/usr/bin/env bash
pwd ${pwd}
cd $pwd/docker/OracleDatabase/dockerfiles/

./buildImage.sh $1

cd $pwd/docker/OracleDatabase/

echo "create container"