set -euo pipefail
DIR="$(cd "$(dirname "$0")"/.. && pwd)"
MANIFESTS="$DIR/manifests"

echo "[INFO] Applying manifests from $MANIFESTS"
kubectl apply -f "$MANIFESTS/01-nginx-pod.yaml"
kubectl apply -f "$MANIFESTS/02-nginx-rs.yaml"
kubectl apply -f "$MANIFESTS/03-nginx-deploy.yaml"
kubectl apply -f "$MANIFESTS/04-service-nodeport.yaml"
echo "[INFO] Manifests applied. Run: kubectl get pods, kubectl get svc"
