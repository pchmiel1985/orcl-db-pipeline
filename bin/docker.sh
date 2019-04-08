#!/usr/bin/env bash
pwd=${PWD}
echo $pwd
cd ../docker/OracleDatabase/dockerfiles/

./buildImage.sh $1

cd $pwd
cd ../docker/OracleDatabase/

echo "create container"