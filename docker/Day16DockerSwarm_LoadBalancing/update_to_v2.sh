#!/usr/bin/env bash
set -euo pipefail

STACK_NAME=mystack
IMAGE_LOCAL=myapp
TAG=v2
SERVICE=${STACK_NAME}_web

if ! docker service ls > /dev/null 2>&1; then
  echo "[ERROR] Docker service not available. Is the stack deployed?"
  exit 1
fi

echo "[INFO] Building $IMAGE_LOCAL:$TAG ..."
cp app_v2.py app.py
docker build -t ${IMAGE_LOCAL}:${TAG} .

echo "[INFO] Updating service ${SERVICE} to image ${IMAGE_LOCAL}:${TAG} (rolling update)..."
docker service update --image ${IMAGE_LOCAL}:${TAG} --update-parallelism 1 --update-delay 5s ${SERVICE}

echo "[SUCCESS] Update started. Monitor with: docker service ps ${SERVICE}"

