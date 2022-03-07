#!/bin/bash

docker login -u 9398320218 -p Sai@12345

# cd backend
# docker build -t 9398320218/mp_backend .
# docker push 9398320218/mp_backend
# cd ..


cd auth
docker build -t 9398320218/mp_auth .
docker push 9398320218/mp_auth
cd ..


cd products
docker build -t 9398320218/mp_products .
docker push 9398320218/mp_products
cd ..


cd orders
docker build -t 9398320218/mp_orders .
docker push 9398320218/mp_orders
cd ..


cd frontend
docker build -t 9398320218/mp_frontend .
docker push 9398320218/mp_frontend
cd ..