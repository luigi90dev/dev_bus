# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Configuración común para todos los nodos
  config.vm.box_check_update = false

  # Nodo padre
  config.vm.define "padre" do |padre|
	padre.vm.box = "bento/ubuntu-22.04"
    padre.vm.hostname = "padre"  
	padre.vm.network "private_network", ip: "192.168.33.10"
	#padre.vm.network "forwarded_port", guest: 80, host: 8080  
	padre.vm.provider "virtualbox" do |vb|
      vb.name = "padre"
      vb.memory = 3072 # 3GB
      vb.cpus = 2
	end
    padre.vm.provision "shell", path: "./scripts/aprovisionamiento.sh"
  
  config.vm.synced_folder ".", "/vagrant"
end
  

  # hijo1
  config.vm.define "hijo1" do |hijo1|
    hijo1.vm.box = "bento/rockylinux-9"
    hijo1.vm.hostname = "hijo1"
    hijo1.vm.network "private_network", ip: "192.168.33.11"
    hijo1.vm.provider "virtualbox" do |vb|
      vb.name = "hijo1"
      vb.memory = 2048 # 2GB
      vb.cpus = 1
    end
    hijo1.vm.provision "shell", path: "./scripts/aprovisionamiento.sh"
  
  config.vm.synced_folder ".", "/vagrant"
  end
end
