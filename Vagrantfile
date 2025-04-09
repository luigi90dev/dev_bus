# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Configuración común para todos los nodos
  config.vm.box_check_update = false

  # Nodo srvcontrol
  config.vm.define "srvcontrol" do |srvcontrol|
	srvcontrol.vm.box = "bento/ubuntu-22.04"
    srvcontrol.vm.hostname = "srvcontrol"  
	srvcontrol.vm.network "private_network", ip: "192.168.33.10"
	#srvcontrol.vm.network "forwarded_port", guest: 80, host: 8080  
	srvcontrol.vm.provider "virtualbox" do |vb|
      vb.name = "srvcontrol"
      vb.memory = 3072 # 3GB
      vb.cpus = 2
	end
    srvcontrol.vm.provision "shell", path: "./scripts/aprovisionamiento.sh"
  
  config.vm.synced_folder ".", "/vagrant"
end
  

  # srvnodo1
  config.vm.define "srvnodo1" do |srvnodo1|
    srvnodo1.vm.box = "bento/rockylinux-9"
    srvnodo1.vm.hostname = "srvnodo1"
    srvnodo1.vm.network "private_network", ip: "192.168.33.11"
    srvnodo1.vm.provider "virtualbox" do |vb|
      vb.name = "srvnodo1"
      vb.memory = 2048 # 2GB
      vb.cpus = 1
    end
    srvnodo1.vm.provision "shell", path: "./scripts/aprovisionamiento.sh"
  
  config.vm.synced_folder ".", "/vagrant"
  end
end
