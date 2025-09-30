#!/usr/bin/env bash
set -euo pipefail
MANIFESTS="$(cd "$(dirname "$0")"/../manifests && pwd)"
echo "[INFO] Deleting manifests..."
kubectl delete -f "$MANIFESTS/04-service-nodeport.yaml" --ignore-not-found
kubectl delete -f "$MANIFESTS/03-nginx-deploy.yaml" --ignore-not-found
kubectl delete -f "$MANIFESTS/02-nginx-rs.yaml" --ignore-not-found
kubectl delete -f "$MANIFESTS/01-nginx-pod.yaml" --ignore-not-found
kubectl delete -f "$MANIFESTS/05-flask-deploy.yaml" --ignore-not-found
echo "[INFO] Cleanup done."
