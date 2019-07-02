# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 256]
  end

  config.vm.define :loadbalancer, primary: true do |loadbalancer_config|
    loadbalancer_config.vm.hostname = "haploadbalancerroxy"
    loadbalancer_config.vm.network :forwarded_port, guest: 8080, host: 8080
    loadbalancer_config.vm.network :forwarded_port, guest: 80, host: 80
    loadbalancer_config.vm.network :private_network, ip: "192.168.10.10"
    loadbalancer_config.vm.provision :shell, :path => "lb-setup.sh"
  end

  config.vm.define :webserver1 do |webserver1_config|
    webserver1_config.vm.hostname = "webserver1"
    webserver1_config.vm.network :private_network, ip: "192.168.10.11"
    webserver1_config.vm.provision :shell, :path => "web-setup.sh"
  end

  config.vm.define :webserver2 do |webserver2_config|
    webserver2_config.vm.hostname = "webserver2"
    webserver2_config.vm.network :private_network, ip: "192.168.10.12"
    webserver2_config.vm.provision :shell, :path => "web-setup.sh"
  end
end