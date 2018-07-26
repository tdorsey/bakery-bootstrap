#!/bin/bash

source .env; echo $USER; echo $PASS

#Update packages
echo "Performing initial setup tasks"
echo "Updating packages"
apt-get update -y
apt-get upgrade -y
apt-get autoclean
apt-get install
echo "Package updates successful"

#Rename default user
echo "renaming pi user account to $USER"
groupadd $USER
usermod -d /home/$USER -m -g $USER -l $USER pi


#Secure SSH
groupadd ssh-users
echo "reconfiguring SSH"
usermod -aG ssh-users $USER
cd /etc/ssh
rm ssh_host_*key*
ssh-keygen -t ed25519 -f ssh_host_ed25519_key -N "" < /dev/null
ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key -N "" < /dev/null
cd /home/$USER
echo "copying custom ssh configs"
cp /home/$USER/ssh_config /etc/ssh_config 
cp /home/$USER/sshd_config /etc/sshd_config 

echo "restarting ssh server"
service restart sshd
