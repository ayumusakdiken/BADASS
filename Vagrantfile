Vagrant.require_version ">= 2.4.4"

BOX = "koalephant/debian12"
BOX_URL = "https://boxes.storage.koalephant.com/debian12/1.4.0/amd64/virtualbox.box"
CONFIG_NAME = "vm-muguveli"

Vagrant.configure("2") do |config|
  config.vm.define CONFIG_NAME do |vm|
    vm.vm.hostname = CONFIG_NAME
    vm.vm.box = BOX
    vm.vm.box_url = BOX_URL
    vm.vm.network "public_network"
    vm.vm.network "forwarded_port", guest: 3080, host: 3080
    vm.vm.provider "virtualbox" do |vb|
      vb.name = CONFIG_NAME
      vb.cpus = 1
      vb.memory = "1024"
    end
  end
end