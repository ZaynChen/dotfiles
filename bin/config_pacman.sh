#!/bin/bash

# Colorize output
PATTERN="^#Color$"
FIND="^#"
REPLACE=""
sudo sed -i "/$PATTERN/s/$FIND/$REPLACE/g" /etc/pacman.conf

# Enable multilib
PATTERN="^#\[multilib\]/,/^$"
FIND="^#"
REPLACE=""
sudo sed -i "/$PATTERN/s/$FIND/$REPLACE/g" /etc/pacman.conf

# Add archlinuxcn repo
if [ -z "$(grep -i "archlinuxcn" /etc/pacman.conf)" ]; then
  echo '
[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch' | sudo tee -a /etc/pacman.conf
fi

sudo pacman -S archlinuxcn-keyring --noconfirm --needed
sudo pacman -Sy

# Setup mirrors
sudo pacman -S reflector --noconfirm --needed
sudo reflector --sort rate --threads 100 -c China --save /etc/pacman.d/mirrorlist
