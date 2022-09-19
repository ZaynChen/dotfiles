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
# run light-locker