# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
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
# zsh cmd echos: https://stackoverflow.com/questions/30940299/zsh-repeats-command-in-output
DISABLE_AUTO_TITLE="true"

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
plugins=(autojump zsh-autosuggestions git vscode rust cp npm brew tmux tmuxinator node dotenv dash ripgrep docker docker-compose docker-machine)

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

alias zshconf="nvim ~/.zshrc"
alias alaconf="nvim ~/.config/alacritty/alacritty.yml"

# -- exa alias
alias ls="exa"
alias lll="exa -la"
# -- nvim alias
alias e="nvim"
alias n="neofetch"
alias py="python"
alias u="aupdate"

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
alias mux="tmuxinator"
alias macode="tmuxinator macode"
alias tmuxconf="nvim ~/.tmux.conf"

# export http_proxy=http://127.0.0.1:1087
# export https_proxy=http://127.0.0.1:1087

export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/opt/metasploit-framework/bin:$PATH"
export PATH="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH"

if [ -x "$(command -v brew)" ] ; then
    # nvim install by brew
    export PATH="/usr/local/Cellar/llvm/12.0.1/bin:$PATH"
    export NVIMRUNTIME="/usr/local/Cellar/neovim/0.7.0/share/nvim/runtime"
else
    export NVIMRUNTIME="/usr/share/nvim/runtime"
fi

export SKLEARNEX_VERBOSE=INFO

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


export EDITOR="nvim"

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

