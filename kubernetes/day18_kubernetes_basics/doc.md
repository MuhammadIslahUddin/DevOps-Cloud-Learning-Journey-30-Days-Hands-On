# Day 18 — Detailed Notes

## Concepts
- **Pod**: smallest deployable unit; one or more containers sharing network + storage.
- **ReplicaSet**: ensures specified number of pod replicas are running (replaces `kubectl run --replicas` behavior).
- **Deployment**: declarative updates for ReplicaSets (rolling updates, rollback, scaling).
- **Service**: stable network endpoint to expose Pods.

## Recommended workflow
1. Create a Pod manifest and apply it.
2. Create ReplicaSet manifest to create multiple pod replicas.
3. Replace ReplicaSet with Deployment for easier updates.
4. Expose deployment via Service.
5. Build a custom image of a sample app, load into minikube, deploy it.
6. Practice rolling update: `kubectl set image`, `kubectl rollout status`, `kubectl rollout undo`.

## Notes on images
- For local images with minikube: build locally and `minikube image load my-image:tag` OR `eval $(minikube docker-env)` then `docker build` to build directly into minikube's docker.

## Troubleshooting quick list
- Pod stuck Pending: check `kubectl describe pod <pod>` for scheduling errors, insufficient resources, PVC issues.
- CrashLoopBackOff: `kubectl logs` + `kubectl describe pod` to see container failures.
- ImagePullBackOff: check image name & tag, or `minikube image load`.
- Service unreachable: ensure `kubectl get svc` shows NodePort and use `minikube service <svcname> --url` or `kubectl port-forward`.

## End
Use scripts in `scripts/` to apply/delete resources quickly.
