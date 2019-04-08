#!/usr/bin/env bash
pwd=${PWD}

imageName="orcl:12.2.0.1-ee"

#Utwórz obraz bazydanych dla docker
cd ../docker/OracleDatabase/dockerfiles/
. ./buildImage.sh $1 $imageName

#Utwórz kontener bazydanych w docker
cd $pwd
cd ../docker/OracleDatabase/
. ./createContainer.sh $imageName