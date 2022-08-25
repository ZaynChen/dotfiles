# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# ZSH_CUSTOM=$ZSH/custom

# tmux conf
# ZSH_TMUX_AUTOSTART=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# osx unsupported in the alacritty terminal
plugins=(git vscode rust cp npm brew tmux tmuxinator node dotenv dash ripgrep docker docker-compose docker-machine zsh-autosuggestions zsh-syntax-highlighting) # zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# bindkey -v
# ZVM_KEYTIMEOUT=0.05
# ZVM_ESCAPE_KEYTIMEOUT=0.04
# ZVM_INIT_MODE=sourcing

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias zshconf="nvim $ZDOTDIR/.zshrc"
alias zshenv="nvim $ZDOTDIR/.zshenv"
alias sourcezsh="source $ZDOTDIR/.zshrc"
alias alaconf="nvim $XDG_CONFIG_HOME/alacritty/alacritty.yml"
# alias tmuxconf="nvim $XDG_CONFIG_HOME/tmux/tmux.conf"

alias ls="exa"
alias lll="exa -la"
alias e="nvim"
alias n="neofetch"
alias py="python"
alias u="aupdate.sh"
alias mux="tmuxinator"

alias macode="tmuxinator macode"

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
alias qemusysrv64="qemu-system-riscv64"
alias qemurv64="qemu-riscv64"

alias gdb=gdb -n -x $XDG_CONFIG_HOME/gdb/init

# system-specific alias
if [ "$(uname)" = "Linux" ] ; then
  alias open="xdg-open"
elif [ "$(uname)" = "Darwin" ] && [ -x "$(command -v brew)" ] ; then
fi

neofetch

eval "$(zoxide init zsh --cmd j)"
