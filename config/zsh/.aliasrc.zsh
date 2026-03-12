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
alias se="sudoedit"
alias nf="fastfetch"
alias ff="fastfetch"
alias u="aupdate.sh"

alias gdb=gdb -n -x $XDG_CONFIG_HOME/gdb/init

# system-specific alias
if [ "$(uname)" = "Linux" ] ; then
  alias open="xdg-open"
elif [ "$(uname)" = "Darwin" ] && [ -x "$(command -v brew)" ] ; then
fi
