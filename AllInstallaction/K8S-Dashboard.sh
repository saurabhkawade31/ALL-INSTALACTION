# Helm Install cmd
sudo apt-get update
sudo apt-get install -y curl

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 -o get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

helm version

--------------------------------------------------------------------------
helm repo add kubernetes-dashboard \
  https://kubernetes.github.io/dashboard/

helm repo update

helm upgrade --install kubernetes-dashboard \
  kubernetes-dashboard/kubernetes-dashboard \
  --create-namespace \
  --namespace kubernetes-dashboard
