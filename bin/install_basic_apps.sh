sudo pacman -S pacman-contrib --noconfirm --needed
sudo pacman -S paru --noconfirm --needed

paru -S iptables-nft --needed
sudo systemctl enable nftables
timedatectl set-ntp true

paru -S picom-git --noconfirm --needed

paru -S lightdm --noconfirm --needed
paru -S base-devel meson ninja libyaml --noconfirm --needed
paru -S nodejs npm typescript --noconfirm --needed
paru -S webkitgtk-6.0 --noconfirm --needed
CURR_DIR=$(pwd)
CLONE_DIR=$XDG_CACHE_HOME/paru/clone
cd $CLONE_DIR
git clone https://github.com/ZaynChen/lightdm-webkit-greeter.git --recursive
cd lightdm-webkit-greeter
./install.sh
cd $CURR_DIR

FIND="^#greeter-session=example-gtk-gnome"
REPLACE="greeter-session=lightdm-webkit-greeter"
sudo sed -i "s/$FIND/$REPLACE/" /etc/lightdm/lightdm.conf
FIND="^#user-authority-in-system-dir=false"
REPLACE="user-authority-in-system-dir=true"
sudo sed -i "s/$FIND/$REPLACE/" /etc/lightdm/lightdm.conf
PATTERN="^greeter:$/,/^$"
FIND="gruvbox"
REPLACE="litarvan"
sudo sed -i "/$PATTERN/s/$FIND/$REPLACE/" /etc/lightdm/web-greeter.yml
grep -q "NaturalScrolling" /usr/share/X11/xorg.conf.d/40-libinput.conf ||
  sudo sed -i "/libinput pointer catchall/a\        Option \"NaturalScrolling\" \"true\"" /usr/share/X11/xorg.conf.d/40-libinput.conf
sudo systemctl enable lightdm.service
paru -S light-locker --noconfirm --needed

# black screen issue, https://gitlab.archlinux.org/archlinux/packaging/packages/webkit2gtk/-/issues/1
if [ -e /etc/environment ]; then
  grep -q "WEBKIT_DISABLE_DMABUF_RENDERER" ||
    echo "WEBKIT_DISABLE_DMABUF_RENDERER=1" | sudo tee -a /etc/environment
else
  echo "WEBKIT_DISABLE_DMABUF_RENDERER=1" | sudo tee /etc/environment
fi

# if [ -e /etc/environment ]; then
#   grep -q "LANG=" /etc/environment ||
#     echo "
# LANG=zh_CN.UTF-8
# LANGUAGE=zh_CN:en_US
# WEBKIT_DISABLE_DMABUF_RENDERER=1" | sudo tee -a /etc/environment
# else
#   echo "
# LANG=zh_CN.UTF-8
# LANGUAGE=zh_CN:en_US
# WEBKIT_DISABLE_DMABUF_RENDERER=1" | sudo tee /etc/environment
# fi

# Localization
# using accountsserice to set the language of lightdm-webkit2-greeter
# in order to deal with language ambigious, e.g. lightdm.language = "中文"
# when the actual language is "zh_CN" or "zh_TW"
paru -S accountsservice --noconfirm --needed
# using D-Bus to set Localization of user's session, need relogin
busctl call org.freedesktop.Accounts /org/freedesktop/Accounts/User$UID org.freedesktop.Accounts.User SetLanguage s zh_CN.UTF-8
# if sudo test -e /var/lib/AccountsService/users/$USER; then
#   sudo grep -q "Language" /var/lib/AccountsService/users/$USER ||
#     echo "Language=zh_CN.UTF-8" | sudo tee -a /var/lib/AccountsService/users/$USER
# fi

# audio middleware pulseaudio replacement
paru -S pipewire lib32-pipewire --noconfirm --needed
paru -S pipewire-audio pipewire-alsa pipewire-pulse --noconfirm --needed
paru -S gnome-keyring --noconfirm --needed
paru -S seahorse --noconfirm --needed
paru -S openssh --noconfirm --needed

paru -S betterlockscreen --noconfirm --needed
paru -S archlinux-wallpaper --noconfirm --needed
betterlockscreen -u /usr/share/backgrounds/archlinux

# awesomewm will use packages installed by luarocks
paru -S luarocks --noconfirm --needed
sudo luarocks install lain
# paru -S lain-git --noconfirm --needed
# paru -S awesome --noconfirm --needed
paru -S awesome-git --noconfirm --needed
paru -S hyprland-git hyprpaper waybar --noconfirm --needed
paru -S sherlock-launcher-git --noconfirm --needed

paru -S xdg-utils --noconfirm --needed
paru -S alsa-utils --noconfirm --needed
paru -S volumeicon --noconfirm --needed
paru -S network-manager-applet --noconfirm --needed
systemctl enable NetworkManager
paru -S pcmanfm --noconfirm --needed
paru -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-material-color --noconfirm --needed
[ -f /etc/profile.d/fcitx5.sh ] ||
  echo "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx # SDL2
export GLFW_IM_MODULE=ibus # kitty" | sudo tee /etc/profile.d/fcitx5.sh

paru -S wget --noconfirm --needed
# Archive tool
paru -S peazip --noconfirm --needed
# RS replacement for find
paru -S fd --noconfirm --needed
paru -S tree --noconfirm --needed
paru -S ranger --noconfirm --needed
# RS replacement for ls, exa
paru -S eza --noconfirm --needed
paru -S ripgrep --noconfirm --needed
# RS replacement for cat
paru -S bat bat-extras --noconfirm --needed
paru -S man --noconfirm --needed
# RS tldr man pages
paru -S tealdeer --noconfirm --needed
# RS A replacement for autojump
paru -S zoxide --noconfirm --needed
# Clipboard tool
paru -S xsel --noconfirm --needed
paru -S wl-clipboard --noconfirm --needed
paru -S xdg-ninja glow --noconfirm --needed

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
paru -S hardinfo --noconfirm --needed
paru -S dmidecode --noconfirm --needed

paru -S alacritty --noconfirm --needed
paru -S neovim --noconfirm --needed
paru -S python-pip --noconfirm --needed
paru -S python-pynvim --noconfirm --needed
curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
paru -S tmux --noconfirm --needed

paru -S firefox-developer-edition firefox-developer-edition-i18n-zh-cn --noconfirm --needed
# Chromium-based browser, focus on privacy
# paru -S brave-bin --noconfirm --needed

# nc netcat utility, for ssh ProxyJump
paru -S openbsd-netcat --noconfirm --needed
# paru -S clash-for-windows-chinese --noconfirm --needed
paru -S mihomo-party --noconfirm --needed

# RS code statistic tool
paru -S tokei --noconfirm --needed
# RS terminal benchmark tool
paru -S hyperfine --noconfirm --needed
# RS regex expression generator
paru -S grex --noconfirm --needed
# RS viewer for git diff grep colorization
paru -S git-delta --noconfirm --needed

# video editor
paru -S kdenlive --noconfirm --needed
# image editor
paru -S gimp --noconfirm --needed
# virtual machine for linux, kvm
paru -S virt-manager --noconfirm --needed
# slideshow
paru -S impressive --needed

