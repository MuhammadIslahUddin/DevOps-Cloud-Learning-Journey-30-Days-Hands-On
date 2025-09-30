#!/usr/bin/env bash
# simple helper: scale and update image for sample-app
set -euo pipefail
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 replicas newImageTag"
  exit 1
fi
REPLICAS="$1"
NEW_TAG="$2"

echo "[INFO] Scaling sample-app to $REPLICAS"
kubectl scale deployment sample-app --replicas="$REPLICAS"
echo "[INFO] Updating image to sample-app:$NEW_TAG"
kubectl set image deployment/sample-app sample-app=sample-app:"$NEW_TAG"
kubectl rollout status deployment/sample-app
