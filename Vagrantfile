# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu14-cloudimage"
    master.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    master.vm.network "private_network", ip: "10.3.3.3"
   
    master.vm.provision "chef_solo" do |chef|
      # Paths to your cookbooks (on the host)
      chef.cookbooks_path = "cookbooks"
      # Add chef recipes
      chef.add_recipe 'redis-cluster::default'
      chef.json = {
        "redis-cluster" => {
          "slave" => false,
          "master-ip" => "10.3.3.3"
        }
      }
    end
  end

  config.vm.define "slave1" do |slave1|
    slave1.vm.box = "ubuntu14-cloudimage"
    slave1.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    slave1.vm.network "private_network", ip: "10.3.3.4"
  
    slave1.vm.provision "chef_solo" do |chef|
      # Paths to your cookbooks (on the host)
      chef.cookbooks_path = "cookbooks"
      # Add chef recipes
      chef.add_recipe 'redis-cluster::default'
      chef.json = {
        "redis-cluster" => {
          "slave" => true,
          "master-ip" => "10.3.3.3"
        }
      }
    end  
  end

  config.vm.define "slave2" do |slave2|
    slave2.vm.box = "ubuntu14-cloudimage"
    slave2.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    slave2.vm.network "private_network", ip: "10.3.3.5"
  
    slave2.vm.provision "chef_solo" do |chef|
      # Paths to your cookbooks (on the host)
      chef.cookbooks_path = "cookbooks"
      # Add chef recipes
      chef.add_recipe 'redis-cluster::default'
      chef.json = {
        "redis-cluster" => {
          "slave" => true,
          "master-ip" => "10.3.3.3"
        }
      }
    end  
  end

end
