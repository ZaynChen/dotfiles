#!/usr/bin/env bash

sudo pacman -S paru --noconfirm --needed
sudo paru -S --needed - < ./basepkgs.txt

curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles

systemctl enable nftables
systemctl enable NetworkManager
timedatectl set-ntp true

# using D-Bus to set Localization of user's session, need relogin
busctl call org.freedesktop.Accounts /org/freedesktop/Accounts/User$UID org.freedesktop.Accounts.User SetLanguage s zh_CN.UTF-8

install_greetd() {
  paru -S greetd --noconfirm --needed
  systemctl enable greetd

  CURR_DIR=$(pwd)
  CLONE_DIR=$XDG_CACHE_HOME/paru/clone
  cd $CLONE_DIR
  git clone https://github.com/ZaynChen/webkit-greeter.git --recursive
  cd webkit-greeter
  ./install.sh
  cd $CURR_DIR
}

install_greetd
