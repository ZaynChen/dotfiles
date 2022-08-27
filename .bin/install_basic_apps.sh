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
# Localization
[ -f /etc/environment ] &&
  [ -z "$(grep "LANG=" /etc/environment)" ] &&
  echo "
LANG=zh_CN.UTF-8
LANGUAGE=zh_CN:en_US" | sudo tee -a /etc/environment

paru -S betterlockscreen --noconfirm --needed
betterlockscreen -u /usr/share/backgrounds/archlinux

paru -S awesome --noconfirm --needed
paru -S lain-git --noconfirm --needed

paru -S xdg-utils --noconfirm --needed
paru -S alsa-utils --noconfirm --needed
paru -S volumeicon --noconfirm --needed
paru -S network-manager-applet --noconfirm --needed
paru -S pcmanfm --noconfirm --needed
paru -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-material-color --noconfirm --needed
[ -f /etc/profile.d/fcitx5.sh ] ||
  echo "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx # SDL2
export GLFW_IM_MODULE=ibus # kitty" | sudo tee /etc/profile.d/fcitx5.sh

# Archive tool
paru -S peazip --noconfirm --needed
# RS replacement for find
paru -S fd --noconfirm --needed
paru -S tree --noconfirm --needed
paru -S ranger --noconfirm --needed
# RS replacement for ls
paru -S exa --noconfirm --needed
paru -S ripgrep --noconfirm --needed
# RS tldr man pages
paru -S tealdeer --noconfirm --needed
# RS A replacement for autojump
paru -S zoxide --noconfirm --needed
# Clipboard tool
paru -S xsel --noconfirm --needed

# RS A more intuitive version of du in rust
paru -S dust --noconfirm --needed
# RS A modern replacement for ps
paru -S procs --noconfirm --needed
# RS graphical process/system monitor for the terminal, inspired by htop
paru -S bottom --noconfirm --needed
paru -S htop --noconfirm --needed
paru -S neofetch --noconfirm --needed
# RS terminal bandwidth utilization tool
paru -S bandwhich --noconfirm --needed

paru -S alacritty --noconfirm --needed
paru -S neovim --noconfirm --needed
paru -S tmux --noconfirm --needed

paru -S firefox-developer-edition firefox-developer-edition-i18n-zh-cn --noconfirm --needed
# Chromium-based browser, focus on privacy
paru -S brave-bin --noconfirm --needed

paru -S clash-for-windows-chinese --noconfirm --needed

# RS code statistic tool
paru -S tokei --noconfirm --needed
# RS terminal benchmark tool
paru -S hyperfine --noconfirm --needed
# RS regex expression generator
paru -S grex --noconfirm --needed
# RS viewer for git diff grep colorization
paru -S git-delta --noconfirm --needed
