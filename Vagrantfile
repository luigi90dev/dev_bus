Vagrant.configure("2") do |config|

	# Imagen común para todos los nodos
	BOX_IMAGE = "bento/ubuntu-22.04"

	# srv1
	config.vm.define "srv1" do |srv1|
	srv1.vm.box = BOX_IMAGE
	srv1.vm.hostname = "srv1"
	srv1.vm.network "private_network", ip: "192.168.33.10"
	srv1.vm.network "forwarded_port", guest: 80, host: 8080 # Puerto específico para BusApp
	
	# Se crea una carpeta compartida dentro del directorio Vagrant común a todos los nodos
	srv1.vm.synced_folder ".", "/vagrant"
	
	# Especificaciones hardware de la VM mediante el hipervisor VirtualBox
	srv1.vm.provider "virtualbox" do |vb|
       vb.memory = "1024" # Ajusta la memoria y andamos por debajo de requisito mínimos. No quiero pensar en que solo usamos un core ...
       vb.cpus = "1"
	end
	
	# Aprovisionamos mediante script
	srv1.vm.provision "shell", inline: "bash /vagrant/provision.sh"
	end
	
	# srv2
	config.vm.define "srv2" do |srv2|
	srv2.vm.box = BOX_IMAGE
	srv2.vm.hostname = "srv2"
	srv2.vm.network "private_network", ip: "192.168.33.11"
	srv2.vm.network "forwarded_port", guest: 80, host: 8088 # Puerto específico para BusApp
	
	# Se crea una carpeta compartida dentro del directorio Vagrant común a todos los nodos
	srv2.vm.synced_folder ".", "/vagrant"
	
	# Especificaciones hardware de la VM mediante el hipervisor VirtualBox
	srv2.vm.provider "virtualbox" do |vb|
       vb.memory = "1024" # Ajusta la memoria y andamos por debajo de requisito mínimos. No quiero pensar en que solo usamos un core ...
       vb.cpus = "1"
	end
	
	# Aprovisionamos mediante script
	srv2.vm.provision "shell", inline: "bash /vagrant/provision2.sh"
	end
	
end
