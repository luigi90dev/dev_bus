#!/bin/bash

# Aprovisionar Docker y Docker Compose (si no están ya instalados)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant

# Unirse al Swarm utilizando el token guardado en /vagrant
WORKER_JOIN_TOKEN=$(cat /vagrant/worker_join_token.txt)
sudo docker swarm join --token $WORKER_JOIN_TOKEN 192.168.33.10:2377