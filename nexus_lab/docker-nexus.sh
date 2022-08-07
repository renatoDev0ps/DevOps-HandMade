#!/bin/bash

docker volume create --name nexus-data
docker run -d -p 8082:8081 -p 8123:8123 --name nexus --restart unless-stopped -v nexus-data:/nexus-data sonatype/nexus3

# criar permissoes no deamon do docker
vi /etc/docker/daemon.json
# iserir esta linha
{ "insecure-resgistries": ["192.168.1.10:8123"] }
# reiniciar docker
sudo service docker restart