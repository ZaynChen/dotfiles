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

# [ -f /etc/profile.d/fcitx5.sh ] ||
#   echo "export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx
# export SDL_IM_MODULE=fcitx # SDL2
# export GLFW_IM_MODULE=ibus # kitty" | sudo tee /etc/profile.d/fcitx5.sh


# install_lightdm() {
#   # a compositor for X11
#   paru -S picom-git --noconfirm --needed
#   paru -S lightdm --noconfirm --needed
#
#   CURR_DIR=$(pwd)
#   CLONE_DIR=$XDG_CACHE_HOME/paru/clone
#   cd $CLONE_DIR
#   git clone https://github.com/ZaynChen/lightdm-webkit-greeter.git --recursive
#   cd lightdm-webkit-greeter
#   ./install.sh
#   cd $CURR_DIR
#
#   FIND="^#greeter-session=example-gtk-gnome"
#   REPLACE="greeter-session=lightdm-webkit-greeter"
#   sudo sed -i "s/$FIND/$REPLACE/" /etc/lightdm/lightdm.conf
#   FIND="^#user-authority-in-system-dir=false"
#   REPLACE="user-authority-in-system-dir=true"
#   sudo sed -i "s/$FIND/$REPLACE/" /etc/lightdm/lightdm.conf
#   PATTERN="^greeter:$/,/^$"
#   FIND="gruvbox"
#   REPLACE="litarvan"
#   sudo sed -i "/$PATTERN/s/$FIND/$REPLACE/" /etc/lightdm/web-greeter.yml
#   grep -q "NaturalScrolling" /usr/share/X11/xorg.conf.d/40-libinput.conf ||
#     sudo sed -i "/libinput pointer catchall/a\        Option \"NaturalScrolling\" \"true\"" /usr/share/X11/xorg.conf.d/40-libinput.conf
#   systemctl enable lightdm.service
#   paru -S light-locker --noconfirm --needed
# }

# install_lightdm
