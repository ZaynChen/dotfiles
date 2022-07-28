sudo paru -S oh-my-zsh-git --noconfirm --needed
sudo paru -S autojump --noconfirm --needed
sudo paru -S zsh-completions-git --noconfirm --needed

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
