Vagrant.configure("2") do |config|

	# Imagen común para todos los nodos
	BOX_IMAGE = "bento/ubuntu-22.04"

	# srv1
	config.vm.define "srv1" do |srv1|
	srv1.vm.box = BOX_IMAGE
	srv1.vm.hostname = "srv1"
	srv1.vm.network "private_network", ip: "192.168.33.10"
	srv1.vm.network "forwarded_port", guest: 80, host: 8080 # Puerto específico para BusApp
	
	# Especificaciones hardware de la VM mediante el hipervisor VirtualBox
	srv1.vm.provider "virtualbox" do |vb|
       vb.memory = "1024" # Ajusta la memoria y andamos por debajo de requisito mínimos. No quiero pensar en que solo usamos un core ...
       vb.cpus = "1"
	end
	
	# Aprovisionamos mediante script
	srv1.vm.provision "shell", inline: <<-SHELL
		# Instalar Docker según procedimientos oficiales
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

	SHELL
	
	# Se crea una carpeta compartida dentro del directorio Vagrant común a todos los nodos
	srv1.vm.synced_folder ".", "/vagrant"
	end
	
	# srv2
	config.vm.define "srv2" do |srv2|
	srv2.vm.box = BOX_IMAGE
	srv2.vm.hostname = "srv2"
	srv2.vm.network "private_network", ip: "192.168.33.11"
	srv2.vm.network "forwarded_port", guest: 80, host: 8088 # Puerto específico para BusApp
	
	# Especificaciones hardware de la VM mediante el hipervisor VirtualBox
	srv2.vm.provider "virtualbox" do |vb|
       vb.memory = "1024" # Ajusta la memoria y andamos por debajo de requisito mínimos. No quiero pensar en que solo usamos un core ...
       vb.cpus = "1"
	end
	
	# Aprovisionamos mediante script
	srv2.vm.provision "shell", inline: <<-SHELL
		# Aprovisionar Docker y Docker Compose
		curl -fsSL https://get.docker.com -o get-docker.sh
		sudo sh get-docker.sh
		sudo usermod -aG docker vagrant

		# Unirse al Swarm utilizando el token guardado en /vagrant
		WORKER_JOIN_TOKEN=$(cat /vagrant/token_export.txt)
		sudo docker swarm join --token $WORKER_JOIN_TOKEN 192.168.33.10:2377
	
	SHELL
	
	# Se crea una carpeta compartida dentro del directorio Vagrant común a todos los nodos
	srv2.vm.synced_folder ".", "/vagrant"
	end
	
end
