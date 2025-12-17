set fish_greeting ""

export XDG_CONFIG_HOME=$HOME/.config

export MANPAGER='nvim +Man!'

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# fcitx5 (don't need for wayland)
if test "$XDG_SESSION_TYPE" = x11
    set -x GTK_IM_MODULE fcitx
    set -x QT_IM_MODULE fcitx
    set -x XMODIFIERS @im=fcitx
    set -x SDL_IM_MODULE fcitx
    set -x GLFW_IM_MODULE ibus
end

# Clash
export http_proxy=http://127.0.0.1:7890
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

fish_add_path ~/.cargo/bin/
fish_add_path ~/.local/share/nvim/mason/bin/
fish_add_path ~/.local/bin/
fish_add_path ~/dotfiles/scripts/

fish_vi_key_bindings
set -g fish_vi_force_cursor 1
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

starship init fish | source

set -x _ZO_ECHO 1
zoxide init fish | source
