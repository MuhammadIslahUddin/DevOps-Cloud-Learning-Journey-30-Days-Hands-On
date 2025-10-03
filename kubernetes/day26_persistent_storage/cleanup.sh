#!/usr/bin/env bash
set -euo pipefail

kubectl delete -f statefulset-mysql.yaml --ignore-not-found
kubectl delete -f headless-svc-mysql.yaml --ignore-not-found
kubectl delete -f secret-mysql.yaml --ignore-not-found
kubectl delete -f pod-writer.yaml --ignore-not-found
kubectl delete -f pvc.yaml --ignore-not-found
echo "Cleanup complete."
