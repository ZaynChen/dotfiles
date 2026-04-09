#!/usr/bin/env bash

curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh

pacman -S linux-cachyos cachyos-kernel-manager cachyos-settings --needed

# disable zswap
FIND="^GRUB_CMDLINE_LINUX_DEFAULT=\".*\"$"
REPLACE="GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet zswap.enabled=0\""
sudo sed -i "s/$FIND/$REPLACE/" /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg
