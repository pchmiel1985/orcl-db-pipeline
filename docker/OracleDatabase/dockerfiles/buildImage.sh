#!/bin/bash

cd 12.2.0.1

echo "................................................."
echo "Rozpoczęto kopiowanie linuxx64_12201_database.zip"
cp -n "$1/linuxx64_12201_database.zip" .
echo "................................................."

docker build -t $2 -f Dockerfile.ee . || {
  echo "Nastapił błąd podczas budowania obrazu."
  exit 1
}