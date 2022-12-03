alias lg=lazygit
alias cl=clear
alias yt=yt-dlp
alias v=nvim
alias rd=rmdir
alias hy=hyperfine

# alias for functions
alias x=extract
alias vn=nvim_nightly

alias cp="cp -i"
alias md="mkdir -p"
alias week='date +%V'

if command -sq batcat
    alias bat=batcat
    alias cat="batcat -pp"
    alias ccat "/usr/bin/cat"
end
if command -sq bat
    alias cat="bat -pp"
    alias ccat "/usr/bin/cat"
end

if command -sq exa
    alias ls="exa --color=auto"
    alias l='exa -lbh --icons'
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
alias tt "tmux a"
alias tn "tmux new"
alias tl "tmux list-sessions"
alias tk "tmux kill-session -t"
alias tka='tmux kill-server'
alias tconf='$EDITOR $HOME/.tmux.conf'

if command -sq exa
    alias yay paru
end
