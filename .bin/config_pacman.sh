#!/bin/bash
sudo pacman -Syu

# Colorize output
PATTERN="#Color"
REPLACEMENT="Color"
sudo sed -i "/$PATTERN/c\
$REPLACEMENT" /etc/pacman.conf

# Add archlinuxcn repo
if [ -z "$(cat /etc/pacman.conf | grep -i archlinuxcn)" ]
then
  sudo sed -i '$a\
[archlinuxcn]\
Server = https://repo.archlinuxcn.org/$arch' /etc/pacman.conf
fi

# setup mirrors
sudo pacman -S reflector --noconfirm --needed
sudo reflector --sort rate --threads 100 -c China --save /etc/pacman.d/mirrorlist