#!/bin/bash

echo "Setup Proxy..."
export https_proxy=http://127.0.0.1:7893 http_proxy=http://127.0.0.1:7893
echo https_proxy=$https_proxy
echo http_proxy=$http_proxy
echo all_proxy=$all_proxy
echo

if [ -x "$(command -v brew)" ] ; then
  echo "Homebrew Updating..."
  brew update
  echo
  brew upgrade
  echo ""
elif [ -x "$(command -v paru)" ] ; then
  echo "Paru Updating..."
  paru -Syyu --noconfirm
  echo
elif [ -x "$(command -v pacman)" ] ; then
  echo "Pacman Updating..."
  sudo pacman -Syyu --noconfirm
  echo
fi

if [ -x "$(command -v rustup)" ] ; then
  echo "Rustup Updating..."
  rustup update
  echo
fi

echo "Updating Complete!"
