set fish_greeting ""

export XDG_CONFIG_HOME=$HOME/.config

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

# Clash
export https_proxy=http://127.0.0.1:7890
export http_proxy=$https_proxy

set -g fish_user_paths ~/.cargo/bin/ $fish_user_paths
set -g fish_user_paths ~/.local/share/nvim/mason/bin/ $fish_user_paths
set -g fish_user_paths ~/.local/bin/ $fish_user_paths

fish_vi_key_bindings
set -g fish_vi_force_cursor 1
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

starship init fish | source
zoxide init fish | source
