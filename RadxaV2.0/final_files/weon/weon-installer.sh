#!/bin/bash 
#
# WeON Hotspot installer file
#
#

# Variables

NAME=grase-repo
VERSION=1.6
FILENAME="$NAME"_"$VERSION"_all.deb
URL=http://packages.grasehotspot.org/pool/main/g/grase-repo/
TMP_DIR=/tmp


# Install hostapd




# Install grase system

wget "$URL""$FILENAME" -P "$TMP_DIR"
dpkg -i "$TMP_DIR"/"$FILENAME"
apt-get update

apt-get dselect-upgrade
