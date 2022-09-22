#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run picom --experimental-backends
run volumeicon
run nm-applet
run cfw
run fcitx5
# run $XDG_CONFIG_HOME/polybar/launch.sh --cust &
run light-locker
