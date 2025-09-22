
### `build_and_deploy.sh`
```bash
#!/usr/bin/env bash
set -euo pipefail

STACK_NAME=mystack
IMAGE_LOCAL=myapp
TAG=v1

# ensure running as user with docker access
if ! docker info > /dev/null 2>&1; then
  echo "[ERROR] Docker daemon not available. Start Docker and try again."
  exit 1
fi

# confirm swarm active (single-node)
SWARM_STATE=$(docker info --format '{{.Swarm.LocalNodeState}}')
if [ "$SWARM_STATE" != "active" ]; then
  echo "[INFO] Swarm not active. Initializing single-node swarm..."
  docker swarm init || { echo "[ERROR] swarm init failed"; exit 1; }
fi

echo "[INFO] Building $IMAGE_LOCAL:$TAG ..."
cp app_v1.py app.py
docker build -t ${IMAGE_LOCAL}:${TAG} .

echo "[INFO] Deploying stack ${STACK_NAME} ..."
docker stack deploy -c docker-compose.yml ${STACK_NAME}

echo "[SUCCESS] Deployed. Check with: docker service ls ; docker service ps ${STACK_NAME}_web"
