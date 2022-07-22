#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run picom
run volumeicon
run cfw
run fcitx5
run light-locker
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
