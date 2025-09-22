# Day 16 — Docker Swarm: Load Balancing & Rolling Updates

## What this teaches
- How Swarm load-balances requests across replicas via the routing mesh.
- How rolling updates work: update one replica at a time to avoid downtime.
- How to rollback a failed update.

## Files
- app_v1.py — app version 1 (returns hostname)
- app_v2.py — app version 2 (different response to show update)
- Dockerfile — builds Flask app
- docker-compose.yml — stack config (3 replicas, update_config)
- scripts: build_and_deploy.sh, update_to_v2.sh, rollback.sh, cleanup.sh

## Step-by-step
1. Make sure Docker is installed and the daemon is running.
2. Initialize swarm on this node (single-node test):
   ```bash
   docker swarm init
