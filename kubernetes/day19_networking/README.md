cat > README.md <<'EOF'
# Day 19 — Kubernetes Networking (ClusterIP / NodePort / LoadBalancer)

## Overview
This mini-project demonstrates the three common Kubernetes Service types:
- **ClusterIP** — internal cluster-only service (backend)
- **NodePort** — exposes a pod on a high-range port on every node (frontend)
- **LoadBalancer** — requests an external IP from cloud provider (frontend)

We use:
- backend: `hashicorp/http-echo` (port 8080) — responds "Hello from Backend!"
- frontend: `nginxdemos/hello` (port 80) — simple static page

## Files
- `project-backend.yaml` — backend Deployment
- `clusterip-svc.yaml` — ClusterIP Service for backend
- `project-frontend.yaml` — frontend Deployment
- `nodeport-svc.yaml` — NodePort Service for frontend (nodePort 30080)
- `loadbalancer-svc.yaml` — LoadBalancer Service for frontend
- `README.md` — this file

---

## Step-by-step (apply & test)

1. Apply backend + ClusterIP:
   ```bash
   kubectl apply -f project-backend.yaml
   kubectl apply -f clusterip-svc.yaml
   kubectl get deploy,svc -l app=backend
