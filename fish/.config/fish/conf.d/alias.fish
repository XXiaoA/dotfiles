alias lg=lazygit
alias cl=clear
alias yt=yt-dlp
alias v=nvim
alias rd=rmdir
alias hy=hyperfine
alias x=extract

alias cp="cp -i"
alias md="mkdir -p"
alias week='date +%V'


alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

if command -sq batcat
    alias bat=batcat
    alias cat="batcat -pp"
end
if command -sq bat
    alias cat="bat -pp"
end

if command -sq exa
    alias ls="exa --color=auto"
    alias l='exa -lbah --icons'
    alias la='exa -labgh --icons'
    alias ll='exa -lbg --icons'
    alias lsa='exa -lbagR --icons'
    alias lst='exa -lTabgh --icons' # 输入lst,将展示类似于tree的树状列表。

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
alias tt "tmux a -t"
alias tn "tmux new"
alias tl "tmux list-sessions"
alias tk "tmux kill-session -t"
alias tka='tmux kill-server'
alias tconf='$EDITOR $HOME/.tmux.conf'
