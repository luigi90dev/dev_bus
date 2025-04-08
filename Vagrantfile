# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Configuración común para todos los nodos
  config.vm.box_check_update = false

  # Nodo host_1
  config.vm.define "host_1" do |host_1|
	host_1.vm.box = "bento/ubuntu-22.04"
    host_1.vm.hostname = "host_1"  
	host_1.vm.network "private_network", ip: "192.168.33.10"
	#host_1.vm.network "forwarded_port", guest: 80, host: 8080  
	host_1.vm.provider "virtualbox" do |vb|
      vb.name = "host_1"
      vb.memory = 3072 # 3GB
      vb.cpus = 2
	end
    host_1.vm.provision "shell", path: "./scripts/aprovisionamiento.sh"
  
  config.vm.synced_folder ".", "/vagrant"
end
  

  # host_2
  config.vm.define "host_2" do |host_2|
    host_2.vm.box = "bento/rockylinux-9"
    host_2.vm.hostname = "host_2"
    host_2.vm.network "private_network", ip: "192.168.33.11"
    host_2.vm.provider "virtualbox" do |vb|
      vb.name = "host_2"
      vb.memory = 2048 # 2GB
      vb.cpus = 1
    end
    host_2.vm.provision "shell", path: "./scripts/aprovisionamiento.sh"
  
  config.vm.synced_folder ".", "/vagrant"
  end
end
