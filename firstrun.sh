#!/bin/bash
echo "Performing initial setup tasks"
echo "Updating packages"
apt-get update -y
apt-get upgrade -y
apt-get autoclean
apt-get install
echo "Package updates successful"
