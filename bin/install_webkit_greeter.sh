#!/usr/bin/env bash

cd $XDG_CACHE_HOME/paru/clone
git clone https://github.com/ZaynChen/webkit-greeter.git --recursive
cd webkit-greeter
./install.sh
