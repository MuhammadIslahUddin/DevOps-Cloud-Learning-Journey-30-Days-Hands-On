# Day 17 — Kubernetes Intro (Minikube)

## Objective
Run a local Kubernetes cluster with Minikube and deploy a simple Nginx app (Deployment + Service). Practice inspect, scale, and debug.

## Files created
- deployment.yaml — Deployment (nginx) with liveness/readiness probes
- service.yaml — NodePort service to expose app
- README.md — step-by-step usage & git instructions

## Steps performed
1. Installed kubectl & minikube
2. Started minikube with Docker driver
3. Applied `deployment.yaml` and `service.yaml`
4. Verified pods, deployment and service
5. Accessed via `minikube service` and `port-forward`
6. Scaled deployment up/down
7. Collected logs and described pods for troubleshooting

## Notes / Troubleshooting
(Insert logs / notes / screenshots you captured)
