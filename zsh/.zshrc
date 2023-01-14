### Added by Zinit's installer{{{
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk}}}

export ZINIT_PATH=$HOME/.local/share/zinit
export XDG_CONFIG_HOME=$HOME/.config
# editor
export EDITOR="nvim"
export VISUAL="nvim"

# Setopt
setopt correct
setopt autocd

setopt interactive_comments
########
zpcompinit
zpcdreplay
########
ALOXAF_FZF_TAB_EXTRA=true # {{{
# 当变量ALOXAF_FZF_TAB_EXTRA的值为01时，仅加载补全项颜色函数;为02时，加载右侧窗口配置;为true时，启用所有额外函数;为false时禁用。
#分组和补全项颜色
aloxaf_fzf_tab_extra_opt_01() {
    zstyle ':completion:*:descriptions' format '[%d]'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
}
###############
aloxaf_fzf_tab_extra_opt_02() {
    #FZF-TAB右侧窗口配置
    local extract="
# trim input
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"
    #zstyle ':fzf-tab:*' single-group ''
    #zstyle ':fzf-tab:complete:_zlua:*' query-string input
    zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
    zstyle ':fzf-tab:complete:(cd|ls|exa|bat|cat|nano|vi|vim):*' extra-opts --preview=$extract'ls -1 -A --color=always $realpath'
    #zstyle ':fzf-tab:complete:(cd|ls|nano|vi|vim):*' extra-opts --preview=$extract'ls -1A --color=auto ${~ctxt[hpre]}$in 2>/dev/null'
}
#################
check_fzf_tab_variable(){
case ${ALOXAF_FZF_TAB_EXTRA} in
false) ;;
true)
    aloxaf_fzf_tab_extra_opt_01
    aloxaf_fzf_tab_extra_opt_02
    ;;
01) aloxaf_fzf_tab_extra_opt_01 ;;
02) aloxaf_fzf_tab_extra_opt_02 ;;
esac
}
##################
check_fzf_tab_variable # }}}

####################

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_VI_SURROUND_BINDKEY=s-prefix

#(Short name F-Sy-H). Syntax-highlighting for Zshell – fine granularity, number of features, 40 work hours themes
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions


# Replace zsh's default completion selection menu with fzf!
zinit ice wait lucid
zinit light Aloxaf/fzf-tab

#This plugin defines the [z command](https://github.com/rupa/z) that tracks your most visited directories and allows you to access them with very few keystrokes.
zinit ice wait"2" lucid
zinit light rupa/z

zinit ice wait"2" lucid
zinit light mfaerevaag/wd

#The git plugin provides many aliases and a few useful functions.
zinit ice wait"2" lucid
zinit snippet OMZP::git

#This plugin defines a function called `extract` that extracts the archive file you pass it, and it supports a wide variety of archive filetypes.
zinit ice wait"2" lucid
zinit snippet OMZP::extract

#This plugin uses the command-not-found package for zsh to provide suggested packages to be installed if a command cannot be found.
zinit ice wait"3" lucid
zinit snippet OMZP::command-not-found

#This plugin adds colors to man pages.
zinit ice wait"3" lucid
zinit snippet OMZP::colored-man-pages

#Easily prefix your current or previous commands with `sudo` by pressing <kbd>esc</kbd> twice
zinit ice wait"3" lucid
zinit snippet OMZP::sudo


# alias{{{
alias ..="cd .."
alias ...="cd ../.."

alias lg=lazygit
alias cl=clear
alias yt=yt-dlp
alias cp="cp -i"
alias v=nvim
alias md="mkdir -p"
alias rd=rmdir
alias hy=hyperfine

if [[ $(command -v exa) ]] {
    DISABLE_LS_COLORS=true
    unset LS_BIN_FILE
    for i (/bin/ls ${PREFIX}/bin/ls /usr/bin/ls /usr/local/bin/ls) {
        [[ ! -x ${i} ]] || {
            local LS_BIN_FILE=${i}
                    break
                }
        }
    [[ -n ${LS_BIN_FILE} ]] || local LS_BIN_FILE=$(whereis ls 2>/dev/null | awk '{print $2}')
    alias lls=${LS_BIN_FILE} 
    # lls is the original ls. lls为原版ls
    alias ls="exa --color=auto" 
    # Exa is a modern version of ls. exa是一款优秀的ls替代品,拥有更好的文件展示体验,输出结果更快,使用rust编写。
    alias l='exa -lbah --icons'
    alias la='exa -labgh --icons'
    alias ll='exa -lbg --icons'
    alias lsa='exa -lbagR --icons'
    alias lst='exa -lTabgh --icons' # 输入lst,将展示类似于tree的树状列表。
} else {
    alias ls='ls --color=auto'
    # color should not be always.
    alias lst='tree -pCsh'
    alias l='ls -lah'
    alias la='ls -lAh'
    alias ll='ls -lh'
    alias lsa='ls -lah'
}
# }}}

# ignore case
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

eval "$(starship init zsh)"
