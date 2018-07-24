#!/bin/bash

source .env; echo $USER; echo $PASS


echo "Performing initial setup tasks"
echo "Updating packages"
apt-get update -y
apt-get upgrade -y
apt-get autoclean
apt-get install
echo "Package updates successful"

echo "renaming pi user account to $USER"
groupadd $USER
usermod -d /home/$USER -m -g $USER -l $USER pi

echo "copying custom ssh configs"
cp /home/$USER/ssh_config /etc/ssh_config 
cp /home/$USER/sshd_config /etc/sshd_config 

echo "restarting ssh server"
service restart sshd
