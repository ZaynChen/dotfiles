# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/zaynchen/.oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="af-magic"
# ZSH_THEME="simple"
# ZSH_THEME="muse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# tmux conf
# ZSH_TMUX_AUTOSTART=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# osx unsupported in the alacritty terminal
plugins=(autojump zsh-autosuggestions git rust vscode rust cp npm brew node dotenv dash ripgrep docker docker-compose docker-machine)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias zshconfig="nvim ~/.zshrc"

alias ala="nvim ~/.config/alacritty/"
alias alaconfig="nvim ~/.config/alacritty/alacritty.yml"
# alias alacolor="nvim ~/.config/alacritty/config/3colorscheme.yml"
# alias alafont="nvim ~/.config/alacritty/config/2font.yml"
# alias alamouse="nvim ~/.config/alacritty/config/8mouse.yml"
# alias alakey="nvim ~/.config/alacritty/config/10key.yml"

# -- exa alias
alias ls="exa"
alias lll="exa -la"
# -- nvim alias
alias e="nvim"
alias n="neofetch"
alias py="python"

# -- riscv-gnu-toolchain alias
alias addr2linerv64="riscv64-unknown-elf-addr2line"
alias arrv64="riscv64-unknown-elf-ar"
alias asrv64="riscv64-unknown-elf-as"
alias gccrv64="riscv64-unknown-elf-gcc"
alias gdbrv64="riscv64-unknown-elf-gdb"
alias ldrv64="rsicv64-unknown-elf-ld"
alias ld.bfdrv64="riscv64-unknown-elf-ld.bfd"
alias nmrv64="riscv64-unknown-elf-nm"
alias objcopyrv64="riscv64-unknown-elf-objcopy"
alias objdumprv64="riscv64-unknown-elf-objdump"
alias ranlibrv64="riscv64-unknown-elf-ranlib"
alias readelfrv64="riscv64-unknown-elf-readelf"
alias striprv64="riscv64-unknown-elf-strip"
# -- qemu riscv alias
alias qemurv64="qemu-system-riscv64"
alias aura="sudo aura"

# export http_proxy=http://127.0.0.1:1087
# export https_proxy=http://127.0.0.1:1087

# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
# export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize
export PATH="/usr/local/Cellar/llvm/12.0.1/bin:$PATH"
export PATH="/opt/metasploit-framework/bin:$PATH"
export PATH="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH"
# export PATH="/usr/local/opt/python@3.9/bin:$PATH"

# export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
# export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
# export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# TODO brew linux
# export NVIMRUNTIME="/usr/local/Cellar/neovim/0.7.0/share/nvim/runtime"
export NVIMRUNTIME="/usr/share/nvim/runtime"
export SKLEARNEX_VERBOSE=INFO

# TODO check if macos needed
# [ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# export HOMEBREW_GITHUB_API_TOKEN=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
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# export PATH="/Applications/factor:$PATH"
#
neofetch

