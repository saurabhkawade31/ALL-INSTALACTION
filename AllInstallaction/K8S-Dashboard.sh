# Helm Install cmd
sudo apt-get update
sudo apt-get install -y curl

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 -o get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

helm version

--------------------------------------------------------------------------


#!/bin/bash
set -e

helm repo add headlamp https://kubernetes-sigs.github.io/headlamp/
helm repo update

helm upgrade --install headlamp headlamp/headlamp \
  --namespace headlamp \
  --create-namespace

kubectl rollout status deployment/headlamp \
  -n headlamp --timeout=180s

kubectl get pods -n headlamp
kubectl get svc -n headlamp
