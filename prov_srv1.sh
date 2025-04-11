#!/bin/bash

# Aprovisionar Docker y Docker Compose (si no están ya instalados)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant

# Instalar Docker Compose
sudo apt-get update
sudo apt-get install -y docker-compose-plugin

# Levantar docker-compose.yml
sudo docker compose -f /vagrant/bus-ticket-app/docker-compose.yml up --build -d

# Inicializar Docker Swarm en el manager (srv1)
sudo docker swarm init --advertise-addr 192.168.33.10

# Obtener token de worker para unirse al Swarm
WORKER_JOIN_TOKEN=$(sudo docker swarm join-token manager -q)
    
# Guardar el token en un archivo para usarlo en srv2
echo $WORKER_JOIN_TOKEN > /vagrant/token_export.txt