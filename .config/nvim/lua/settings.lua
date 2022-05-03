HOME = vim.env.HOME

vim.g.mapleader = " "

vim.env.LANG = "en_US.UTF-8"
vim.g.lightline = {
    colorscheme = 'onedark',
}

-- Basic settings
vim.o.encoding = "utf-8"
vim.opt.backspace = { "indent", "eol", "start" }
vim.o.whichwrap = vim.o.whichwrap.."<,>,h,l"
vim.o.history = 500
vim.opt.fileformats = "unix,mac,dos"

vim.o.autoread = true
vim.cmd("au FocusGained,BufEnter * checktime")

vim.opt.clipboard = { "unnamed", "unnamedplus" }

-- Mapping waiting time
vim.o.timeoutlen = 500

-- Display
vim.o.showmatch = true
vim.o.scrolloff = 7
vim.o.laststatus = 2
vim.o.cmdheight = 1

-- vim.o.showtabline = 2
vim.o.tabline = "%M %t"

vim.o.cursorline = true

-- Colorscheme
if vim.fn.filereadable(HOME.."/.vimrc_background") then
    base16colorspace=256
    vim.cmd("source "..HOME.."/.vimrc_background")
else
    vim.cmd("colorscheme base16-onedark")
end
vim.o.background = "dark"
vim.o.termguicolors = true

vim.o.wrap = true
vim.o.linebreak = true -- default off
-- vim.o.textwidth = 500

-- Sidebar
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3
-- vim.o.signcolumn = "yes:1"
-- vim.o.columns = 100
-- vim.o.modelines = 0
vim.o.showcmd = true


-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- vim.o.matchtime = 2

-- White characters
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.list = true
vim.opt.listchars = { tab = "•\\ ", nbsp = "¬", extends = "»", precedes = "«", trail = "•" }

-- Backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Commands mode
vim.o.wildmenu = true
vim.o.wildmode= "list:longest"
vim.o.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.o"

-- macos
vim.cmd("source $NVIMRUNTIME/delmenu.vim")
vim.cmd("source $NVIMRUNTIME/menu.vim")

vim.o.magic = true
vim.o.mat = 2

-- Bells
vim.o.errorbells = false
vim.o.visualbell = false


-- Completion
vim.opt.completeopt = {"menuone", "noinsert", "noselect"}
vim.o.shortmess = vim.o.shortmess..'c'

vim.o.mouse = "a"

vim.lazyredraw = true
vim.o.undodir=HOME.."/.config/nvim/temp_dirs/undodir"
vim.o.undofile = true

vim.cmd([[
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- 退出插入模式时禁用输入法
-- 创建 Buf 时禁用输入法
-- 进入 Buf 时禁用输入法
-- 离开 Buf 时禁用输入法
vim.cmd([[
    autocmd InsertLeave * :silent !fcitx5-remote -c
    autocmd BufCreate *  :silent !fcitx5-remote -c
    autocmd BufEnter *  :silent !fcitx5-remote -c
    autocmd BufLeave *  :silent !fcitx5-remote -c
]])

-- TODO visual mode select current selection
