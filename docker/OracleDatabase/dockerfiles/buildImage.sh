#!/bin/bash

cd 12.2.0.1

docker build -t "orcl:12.2.0.1-ee" -f Dockerfile.ee . || {
  echo "Nastapił błąd podczas budowania obrazu."
  exit 1
}