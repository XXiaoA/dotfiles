" basic{{{
" 不与vi兼容
set nocompatible
" 文件编码
set encoding=utf-8
" 显示行号
set nu
" 禁用鼠标
set mouse=nv
" 显示命令
set showcmd
" 显示模式
set showmode
" 启用256色
set t_Co=256
" fold
set foldmethod=marker
" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
" 按下 Tab 键时，Vim 显示的空格数。
set tabstop=4
" 在文本上按下>>、<<或==时，每一级的字符数。
set shiftwidth=4
" 自动将 Tab 转为空格。
set expandtab
" Tab 转为多少个空格
set softtabstop=4
" 光标所在的当前行高亮
set cursorline
" 粘贴模式
set pastetoggle=<F9>
" 垂直滚动时，光标距离顶部/底部的位置
set scrolloff=7
" 水平滚动时，光标距离行首或行尾的位置
set sidescrolloff=15
" 总是显示状态栏
set laststatus=2
" 在状态栏显示光标的当前位置
set  ruler
" 高亮光标对应的括号
set showmatch
" 搜索时，高亮显示匹配结果。
set hlsearch
" 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。
set incsearch
" 搜索时忽略大小写
set ignorecase
" 单词拼写检查
" set spell spelllang=en_us
" 不创建备份文件
set nobackup
" 不创建交换文件
set noswapfile
" 自动切换工作目录
set autochdir
" Vim 需要记住多少次历史操作。
set history=500
" 打开文件监视
set autoread
" 加快响应速度
set updatetime=100
" 连击频率
set timeoutlen=500
" 如果行尾有多余的空格（包括 Tab 键）
"set listchars=tab:»■,trail:■
"set list
set fillchars="tab:»■,trail:■,eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
set confirm
" 打开文件类型检查
filetype indent on
" 打开语法高亮
syntax on
"}}}

" key mapping{{{
imap jj <ESC>

" save and quit the vim
imap <C-s> :w<cr>
imap <C-q> :qall<cr>
nmap W :w<cr>
nmap Q :qall<cr>

" windows
nmap sc <C-w>c
nmap so <C-w>o
nmap sv <C-w>v
nmap sh <C-w>s
nmap s= <C-w>=
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap sj :resize +10<CR>
nmap sk :resize -10<CR>
nmap s. :vertical resize +20<CR>
nmap s, :vertical resize -20<CR>

" move the line
nmap <A-up> :m .-2<cr>
nmap <A-down> :m .+1<cr>
imap <A-up> <ESC>:m .-2<cr>
imap <A-down> <ESC>:m .+1<cr>
vmap <A-up> :m '<-2<cr>gv
vmap <A-down> :m '>+1<cr>gv


let mapleader="\<space>"
let maplocalleader="\<space>"

nmap <leader>sp :<C-U>set spell!<CR>

" Autoindentation
nmap <leader>i gg=G
" no highlight
nmap <leader>be :noh<cr>
"}}}

" autocmd{{{
au FileType * set formatoptions-=ro

" smart number from https://github.com/jeffkreeftmeijer/vim-numbertoggle{{{
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END"}}}
"}}}

" highlight{{{
if !has('gui_running')
    augroup MyColors
        autocmd!
        autocmd ColorScheme * call MyHighlights()
    augroup END
else
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
endif

