FROM gitpod/workspace-full:latest

RUN sudo apt-get update && \
    sudo apt-get install -y apt-transport-https ca-certificates curl && \
    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
    sudo apt-get update && \
    sudo apt-get install -y kubectl

RUN echo 'export KUBECONFIG="/workspace/kubernetes-fundamentals"' >> /home/gitpod/.bashrc