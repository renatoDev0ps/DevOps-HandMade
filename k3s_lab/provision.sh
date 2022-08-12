#!/bin/bash

yum install -y epel-release wget yum-utils git unzip telnet net-tools

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker

# sudo su -
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.21.5+k3s2 K3S_KUBECONFIG_MODE="644" sh -s - --cluster-init --tls-san 192.168.1.15 --node-ip 192.168.1.15 --node-external-ip 192.168.1.15

# vi /etc/profile
echo 'alias k=kubectl' >> /etc/profile

git clone https://github.com/ahmetb/kubectx /opt/kubectx
ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
ln -s /opt/kubectx/kubens /usr/local/bin/kubens

sudo yum install bash-completion -y
echo 'source <(kubectl completion bash)' >> ~/.bashrc
kubectl completion bash > /etc/bash_completion.d/kubectl
echo 'complete -F __start_kubectl k' >> ~/.bashrc

# configurar um mirror do registry criar
# sudo cat /vagrant/registries.yaml >> /etc/rancher/k3s/registries.yaml
# service k3s restart

# rodar nos workers
# sudo curl -sfL https://get.k3s.io | K3S_URL=https://192.168.1.11:6443 K3S_TOKEN=K10699228465df02cfedb465e43af471bf16ff1b0944841137f69c705540a6476c9::server:21c1e55ed5ee1d3c27b124c3d655d96d sh -