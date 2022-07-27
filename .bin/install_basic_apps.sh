sudo pacman -S paru --noconfirm --needed

sudo paru -S archlinuxcn-keyring --noconfirm --needed

sudo paru -S picom --noconfirm --needed

sudo paru -S lightdm lightdm-webkit-theme-litarvan --noconfirm --needed
PATTERN="antergos"
REPLACEMENT="litarvan"
sudo sed -i "s/$PATTERN/$REPLACEMENT/g" /etc/lightdm/lightdm-webkit2-greeter.conf
sudo systemctl enable lightdm.service

sudo paru -S betterlockscreen --noconfirm --needed
betterlockscreen -u /usr/share/backgrounds/archlinux

sudo paru -S awesome --noconfirm --needed
sudo paru -S lain-git --noconfirm --needed

sudo paru -S xdg-utils --noconfirm --needed
sudo paru -S alsa-utils --noconfirm --needed
sudo paru -S volumeicon --noconfirm --needed
sudo paru -S pcmanfm --noconfirm --needed
sudo paru -S fcitx5 fcitx5-chinese-addons fcitx5-nord --noconfirm --needed

sudo paru -S peazip --noconfirm --needed
sudo paru -S fd --noconfirm --needed
sudo paru -S ranger --noconfirm --needed
sudo paru -S exa --noconfirm --needed
sudo paru -S ripgrep --noconfirm --needed

sudo paru -S htop --noconfirm --needed
sudo paru -S neofetch --noconfirm --needed

sudo paru -S alacritty --noconfirm --needed
sudo paru -S tmux --noconfirm --needed

sudo paru -S firefox-developer-edition firefox-developer-edition-i18n-zh-cn --noconfirm --needed

sudo paru -S clash-for-windows-chinese --noconfirm --needed
