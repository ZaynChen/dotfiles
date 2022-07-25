#!/bin/bash

# Colorize output
PATTERN="#Color"
REPLACEMENT="Color"
sudo sed -i "s/$PATTERN/$REPLACEMENT/g" /etc/pacman.conf

# Add archlinuxcn repo
if [ -z "$(grep -i "archlinuxcn" /etc/pacman.conf)" ]; then
  echo '[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch' | sudo tee -a /etc/pacman.conf
fi

# Setup mirrors
sudo pacman -S reflector --noconfirm --needed
sudo reflector --sort rate --threads 100 -c China --save /etc/pacman.d/mirrorlist
