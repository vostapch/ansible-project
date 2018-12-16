# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # https://vagrantcloud.com/ubuntu
  #config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 256
    v.cpus = 1
  end
  # If true, then any SSH connections made will enable agent forwarding.
  config.ssh.forward_agent = true

  # Share additional folders to the guest VM.
  #config.vm.synced_folder "data", "/data"

  # Bash provision script
  #config.vm.provision "shell", path: "provision/setup.sh"

  # Upload user's ssh key into box so it can be used for downloading stuff from stash
  ssh_key_path = "~/.ssh/"
  config.vm.provision "shell", inline: "mkdir -p /home/vagrant/.ssh"
  #config.vm.provision "file", source: "#{ ssh_key_path + 'id_rsa' }", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: "#{ ssh_key_path + 'id_rsa.pub' }", destination: "/home/vagrant/.ssh/authorized_keys"
  config.vm.provision "shell", inline: "chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys"
  config.vm.provision "shell", inline: "chmod 600 /home/vagrant/.ssh/authorized_keys"
  
  config.vm.provision "shell", path: "provision/provision.sh"
  
  config.vm.define "ubuntu16" do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.hostname = "ubuntu16.vm.example.com"
    config.vm.network "private_network", ip: "172.28.128.41"
    config.vm.provider :virtualbox do |vb|
        vb.name = "ubuntu16"
    end
  end
  config.vm.define "ubuntu18.04" do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.hostname = "bionic"
    config.vm.network "private_network", ip: "172.28.128.51"
    config.vm.provider :virtualbox do |vb|
        vb.name = "ubuntu18.04"
    end
  end

  config.vm.define "centos7" do |config|
    config.vm.box = "centos/7"
    config.vm.hostname = "centos7"
    config.vm.network "private_network", ip: "172.28.128.50"
    config.vm.provider :virtualbox do |vb|
        vb.name = "centos7"
    end
  end
 end
