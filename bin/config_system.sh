#!/usr/bin/env bash

paru -S nftables network-manager-applet greetd --noconfirm --needed
systemctl enable nftables NetworkManager greetd
timedatectl set-ntp true

# using D-Bus to set Localization of user's session, need relogin
busctl call org.freedesktop.Accounts /org/freedesktop/Accounts/User$EUID org.freedesktop.Accounts.User SetLanguage s zh_CN.UTF-8

paru -S juliaup --noconfirm --needed
juliaup add release
julia -e 'using Pkg; Pkg.add("LanguageServer")'

paru -S steam --noconfirm --needed
steam-runtime --reset
