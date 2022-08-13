sudo pacman -S pacman-contrib --noconfirm --needed
sudo pacman -S paru --noconfirm --needed

paru -S archlinuxcn-keyring --noconfirm --needed
paru -S nftables --noconfirm --needed
sudo systemctl enable nftables

paru -S picom-jonaburg-git --noconfirm --needed

paru -S lightdm lightdm-webkit-theme-litarvan --noconfirm --needed
PATTERN="antergos"
REPLACEMENT="litarvan"
sudo sed -i "s/$PATTERN/$REPLACEMENT/g" /etc/lightdm/lightdm-webkit2-greeter.conf
sudo systemctl enable lightdm.service

paru -S betterlockscreen --noconfirm --needed
betterlockscreen -u /usr/share/backgrounds/archlinux

paru -S awesome --noconfirm --needed
paru -S lain-git --noconfirm --needed

paru -S xdg-utils --noconfirm --needed
paru -S alsa-utils --noconfirm --needed
paru -S volumeicon --noconfirm --needed
paru -S nm-applet --noconfirm --needed
paru -S pcmanfm --noconfirm --needed
paru -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-material-color --noconfirm --needed

paru -S peazip --noconfirm --needed
paru -S fd --noconfirm --needed
paru -S tree --noconfirm --needed
paru -S ranger --noconfirm --needed
paru -S exa --noconfirm --needed
paru -S ripgrep --noconfirm --needed

paru -S htop --noconfirm --needed
paru -S neofetch --noconfirm --needed

paru -S alacritty --noconfirm --needed
paru -S neovim --noconfirm --needed
paru -S tmux --noconfirm --needed

paru -S firefox-developer-edition firefox-developer-edition-i18n-zh-cn --noconfirm --needed
paru -S brave-bin --noconfirm --needed

paru -S clash-for-windows-chinese --noconfirm --needed
