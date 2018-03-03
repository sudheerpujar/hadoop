#!/bin/bash

echo "Congfiguring SSH (configure-ssh.sh)"

echo "Installation of passwordless SSH"

sudo apt-get install ssh
sudo apt-get install pdsh

#echo "Creating .ssh folder under hduser home directory"

echo "Generating Key Pairs"

sudo -H -u hduser ssh-keygen -t rsa -P '' -f /home/hduser/.ssh/id_rsa


echo "Configuring passwordless ssh"
sudo -H -u hduser chmod 0777 /home/hduser/.ssh
sudo -H -u hduser cat /home/hduser/.ssh/id_rsa.pub>>/home/hduser/.ssh/authorized_keys
sudo chown hduser:hadoop /home/hduser/.ssh/authorized_keys
sudo -H -u hduser chmod 0600 /home/hduser/.ssh/authorized_keys
sudo -H -u hduser chmod 0700 /home/hduser/.ssh

sudo -H -u hduser ssh localhost

