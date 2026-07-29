set fish_greeting ""

set -gx XDG_CONFIG_HOME $HOME/.config

set -gx MANPAGER 'nvim +Man!'

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Fcitx5 is configured by Wayland natively; X11 clients still need these variables.
if test "$XDG_SESSION_TYPE" = x11
    set -x GTK_IM_MODULE fcitx
    set -x QT_IM_MODULE fcitx
    set -x XMODIFIERS @im=fcitx
    set -x SDL_IM_MODULE fcitx
    set -x GLFW_IM_MODULE ibus
end

# Local proxy
set -gx http_proxy http://127.0.0.1:7890
set -gx https_proxy $http_proxy
set -gx ftp_proxy $http_proxy
set -gx rsync_proxy $http_proxy
set -gx no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"

fish_add_path ~/.cargo/bin/
fish_add_path ~/.local/share/nvim/mason/bin/
fish_add_path ~/.local/bin/
fish_add_path ~/dotfiles/scripts/

fish_vi_key_bindings
set -g fish_vi_force_cursor 1
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

if command -q starship
    starship init fish | source
end

if command -q zoxide
    set -gx _ZO_ECHO 1
    zoxide init fish | source
end

if command -q direnv
    direnv hook fish | source
end
