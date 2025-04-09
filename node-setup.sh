#!/bin/bash

# Actualizar sistema
sudo apt-get update -y

# Instalar Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Crear carpeta de servicios
mkdir -p /home/vagrant/services
cp -r /vagrant/services/* /home/vagrant/services/
cd /home/vagrant/services

# Levantar servicios
sudo docker-compose up -d
