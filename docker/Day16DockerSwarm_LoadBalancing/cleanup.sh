#!/usr/bin/env bash
set -euo pipefail

STACK_NAME=mystack

echo "[INFO] Removing stack ${STACK_NAME}..."
docker stack rm ${STACK_NAME}

echo "[INFO] Removing unused images (local) — you'll be asked for confirmation"
docker image prune -f

# optionally: leave swarm if you want
# echo "[INFO] Leaving swarm..."
# docker swarm leave --force
echo "[DONE]"
