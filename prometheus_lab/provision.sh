#!/bin/bash

yum install -y epel-release wget yum-utils git unzip telnet net-tools

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker

# docker run -d -p 9090:9090 --restart unless-stopped -v /vagrant/prometheus.yaml:/etc/prometheus/prometheus.yaml --name prometheus prom/prometheus
