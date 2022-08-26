#!/usr/bin/env bash

# Directies and files should not exist before running this script
ln -s .bin $HOME/.bin
ln -s .config $XDG_CONFIG_HOME

# oh-my-zsh
# compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
# zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
