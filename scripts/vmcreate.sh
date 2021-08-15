#!/bin/bash

# Simple script to creates a local test environment using vagrant and virtual box.

cd $Home
read -p "[?] How do you want to call the test environment? (no spaces)" name
echo
echo "Creating test environment under $Home/vagrantboxes/$name"
echo
cd vagrantboxes/ && mkdir $name
cp -r /home/anton/code/bash-scripts . && cp -r /home/anton/code/dotfiles .
touch Vagrantfile
cat <<EOF >> Vagrantfile
Vagrant.configure("2") do |config|
        config.vm.box = "peru/ubuntu-20.04-server-amd64"
                config.vm.provider "virtualbox" do |v|
                        v.gui = false
		end
		config.vm.define "box1" do |box1|
                        box1.vm.hostname = "box1"
                        box1.vm.network "private_network", ip: "10.9.8.5"
		end
	end
end
EOF
vagrant up
read -p "[?] Do you want to ssh in to the test environment? [y/n] " ssh
	if [[ ssh == y ]] ; then
		vagrant ssh
	else
		echo "[!] You can always ssh in to the test environment using vagrant ssh"
	fi
