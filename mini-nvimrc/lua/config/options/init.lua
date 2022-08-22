local cache_dir = os.getenv("HOME") .. "/.cache/nvim/"

-- 鼠标
vim.o.mouse = "nv" -- "a"
-- open backup
vim.o.backup = true
vim.o.writebackup = true
vim.o.backupdir = cache_dir .. "backup/"
-- open swap
vim.o.swapfile = false
-- F9打开/关闭粘贴模式
vim.o.pastetoggle = "<F9>"
-- 编码设置
vim.o.encoding = "utf-8"
-- 加快响应速度
vim.o.updatetime = 100
-- 连击频率
vim.o.timeoutlen = 500
-- 总是在当前目录下执行命令
vim.o.autochdir = true
-- 显示命令字符
vim.o.showcmd = true
-- always show tabline
vim.o.showtabline = 2
-- use global line
vim.o.laststatus = 3
-- 允许当前窗口未保存时切换到其他窗口
vim.o.hidden = true
-- 启用 24-bit 色
vim.o.termguicolors = true
-- 语法高亮
vim.o.syntax = "enable"
-- 高亮当前行
vim.o.cursorline = true
-- 设置行号
vim.o.number = true
-- 显示行尾空格
vim.o.list = true
-- 设置自动折行
vim.o.wrap = true
-- 取消自动换行，把textwidth调大
vim.o.textwidth = 1000
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 15
vim.o.sidescrolloff = 15
-- 使用系统剪切板
vim.o.clipboard = "unnamedplus"
-- 设置自动缩进
vim.o.autoindent = true
-- 将缩进转换为空格
vim.o.expandtab = true
-- tab 的空格数量
vim.o.shiftwidth = 4
-- 设置 tab 缩进显示宽度
vim.o.tabstop = 4
-- 设置 tab 缩进实际宽度
vim.o.softtabstop = 4
-- 设置>> <<缩进数量
vim.o.shiftwidth = 4
-- 高亮搜索结果
vim.o.hlsearch = true
-- 高亮匹配符号
vim.o.showmatch = true
-- 开启命令补全
vim.o.wildmenu = true
-- 忽略大小写
vim.o.ignorecase = true
-- 智能大小写
vim.o.smartcase = true
-- 打开拼写检查
vim.o.spell = false
-- 设置拼写检查语言
vim.o.spelllang = "en_us,cjk"

-- 是否支持折叠
vim.o.foldenable = true
-- 折叠的方式
vim.o.foldmethod = "marker"
-- 折叠的级别（100）
vim.o.foldlevel = 100
vim.o.foldlevelstart = 100
-- vim.o.foldcolumn = "1"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.o.autoindent = true

-- Ask for confirmation when handling unsaved or read-only files
vim.o.confirm = true
vim.o.signcolumn = "yes"
