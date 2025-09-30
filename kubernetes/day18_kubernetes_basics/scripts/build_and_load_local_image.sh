#!/usr/bin/env bash
# Usage: ./build_and_load_local_image.sh v1
set -euo pipefail
TAG=${1:-v1}
ROOT="$(cd "$(dirname "$0")"/.. && pwd)"
APP_DIR="$ROOT/app"

echo "[INFO] Building image sample-app:$TAG"
docker build -t sample-app:$TAG "$APP_DIR"

# If using minikube, load image into minikube
if minikube status &>/dev/null; then
  echo "[INFO] Loading image into minikube: sample-app:$TAG"
  minikube image load sample-app:$TAG
fi
echo "[INFO] Done. Now you can edit manifests to use sample-app:$TAG and kubectl apply -f manifests/05-flask-deploy.yaml"
