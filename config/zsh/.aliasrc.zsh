# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias zshenv="$EDITOR $ZDOTDIR/.zshenv"
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
alias zshalias="$EDITOR $ZDOTDIR/.aliasrc.zsh"
alias zlogin="$EDITOR $ZDOTDIR/.zlogin"
alias alaconf="$EDITOR $XDG_CONFIG_HOME/alacritty/alacritty.toml"

if [ -x "$(command -v eza)" ] ; then
  alias l="eza -lah --group-directories-first"
  alias la="eza -laah --group-directories-first"
  alias ll="eza -lh --group-directories-first"
  alias ls="eza --group-directories-first"
fi
alias e="$EDITOR"
alias nf="fastfetch"
alias ff="fastfetch"
alias u="aupdate.sh"

alias gdb=gdb -n -x $XDG_CONFIG_HOME/gdb/init
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

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

# system-specific alias
if [ "$(uname)" = "Linux" ] ; then
  alias open="xdg-open"
elif [ "$(uname)" = "Darwin" ] && [ -x "$(command -v brew)" ] ; then
fi
