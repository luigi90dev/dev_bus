VAGRANT_NODES = 3
Vagrant.configure("2") do |config|
  (1..VAGRANT_NODES).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.box = "bento/ubuntu-22.04"
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: "192.168.56.#{100 + i}"

      node.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = (i == 1) ? 2 : 1
      end

      node.vm.provision "shell", path: "node-setup.sh"
    end
  end
end
