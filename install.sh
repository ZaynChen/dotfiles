# Directies and files should not exist before running this script
ln -s .config $XDG_CONFIG_HOME
ln -s .bin $HOME/.bin
ln -s .pam_enviroment $HOME/.pam_environment
ln -s .config/zsh/.zshenv $HOME/.zshenv
ln -s .xprofile $HOME/.xprofile

# oh-my-zsh
# compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
# zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
