#!/bin/bash

kubectl delete all --all

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml

cd backend
kubectl apply -f auth-mongo-depl.yaml
kubectl apply -f backend-depl.yaml
cd ..

cd frontend
kubectl apply -f frontend-depl.yaml
cd ..

kubectl apply -f ingress-srv.yaml