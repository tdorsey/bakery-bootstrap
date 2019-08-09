#!/bin/bash
FLASH_VERSION=2.2.0
HYPRIOT_VERSION=1.10.0
FLASH_PATH='/usr/local/bin/flash'

if test "$#" -ne 2
 then
    echo "Usage: $0 <CLOUD-INIT> <BLOCK DEVICE>"
    exit 1
fi

#Install dependencies
sudo apt-get install -y pv curl python-pip unzip hdparm


#Install flash
curl -LO https://raw.githubusercontent.com/hypriot/flash/$FLASH_VERSION/flash
chmod +x flash
mv flash $FLASH_PATH

#Flash the drive
flash -u $1 -d $2 https://github.com/hypriot/image-builder-rpi/releases/download/v$HYPRIOT_VERSION/hypriotos-rpi-v$HYPRIOT_VERSION.img.zip



