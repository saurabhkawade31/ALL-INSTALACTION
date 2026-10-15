curl -fL https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64 -o /tmp/kind
file /tmp/kind
chmod +x /tmp/kind
sudo mv /tmp/kind /usr/local/bin/kind
kind version
