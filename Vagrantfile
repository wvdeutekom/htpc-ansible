# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "trusty"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.ssh.forward_agent = true
  #config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.define "default", autostart: false do |machine|
    machine.vm.hostname = "vagrant-default"
    machine.vm.network :private_network, ip:"172.28.128.127"

  end

  config.vm.define "vagrant-workflow", autostart: false do |machine|
    machine.vm.hostname = "vagrant-workflow"
    machine.vm.network :private_network, ip:"172.28.128.128"
  end

  config.vm.define "vagrant-hourlytest", autostart: false do |machine|
    machine.vm.hostname = "vagrant-hourlytest"
    machine.vm.network :private_network, ip:"172.28.128.218"
  end

  config.vm.define "vagrant-lb", autostart: false do |machine|
    machine.vm.hostname = "vagrant-lb"
    machine.vm.network :private_network, ip:"172.28.128.129"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "7168"]
    end
  end

  config.vm.define "vagrant-app", autostart: false do |machine|
    machine.vm.hostname = "vagrant-app"
    machine.vm.network :private_network, ip:"172.28.128.130"
  end

  config.vm.define "vagrant-passengerapp", autostart: false do |machine|
    machine.vm.hostname = "vagrant-passengerapp"
    machine.vm.network :private_network, ip:"172.28.128.131"
  end

  config.vm.define "vagrant-portal", autostart: false do |machine|
    machine.vm.hostname = "vagrant-portal"
    machine.vm.network :private_network, ip:"172.28.128.132"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end

  config.vm.define "vagrant-logging", autostart: false do |machine|
    machine.vm.hostname = "vagrant-logging"
    machine.vm.network :private_network, ip:"172.28.128.133"
  end

  config.vm.define "vagrant-delivery", autostart: false do |machine|
    machine.vm.hostname = "vagrant-delivery"
    machine.vm.network :private_network, ip:"172.28.128.134"
  end

  config.vm.define "vagrant-events", autostart: false do |machine|
    machine.vm.hostname = "vagrant-events"
    machine.vm.network :private_network, ip:"172.28.128.135"
  end

  config.vm.define "vpn-gateway", autostart: false do |machine|
    machine.vm.hostname = "vagrant-vpngateway"
    machine.vm.network :private_network, ip:"172.28.128.136"
  end

  config.vm.define "vagrant-db", autostart: false do |machine|
    machine.vm.hostname = "vagrant-db"
    machine.vm.network :private_network, ip:"172.28.128.137"
  end

  config.vm.define "vagrant-db-follower", autostart: false do |machine|
    machine.vm.hostname = "vagrant-db-follower"
    machine.vm.network :private_network, ip:"172.28.128.138"
  end

  config.vm.define "vagrant-elastic-01", autostart: false do |machine|
    machine.vm.hostname = "vagrant-elastic-01"
    machine.vm.network :private_network, ip:"172.28.128.139"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end

  config.vm.define "vagrant-elastic-02", autostart: false do |machine|
    machine.vm.hostname = "vagrant-elastic-02"
    machine.vm.network :private_network, ip:"172.28.128.140"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end

    config.vm.define "vagrant-dockerhost", autostart: false do |machine|
    machine.vm.hostname = "vagrant-dockerhost"
    machine.vm.network :private_network, ip:"172.28.128.141"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.host_key_checking = false
    #ansible.verbose = "vvvv"
    ansible.playbook = "bootstrap.yml"
    ansible.inventory_path = "development/inventory"

    ansible.extra_vars = {
      ansible_ssh_args: '-o ForwardAgent=yes',
      ansible_ssh_user: 'vagrant',
      host_key_checking: 'False'
    }

    ansible.groups = {
      "appservers" => %w(vagrant-app),
      "clippingtool" => %w(vagrant-clippingtool),
      "default" => %(default),
      "delivery" => %(vagrant-delivery),
      "dockerhost" => %w(vagrant-dockerhost),
      "elasticcluster" => ["vagrant-elastic-01", "vagrant-elastic-02"],
      "events" => %w(vagrant-events),
      "hourlytest" => %w(vagrant-hourlytest),
      "loadbalancers" => %w(vagrant-lb),
      "logging" => %w(vagrant-logging),
      "passengerapp" => %w(vagrant-passengerapp),
      "portal" => %(vagrant-portal),
      "postgres" => %w(vagrant-db vagrant-db-follower),
      "vpn-gateway" => %w(vpn-gateway),
      "workflow" => %w(vagrant-workflow),
    }

  end

end
