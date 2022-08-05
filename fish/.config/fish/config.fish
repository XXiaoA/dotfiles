set fish_greeting ""

export XDG_CONFIG_HOME=$HOME/.config

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# fcitx5
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# Clash
export https_proxy=http://127.0.0.1:7890
export http_proxy=$https_proxy

set -g fish_user_paths ~/.cargo/bin/ $fish_user_paths
set -g fish_user_paths ~/.local/share/nvim/mason/bin/ $fish_user_paths

fish_vi_key_bindings
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# https://issuehint.com/issue/fish-shell/fish-shell/8981
if status is-interactive
    if string match -q -- 'tmux*' $TERM
        set -g fish_vi_force_cursor 1
    end
end

starship init fish | source
zoxide init fish | source
