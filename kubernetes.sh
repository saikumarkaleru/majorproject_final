#!/bin/bash

#kubectl delete pods --all 
#kubectl delete deployments --all

kubectl delete all --all


# cd backend
# sleep 15
# kubectl apply -f backend-depl.yaml
# cd ..

cd auth
kubectl apply -f auth-mongo-depl.yaml
kubectl apply -f auth-depl.yaml
cd ..

cd products
kubectl apply -f products-depl.yaml
cd ..

cd  orders
kubectl apply -f orders-depl.yaml
cd ..


cd frontend
kubectl apply -f frontend-depl.yaml
cd ..


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml

sleep 15
kubectl apply -f ingress-srv.yaml

export theIPaddress=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

kubectl patch svc ingress-nginx-controller   -n ingress-nginx -p '{"spec": {"type": "LoadBalancer", "externalIPs":["'"$theIPaddress"'"]}}'


#kubectl get ingress
#kubectl describe ingress
#kubectl describe svc ingress-nginx-controller -n ingress-nginx

#https://stackoverflow.com/questions/44110876/kubernetes-service-external-ip-pending