function! MyHighlights() abort
    highlight clear

    " The following colors are taken from ayu_mirage vim-airline theme,
    " link: https://github.com/vim-airline/vim-airline-themes/
    hi User1 ctermfg=0 ctermbg=114
    hi User2 ctermfg=114 ctermbg=0

    " The following colors are taken from vim-gruvbox8,
    " link: https://github.com/lifepillar/vim-gruvbox8
    hi Normal ctermfg=187 ctermbg=NONE cterm=NONE
    hi CursorLineNr ctermfg=214 ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=102 ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=187 ctermbg=NONE cterm=NONE
    hi VertSplit ctermfg=59 ctermbg=NONE cterm=NONE

    hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
    hi Comment ctermfg=102 ctermbg=NONE cterm=italic
    hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
    hi Error ctermfg=203 ctermbg=234 cterm=bold,reverse
    hi ErrorMsg ctermfg=234 ctermbg=203 cterm=bold
    hi Folded ctermfg=102 ctermbg=237 cterm=italic
    hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
    hi MatchParen ctermfg=NONE ctermbg=59 cterm=bold
    hi NonText ctermfg=239 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=187 ctermbg=239 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=239 cterm=NONE
    hi PmenuSel ctermfg=239 ctermbg=109 cterm=bold
    hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
    hi SpecialKey ctermfg=102 ctermbg=NONE cterm=NONE
    hi StatusLine ctermfg=239 ctermbg=187 cterm=reverse
    hi StatusLineNC ctermfg=237 ctermbg=137 cterm=reverse
    hi TabLine ctermfg=243 ctermbg=237 cterm=NONE
    hi TabLineFill ctermfg=243 ctermbg=237 cterm=NONE
    hi TabLineSel ctermfg=142 ctermbg=237 cterm=NONE
    hi ToolbarButton ctermfg=230 ctermbg=59 cterm=bold
    hi ToolbarLine ctermfg=NONE ctermbg=59 cterm=NONE
    hi Visual ctermfg=NONE ctermbg=59 cterm=NONE
    hi WildMenu ctermfg=109 ctermbg=239 cterm=bold
    hi Conceal ctermfg=109 ctermbg=NONE cterm=NONE
    hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
    hi DiffAdd ctermfg=142 ctermbg=234 cterm=reverse
    hi DiffChange ctermfg=107 ctermbg=234 cterm=reverse
    hi DiffDelete ctermfg=203 ctermbg=234 cterm=reverse
    hi DiffText ctermfg=214 ctermbg=234 cterm=reverse
    hi Directory ctermfg=142 ctermbg=NONE cterm=bold
    hi EndOfBuffer ctermfg=234 ctermbg=NONE cterm=NONE
    hi IncSearch ctermfg=208 ctermbg=234 cterm=reverse
    hi ModeMsg ctermfg=214 ctermbg=NONE cterm=bold
    hi MoreMsg ctermfg=214 ctermbg=NONE cterm=bold
    hi Question ctermfg=208 ctermbg=NONE cterm=bold
    hi Search ctermfg=214 ctermbg=234 cterm=reverse
    hi SpellBad ctermfg=203 ctermbg=NONE cterm=italic,underline
    hi SpellCap ctermfg=109 ctermbg=NONE cterm=italic,underline
    hi SpellLocal ctermfg=107 ctermbg=NONE cterm=italic,underline
    hi SpellRare ctermfg=175 ctermbg=NONE cterm=italic,underline
    hi Title ctermfg=142 ctermbg=NONE cterm=bold
    hi WarningMsg ctermfg=203 ctermbg=NONE cterm=bold
    hi Boolean ctermfg=175 ctermbg=NONE cterm=NONE
    hi Character ctermfg=175 ctermbg=NONE cterm=NONE
    hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE
    hi Constant ctermfg=175 ctermbg=NONE cterm=NONE
    hi Define ctermfg=107 ctermbg=NONE cterm=NONE
    hi Debug ctermfg=203 ctermbg=NONE cterm=NONE
    hi Delimiter ctermfg=208 ctermbg=NONE cterm=NONE
    hi Error ctermfg=203 ctermbg=234 cterm=bold,reverse
    hi Exception ctermfg=203 ctermbg=NONE cterm=NONE
    hi Float ctermfg=175 ctermbg=NONE cterm=NONE
    hi Function ctermfg=142 ctermbg=NONE cterm=bold
    hi Identifier ctermfg=109 ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=fg ctermbg=NONE cterm=NONE
    hi Include ctermfg=107 ctermbg=NONE cterm=NONE
    hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE
    hi Label ctermfg=203 ctermbg=NONE cterm=NONE
    hi Macro ctermfg=107 ctermbg=NONE cterm=NONE
    hi Number ctermfg=175 ctermbg=NONE cterm=NONE
    hi Operator ctermfg=107 ctermbg=NONE cterm=NONE
    hi PreCondit ctermfg=107 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=107 ctermbg=NONE cterm=NONE
    hi Repeat ctermfg=203 ctermbg=NONE cterm=NONE
    hi SpecialChar ctermfg=203 ctermbg=NONE cterm=NONE
    hi SpecialComment ctermfg=203 ctermbg=NONE cterm=NONE
    hi Statement ctermfg=203 ctermbg=NONE cterm=NONE
    hi StorageClass ctermfg=208 ctermbg=NONE cterm=NONE
    hi Special ctermfg=208 ctermbg=NONE cterm=italic
    hi String ctermfg=142 ctermbg=NONE cterm=italic
    hi Structure ctermfg=107 ctermbg=NONE cterm=NONE
    hi Todo ctermfg=fg ctermbg=234 cterm=bold,italic
    hi Type ctermfg=214 ctermbg=NONE cterm=NONE
    hi Typedef ctermfg=214 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=109 ctermbg=NONE cterm=underline
    hi CursorIM ctermfg=NONE ctermbg=NONE cterm=reverse

    hi Comment cterm=NONE
    hi Folded cterm=NONE
    hi SpellBad cterm=underline
    hi SpellCap cterm=underline
    hi SpellLocal cterm=underline
    hi SpellRare cterm=underline
    hi Special cterm=NONE
    hi String cterm=NONE
    hi Todo cterm=bold

    hi NormalMode ctermfg=137 ctermbg=234 cterm=reverse
    hi InsertMode ctermfg=109 ctermbg=234 cterm=reverse
    hi ReplaceMode ctermfg=107 ctermbg=234 cterm=reverse
    hi VisualMode ctermfg=208 ctermbg=234 cterm=reverse
    hi CommandMode ctermfg=175 ctermbg=234 cterm=reverse
    hi Warnings ctermfg=208 ctermbg=234 cterm=reverse
endfunction

if exists('&termguicolors')
    " If we want to use true colors, we must a color scheme which support true
    " colors, for example, https://github.com/sickill/vim-monokai
    set notermguicolors
endif
set background=dark
colorscheme desert"}}}

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"
