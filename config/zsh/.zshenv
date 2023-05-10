# Add this to /etc/zsh/zshenv or /etc/zshenv
# and avoid the need for any dotfiles in your HOME
# export ZDOTDIR=$HOME/.config/zsh

# Zsh will read commands from the following files in this order by default,
# provided they exist.
# /etc/zsh or /etc depends on the system used (e.g. arch /etc/zsh & macos /etc)
# Details see https://wiki.archlinux.org/title/Zsh#Startup/Shutdown_files
# - /etc/zsh/zshenv or /etc/zshenv
# - $ZDOTDIR/.zshenv 
# - /etc/zsh/zprofile or /etc/zprofile
# - $ZDOTDIR/.zprofile
# - /etc/zsh/zshrc or /etc/zshrc
# - $ZDOTDIR/.zshrc
# - /etc/zsh/zlogin or /etc/zlogin
# - $ZDOTDIR/.zlogin
# - $ZDOTDIR/.zlogout
# - /etc/zsh/zlogout or /etc/zlogout

# XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
if [ "$(uname)" = "Linux" ] ; then
  export XDG_RUNTIME_DIR="/run/user/$UID"
fi

# Lighdm not supported
# export USERXSESSION=$XDG_CACHE_HOME/X11/xsession
# export USERXSESSIONRC=$XDG_CACHE_HOME/X11/xsessionrc
# export ALTUSERXSESSION=$XDG_CACHE_HOME/X11/Xsession
# export ERRFILE=$XDG_CACHE_HOME/X11/xsession-errors
#

# Localization
# add these to /etc/environment for lighdm to correctly
# display the locale
# export LANG=zh_CN.UTF-8
# export LANGUAGE=zh_CN:en_US

export ANDROID_HOME="$XDG_DATA_HOME/android"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  # export EDITOR='mvim'
  export EDITOR="nvim"
fi
export ELM_HOME="$XDG_CONFIG_HOME/elm"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
[[ ":$JULIA_DEPOT_PATH:" =~ ":$XDG_DATA_HOME/julia:" ]] ||
  export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia${JULIA_DEPOT_PATH:+:$JULIA_DEPOT_PATH}"
export JULIA_PKG_SERVER="https://mirrors.sjtug.sjtu.edu.cn/julia/"
export JULIA_SSL_NO_VERIFY_HOSTS="mirrors.sjtug.sjtu.edu.cn"
# export JULIAUP_SERVER="https://mirrors.tuna.tsinghua.edu.cn/julia-releases"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
# export MANPATH="/usr/local/man:$MANPATH"
export MINIKUBE_HOME="$XDG_DATA_HOME/minikube"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export PULSE_COOKIE="$XDG_CONFIG_HOME/pulse/cookie"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export RANDFILE="$XDG_STATE_HOME/openssl/rnd"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
export ZSH="$XDG_DATA_HOME/oh-my-zsh"

# System-specific env vars
# if [ "$(uname)" = "Linux" ] ; then
  # Archlinux
# elif [ "$(uname)" = "Darwin" ] && [ -x "$(command -v brew)" ] ; then
# elif [ "$(uname)" = "Darwin" ] ; then
  # Macos
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export SKLEARNEX_VERBOSE="INFO"

# Proxy
# export http_proxy=http://127.0.0.1:1087
# export https_proxy=http://127.0.0.1:1087


# PATH
append_path () {
  # https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02
  [[ ":$PATH:" =~ ":$1:" ]] || PATH="${PATH:+$PATH:}$1"
}

prepend_path () {
  [[ ":$PATH:" =~ ":$1:" ]] || PATH="$1${PATH:+:$PATH}"
}

prepend_path "$CARGO_HOME/bin"
prepend_path "$HOME/.bin"

# System-specific PATH
if [ "$(uname)" = "Linux" ] ; then
elif [ "$(uname)" = "Darwin" ] ; then
# prepend_path "/Applications/factor"
# prepend_path "/opt/metasploit-framework/bin"
  append_path "/usr/local/anaconda3/bin"
  append_path "/usr/local/Cellar/llvm/13.0.1_1/bin"
  append_path "/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"
  append_path "/usr/local/opt/openssl@1.1/bin"
fi

append_path "${XDG_DATA_HOME}/npm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
append_path "$HOME/.rvm/bin"

unset append_path
unset prepend_path
