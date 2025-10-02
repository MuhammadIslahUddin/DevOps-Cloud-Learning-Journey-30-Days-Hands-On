#!/usr/bin/env bash
set -euo pipefail

NS=daemonset-demo

echo "[INFO] Creating namespace: $NS"
kubectl create ns $NS 2>/dev/null || echo "[INFO] Namespace $NS already exists"

echo "[INFO] Applying nginx DaemonSet..."
kubectl apply -n $NS -f daemonset-nginx.yaml

echo "[INFO] Applying node-exporter DaemonSet..."
kubectl apply -n $NS -f daemonset-node-exporter.yaml

echo "[INFO] Waiting for DaemonSet pods to be ready (timeout 120s)..."
kubectl -n $NS rollout status daemonset/nginx-daemonset --timeout=120s || echo "[WARN] nginx rollout status timed out"
kubectl -n $NS rollout status daemonset/node-exporter --timeout=120s || echo "[WARN] node-exporter rollout status timed out"

echo
kubectl -n $NS get daemonset -o wide
kubectl -n $NS get pods -o wide
