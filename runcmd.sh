#!/bin/bash

ANSIBLE=ansible
PLAYBOOKS=$ANSIBLE/playbooks
CONF=conf

#Secure SSH
rm -f /etc/ssh/ssh_host_dsa_key*
rm -f /etc/ssh/ssh_host_rsa_key*
rm -f /etc/ssh/ssh_host_rsa_key*
rm -f /etc/ssh/ssh_host_ed25519_key*

#Generate new host key with 100 rounds
#No passphrase, hide output
ssh-keygen -a 100 -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" < /dev/null

echo "copying custom ssh configs"
cp $CONF/ssh_config /etc/ssh_config
cp $CONF/sshd_config /etc/sshd_config

echo "restarting ssh server"
service sshd restart

#Local ansible Setting up

echo "Setting up local ansible"
echo "Installing roles from ansible galaxy"
ansible-galaxy install -r $ANSIBLE/requirements.yml

cd $PLAYBOOKS
shopt -s nullglob
for i in *.yml; do
    echo "Running ansible playbook $i"
    ansible-playbook -l local $i
done


