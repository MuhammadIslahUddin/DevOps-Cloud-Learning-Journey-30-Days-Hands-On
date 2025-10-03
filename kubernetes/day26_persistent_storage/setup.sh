#!/usr/bin/env bash
set -euo pipefail

echo "1) Ensure minikube is running..."
minikube status || { echo "start minikube first: minikube start"; exit 1; }

echo "2) Apply PVC (dynamic) and writer pod..."
kubectl apply -f pvc.yaml
kubectl apply -f pod-writer.yaml

echo "3) Wait for writer pod to be Running..."
kubectl wait --for=condition=Ready pod/writer --timeout=60s || true
echo "Done. To check file:"
echo "kubectl exec -it writer -- cat /data/hello.txt"

echo
echo "4) Deploy MySQL statefulset demo..."
kubectl apply -f secret-mysql.yaml
kubectl apply -f headless-svc-mysql.yaml
kubectl apply -f statefulset-mysql.yaml

echo "Wait until mysql-0 is Running:"
kubectl rollout status statefulset/mysql --timeout=120s || true
kubectl get pods -l app=mysql
echo "To check MySQL logs: kubectl logs -l app=mysql -c mysql"
