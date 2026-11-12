#!/usr/bin/env bash

paru -S --needed - < ./pkgs_cli.txt
paru -S --needed - < ./pkgs_gui.txt

# # video editor
# paru -S kdenlive --noconfirm --needed
# # image editor
# paru -S gimp --noconfirm --needed
# # virtual machine for linux, kvm
# paru -S virt-manager --noconfirm --needed
# # slideshow
# paru -S impressive --needed
