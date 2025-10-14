paru -S git zsh --noconfirm --needed
if [ -e /etc/zsh/zshenv ]; then
  grep -q "ZDOTDIR" /etc/zsh/zshenv ||
    echo "export ZDOTDIR=$XDG_CONFIG_HOME/zsh" | sudo tee -a /etc/zsh/zshenv
else
    echo "export ZDOTDIR=$XDG_CONFIG_HOME/zsh" | sudo tee /etc/zsh/zshenv
fi

git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-vi-mode
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/autoupdate
