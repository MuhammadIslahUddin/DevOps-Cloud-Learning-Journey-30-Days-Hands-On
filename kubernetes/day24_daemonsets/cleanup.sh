#!/usr/bin/env bash
set -euo pipefail

NS=daemonset-demo

echo "[INFO] Deleting DaemonSets..."
kubectl -n $NS delete -f daemonset-nginx.yaml --ignore-not-found
kubectl -n $NS delete -f daemonset-node-exporter.yaml --ignore-not-found

echo "[INFO] Deleting namespace $NS..."
kubectl delete ns $NS --ignore-not-found

echo "[INFO] Done"
