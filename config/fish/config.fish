if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    fish_config prompt choose arrow
    fish_config theme choose base16-default

    fish_add_path -p $CARGO_HOME/bin
    fish_add_path -p $HOME/.bin

    fish_add_path -a $XDG_DATA_HOME/npm/bin
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    fish_add_path -a $rvm_path/bin
    rvm default

    zoxide init fish --cmd j | source
    fish_vi_key_bindings
end

if status is-login
    fastfetch
end
