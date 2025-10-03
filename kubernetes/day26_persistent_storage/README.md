# Day 26 — Kubernetes Persistent Storage (PV, PVC, StatefulSet)

## Overview
This day covers:
- PersistentVolumeClaim (PVC) with dynamic provisioning (typical for minikube / cloud)
- Mounting PVC into a Pod and verifying data persists across pod restarts
- Using a StatefulSet (MySQL) which uses `volumeClaimTemplates` to create per-pod PVCs
- Secrets for database password
- Practical tasks + troubleshooting

## Files included
- pvc.yaml               → PVC (dynamic)
- pod-writer.yaml        → Busybox pod that writes to the PVC
- secret-mysql.yaml      → Secret storing MYSQL root password
- headless-svc-mysql.yaml→ headless service required by StatefulSet
- statefulset-mysql.yaml → MySQL StatefulSet using `volumeClaimTemplates`
- setup.sh               → apply manifests in right order
- cleanup.sh             → remove resources
- this README.md

## Prerequisites
- Kubernetes cluster (minikube recommended)
- kubectl configured to point to the cluster (run `kubectl cluster-info`)
- For minikube: `minikube start --driver=docker` (or your preferred driver)

## Step-by-step (Quick)
1. Start minikube:
   ```bash
   minikube start
   kubectl config current-context
