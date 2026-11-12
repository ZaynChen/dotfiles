#!/usr/bin/env bash

sudo pacman -S paru --noconfirm --needed
paru -S --needed - < ./pkgs/base.txt
paru -S --needed - < ./pkgs/fonts.txt
paru -S --needed - < ./pkgs/de.txt
./install_webkit_greeter.sh

curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
