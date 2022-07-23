set fish_greeting ""

export XDG_CONFIG_HOME=$HOME/.config
# editor
export EDITOR="nvim"
export VISUAL="nvim"

set -g fish_user_paths ~/.cargo/bin/ $fish_user_paths

fish_vi_key_bindings

starship init fish | source
zoxide init fish | source
