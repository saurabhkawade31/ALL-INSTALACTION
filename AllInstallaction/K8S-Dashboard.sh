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


-------------------------------------------------------------------------------

kubectl port-forward --address 0.0.0.0 \
  -n headlamp svc/headlamp 8080:80


================================================================================
# Login sathi token tayar karane 

kubectl create serviceaccount headlamp-admin -n headlamp
kubectl create token headlamp-admin -n headlamp
