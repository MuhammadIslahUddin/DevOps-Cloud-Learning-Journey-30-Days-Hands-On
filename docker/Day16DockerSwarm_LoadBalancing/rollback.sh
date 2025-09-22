#!/usr/bin/env bash
set -euo pipefail

STACK_NAME=mystack
SERVICE=${STACK_NAME}_web

echo "[INFO] Rolling back ${SERVICE} to previous image..."
docker service rollback ${SERVICE}

echo "[SUCCESS] Rollback requested. Monitor progress with: docker service ps ${SERVICE}"
