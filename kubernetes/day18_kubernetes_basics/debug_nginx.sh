#!/bin/bash
set -e

echo "[INFO] Checking Pods..."
kubectl get pods -o wide

echo "[INFO] Checking Services..."
kubectl get svc

echo "[INFO] Describing Pod..."
kubectl describe pod nginx-pod || true

echo "[INFO] Logs from Pod..."
kubectl logs nginx-pod || true

echo "[INFO] Describing ReplicaSet..."
kubectl describe rs nginx-rs || true

echo "[INFO] Describing Deployment..."
kubectl describe deploy nginx-deploy || true

echo "[INFO] Service URL:"
minikube service nginx-nodeport --url
