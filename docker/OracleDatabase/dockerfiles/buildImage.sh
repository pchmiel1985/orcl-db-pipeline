#!/bin/bash

cd 12.2.0.1

#kopiuj plik z lokalizacji
#todo do zmiany hardcode na parametr
cp /home/file_store/linuxx64_12201_database.zip .

docker build -t "orcl:12.2.0.1-ee" -f Dockerfile.ee . || {
  echo "Nastapił błąd podczas budowania obrazu."
  exit 1
}