#!/bin/bash

# atualizacao do O.S
yum install epel-release wget unzip git telnet net-tools yum-utils 

# instalacao do docker-ce
sudo yum install -y yum-utils net-tools telnet 
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ${USER}
sudo chown ${USER}:docker /var/run/docker.sock

# instalacao do docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo systemctl daemon-reload
sudo systemctl restart docker
