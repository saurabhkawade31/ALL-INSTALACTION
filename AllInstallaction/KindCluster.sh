[ "$(uname -m)" = "x86_64" ] && ARCH=amd64 || ARCH=arm64

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-${ARCH}
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

kind version
