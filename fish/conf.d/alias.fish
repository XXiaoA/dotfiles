# alias for functions
alias x=extract

alias cp="cp -i"
alias md="mkdir -p"
alias week='date +%V'

if command -sq batcat
    alias bat=batcat
    alias cat="batcat -pp"
    alias ccat /usr/bin/cat
end
if command -sq bat
    alias cat="bat -pp"
    alias ccat /usr/bin/cat
end

if command -sq exa
    alias ls="exa --color=auto"
    alias l='exa -lh --icons'
    alias la='exa -lah --icons'
    alias lsa='exa -lbaR --icons'
    alias lst='exa -lTah --icons' # 输入lst,将展示类似于tree的树状列表。

    alias tree "exa -T"

else
    alias ls='ls --color=auto'
    # color should not be always.
    alias lst='tree -pCsh'
    alias l='ls -lah'
    alias la='ls -lAh'
    alias ll='ls -lh'
    alias lsa='ls -lah'
end

# tmux
alias tt "tmux a || tmux new -c"
alias ta "tmux a"
alias tn "tmux new -c"
alias tl "tmux list-sessions"
alias tk "tmux kill-session -t"
alias tka='tmux kill-server'

alias color_test "curl https://gist.githubusercontent.com/lilydjwg/fdeaf79e921c2f413f44b6f613f6ad53/raw/94d8b2be62657e96488038b0e547e3009ed87d40/colors.py | python"

# usage: command | clip
alias clip='curl -F "c=@-" "https://fars.ee/?u=1"'
