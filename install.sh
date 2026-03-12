#!/usr/bin/env bash

# Directies and files should not exist before running this script
ln -s $PWD/bin $HOME/.bin
ln -s $PWD/config $HOME/.config

# oh-my-zsh
# compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
# zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
