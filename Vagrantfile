# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # CICD server
  config.vm.define :cicd do |cicd|
  config.vm.provision :shell, :path => "init.sh"
  	cicd.vm.provider "virtualbox" do |v|
          v.customize ["modifyvm", :id,"--memory", "2048"]
    end
    cicd.vm.box = "centos/7"
    cicd.vm.hostname = "cicd"
    cicd.vm.network :private_network, ip: "192.168.11.3"
    cicd.vm.network "forwarded_port", guest: 8080, host: 8088
  end

  # web server
  config.vm.define :web do |web|
  config.vm.provision :shell, :path => "web.sh"
    web.vm.provider "virtualbox" do |v|
          v.customize ["modifyvm", :id,"--memory", "2048"]
    end
    web.vm.box = "centos/7"
    web.vm.hostname = "web"
    web.vm.network :private_network, ip: "192.168.11.4"
    web.vm.network "forwarded_port", guest: 8080, host: 8082
  end
end

