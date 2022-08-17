export ZDOTDIR=$HOME/.config/zsh

# XDG base directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR=/run/user/$UID

# Lighdm not supported
# export USERXSESSION=$XDG_CACHE_HOME/X11/xsession
# export USERXSESSIONRC=$XDG_CACHE_HOME/X11/xsessionrc
# export ALTUSERXSESSION=$XDG_CACHE_HOME/X11/Xsession
# export ERRFILE=$XDG_CACHE_HOME/X11/xsession-errors
#

export ANDROID_HOME=$XDG_DATA_HOME/android
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle
export CARGO_HOME=$XDG_DATA_HOME/cargo
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export ELM_HOME=$XDG_CONFIG_HOME/elm
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export HISTFILE=$XDG_STATE_HOME/zsh/history
export JULIA_DEPOT_PATH=$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export LESSHISTFILE=$XDG_CACHE_HOME/less/history
export MINIKUBE_HOME=$XDG_DATA_HOME/minikube
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PSQL_HISTORY=$XDG_DATA_HOME/psql_history
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite_history
export TERMINFO=$XDG_DATA_HOME/terminfo
export TERMINFO_DIRS=$XDG_DATA_HOME/terminfo:/usr/share/terminfo
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
export WAKATIME_HOME=$XDG_CONFIG_HOME/wakatime
