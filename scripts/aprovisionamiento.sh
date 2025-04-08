#!/bin/bash
sudo yum -y update
sudo yum -y install python3 podman

# Instalar Docker según procedimientos oficiales
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant