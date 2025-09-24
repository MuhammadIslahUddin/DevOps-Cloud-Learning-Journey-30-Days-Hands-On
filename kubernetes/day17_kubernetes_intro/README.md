# Day 17 — Kubernetes Intro

**What:** Local Kubernetes with Minikube — Deployment + Service (nginx)

**How to run**
1. Install kubectl and minikube (see doc.md)
2. Start minikube: `minikube start --driver=docker`
3. `kubectl apply -f deployment.yaml && kubectl apply -f service.yaml`
4. Access: `minikube service hello-service --url` or `kubectl port-forward svc/hello-service 8080:80`

**Verification**
- `kubectl get pods`
- `kubectl get svc hello-service`
- `curl $(minikube service hello-service --url)`

**Commit example**
`git add . && git commit -m "Day 17: Kubernetes intro — minikube, deployment, service" && git push origin main`
