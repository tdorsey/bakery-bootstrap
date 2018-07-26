#!/bin/bash
#	FLASH_VERSION=2.1.1
#HYPRIOT_VERSION=1.9.0

if test "$#" -ne 2
 then
    echo "Usage: $0 <FLASH_VERSION> <HYPRIOT_VERSION>"
    exit 1
fi

#Install dependencies
sudo apt-get install -y pv curl python-pip unzip hdparm

FLASH_PATH='/usr/local/bin/flash'
echo $FLASH_PATH
FLASH_VERSION=$1
HYPRIOT_SEMVER=$2
#Install flash
curl -LO https://github.com/hypriot/flash/releases/download/$1/flash
chmod +x flash
sudo mv flash $FLASH_PATH

flash https://github.com/hypriot/image-builder-rpi/releases/download/v$HYPRIOT_SEMVER/hypriotos-rpi-v$HYPRIOT_SEMVER.img.zip


