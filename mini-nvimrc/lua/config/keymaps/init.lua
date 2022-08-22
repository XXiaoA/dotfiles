-- Function for make mapping easier.
local map = require("core.keymap").set_keymap

local nmap = map("n")
local imap = map("i")
local vmap = map("v")
local tmap = map("t")

-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 退出终端插入模式
tmap("<ESC>", [[<C-\><C-n>]])

-- 移动代码
nmap("<A-k>", ":m .-2<cr>")
nmap("<A-j>", ":m .+1<cr>")
imap("<A-k>", "<ESC>:m .-2<cr>i")
imap("<A-j>", "<ESC>:m .+1<cr>i")
vmap("<A-k>", ":m '<-2<cr>gv")
vmap("<A-j>", ":m '>+1<cr>gv")

-- 保存/退出
imap("<C-s>", "<C-o>:w<CR>")
imap("<C-q>", "<C-o>:qall<CR>")
nmap("W", ":w<CR>")
nmap("Q", ":qall<cr>")

-- 输入模式/选择模式 jj/JJ 退出
vmap("JJ", "<ESC>")
imap("jj", "<ESC>")

-- visual模式下缩进代码
vmap("<", "<gv")
vmap(">", ">gv")

-- 分屏快捷键
nmap("sv", ":vsp<CR>")
nmap("sh", ":sp<CR>")

-- 关闭当前
nmap("sc", "<C-w>c")
-- close others
nmap("so", "<C-w>o")

-- 比例控制
nmap("s.", ":vertical resize +20<CR>")
nmap("s,", ":vertical resize -20<CR>")
nmap("s=", "<C-w>=")
nmap("sj", ":resize +10<CR>")
nmap("sk", ":resize -10<CR>")

-- ctrl + hjkl  窗口之间跳转
nmap("<C-h>", "<C-w>h", { desc = "Jump to left window" })
nmap("<C-j>", "<C-w>j", { desc = "Jump to below window" })
nmap("<C-k>", "<C-w>k", { desc = "Jump to above window" })
nmap("<C-l>", "<C-w>l", { desc = "Jump to right window" })
tmap("<C-h>", [[<C-\><C-n><C-W>h]])
tmap("<C-j>", [[<C-\><C-n><C-W>j]])
tmap("<C-k>", [[<C-\><C-n><C-W>k]])
tmap("<C-l>", [[<C-\><C-n><C-W>l]])

nmap("<leader>i", "gg=G")

-- Toggle spelling check
nmap("<leader>sp", ":<C-U>set spell!<CR>", { desc = "Toggle spelling check" })
