set fish_greeting ""

export XDG_CONFIG_HOME=$HOME/.config
# editor
export EDITOR="nvim"
export VISUAL="nvim"

starship init fish | source

fish_vi_key_bindings
