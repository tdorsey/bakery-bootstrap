#!/bin/bash

cd ansible/playbooks
ansible-playbook  -l  local semaphore.yml
ansible-playbook  -l  local tftp.yml
