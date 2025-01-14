FROM gitpod/workspace-full:latest

RUN sudo apt-get update && \
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg && \
    export KUBECTL_VERSION="v1.29.8" && \
    curl -LO https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256" && \
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check && \
    sudo apt-get update && \
    curl -fsSLo get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    sudo ./get_helm.sh

RUN echo 'export KUBECONFIG="/workspace/kubernetes-fundamentals/kube-config.yaml"' >> /home/gitpod/.bashrc
RUN echo 'export KUBE_EDITOR="vim"' >> /home/gitpod/.bashrc
RUN kubectl completion bash >> $HOME/.bashrc
