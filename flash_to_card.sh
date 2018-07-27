#!/bin/bash
FLASH_VERSION=2.1.1
HYPRIOT_VERSION=1.9.0

if test "$#" -ne 2
 then
    echo "Usage: $0 <CLOUD-INIT> <BLOCK DEVICE>"
    exit 1
fi

#Install dependencies
sudo apt-get install -y pv curl python-pip unzip hdparm

FLASH_PATH='/usr/local/bin/flash'
#Install flash
curl -LO https://github.com/hypriot/flash/releases/download/$FLASH_VERSION/flash
chmod +x flash
sudo mv flash $FLASH_PATH

#Flash the drive
flash -u $1 -d $2 https://github.com/hypriot/image-builder-rpi/releases/download/v$HYPRIOT_SEMVER/hypriotos-rpi-v$HYPRIOT_VERSION.img.zip



