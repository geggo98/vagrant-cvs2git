# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Override if Parallels
  config.vm.provider "parallels" do |v, override|
    override.vm.box = "parallels/ubuntu-14.04"
    #override.vm.box_url = "https://vagrantcloud.com/parallels/ubuntu-14.04"
  end

  # CVS reposistory: Adapt this to your needs
  #config.vm.synced_folder "../CVSRoot", "/cvs_data"


  
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  
  config.vm.provider :parallels do |prl|
    prl.update_guest_tools = true
    prl.memory = 4096
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y python git cvs subversion pv

    svn co --username=guest --password="" http://cvs2svn.tigris.org/svn/cvs2svn/trunk cvs2svn-trunk
    cd cvs2svn-trunk
    make man # If you want to create manpages for the main programs
    make check # ...optional
    sudo make install
    cd ..

    mkdir -p /vagrant/cvs # Put the CVS repository here or alternatively adapt the CVS root mount

  SHELL
end
