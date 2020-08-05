#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

# install ansible
echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list.d/ansible.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt-get -y update
apt-get -y install ansible
rm  /etc/apt/sources.list.d/ansible.list

# run ansible playbook
ansible-playbook installation.yml
