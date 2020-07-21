# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.


# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end


Vagrant.configure("2") do |config|

  config.vm.define  "web" do |web|
    #specifying the box:
    web.vm.box = "ubuntu/bionic64"
    # assign an ip:
    web.vm.network "private_network", ip: "192.168.10.10"
    # assigning a hostname for the vm
    web.vm.hostname = "web"
    web.vm.synced_folder "app", "/home/ubuntu/app"

    #assigning a hostname for browser access
    web.hostsupdater.aliases = ["development.local"]
  end

# Creating 2nd machine
  config.vm.define  "db" do |db|
    db.vm.box = "ubuntu/bionic64"
    db.vm.network "private_network", ip: "192.168.10.20"
    db.vm.hostname = "db"
    db.hostsupdater.aliases = ["development.db"]
  end

# Creating 3rd machine
  config.vm.define "aws" do |aws|
    #specifying the box:
    aws.vm.box = "ubuntu/bionic64"

    # assign an ip:
    aws.vm.network "private_network", ip: "192.168.10.30"

    # assigning a hostname for the vm
    aws.vm.hostname = "aws"

    #assigning a hostname for browser access
    aws.hostsupdater.aliases = ["development.aws"]
  end
  config.vm.define  "ans" do |ans|
    ans.vm.box = "ubuntu/bionic64"
    ans.vm.network "private_network", ip: "192.168.10.40"
    ans.vm.hostname = "ans"
    ans.vm.synced_folder "app", "/home/ubuntu/app"
    ans.hostsupdater.aliases = ["development.ans"]
  end

end
