paru -S zsh --noconfirm --needed
paru -S oh-my-zsh-git --noconfirm --needed
paru -S zsh-completions --noconfirm --needed
paru -S zsh-autosuggestions --noconfirm --needed
paru -S zsh-syntax-highlighting --noconfirm --needed
paru -S zsh-vi-mode --noconfirm --needed

sudo rm -r /usr/share/oh-my-zsh/custom/plugins
sudo ln -s /usr/share/zsh/plugins /usr/share/oh-my-zsh/custom/plugins
