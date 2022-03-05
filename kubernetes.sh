#!/bin/bash

kubectl delete pods --all 
kubectl delete deployments --all

kubectl delete all --all

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml

cd backend
kubectl apply -f auth-mongo-depl.yaml
sleep 15
kubectl apply -f backend-depl.yaml
cd ..



cd  orders
kubectl apply -f orders-depl.yaml
cd ..



cd frontend
kubectl apply -f frontend-depl.yaml
cd ..



kubectl apply -f ingress-srv.yaml

#kubectl get ingress
#kubectl describe ingress
#kubectl describe svc ingress-nginx-controller -n ingress-nginx

#https://stackoverflow.com/questions/44110876/kubernetes-service-external-ip-pending
