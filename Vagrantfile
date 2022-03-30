# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "kentbrockman/pop_os_2110"
  config.vm.box_version = "1.1.0"
  config.vm.hostname = "dummybox"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  # HACK: need to specify the guest otherwise it isnt picked up properly
  # TODO: is there a way to package this into the box metadata 
  # so we dont have to specify it in every Vagrantfile that uses this box?
  config.vm.guest = "ubuntu"

  # HACK: nfs is not configured properly, so disable it otherwise the VM cannot start
  # because I do not use it for this project, it is not worth troubleshooting
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  config.vm.provider "libvirt" do |libvirt|
    libvirt.title = "dev-playbook-testing-box"
    libvirt.memory = "4096"
    libvirt.cpus = 2
    libvirt.machine_virtual_size = 50
  end

  # TODO: make public network config conditional based on br0 existing
  # bridge the network so SSH'ing is easier
  # config.vm.network "public_network",
    # :dev => "br0",
    # :mode => "bridge",
    # :type => "bridge"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 22, host: 2222, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provision
  # config.vm.provision "ansible" do |ansible|    
	# ansible.playbook = "main.yml"
  # end

end
