# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

config.vm.hostname = "beagle-dev"


  config.vm.box = "Ubunti precise 64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"


  config.berkshelf.enabled = true

#config.vm.network :private_network, :ip => "192.168.178.22"
#config.vm.network :forwarded_port, host: 4567, guest: 80
#config.vm.network :private_network

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "beagle_dev"
    chef.json = { 
                  :distcc => { 
                  :allowed_networks => "192.168.178.0/24" 
                   }
                } 
  end
end
