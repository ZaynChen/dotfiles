local o = vim.o
local opt = vim.opt
local g = vim.g
local env = vim.env

HOME = env.HOME

g.mapleader = " "

env.LANG = "en_US.UTF-8"

-- Basic settings
o.encoding = "utf-8"
opt.backspace = { "indent", "eol", "start" }
o.whichwrap = o.whichwrap .. "<,>,h,l"
o.history = 500
opt.fileformats = { "unix", "mac", "dos" }
opt.clipboard = { "unnamed", "unnamedplus" }

-- Mapping waiting time
o.timeoutlen = 500

-- Display
o.showmatch = true
o.matchtime = 2
o.scrolloff = 7
o.laststatus = 3
o.cmdheight = 1
-- o.showtabline = 2
o.tabline = "%M %t"
o.cursorline = true
o.wrap = true
o.linebreak = true -- default off
-- o.textwidth = 500

-- Sidebar
o.number = true
o.relativenumber = true
o.numberwidth = 3
-- o.signcolumn = "yes:1"
-- o.columns = 100
-- o.modelines = 0

-- Color Scheme
if vim.fn.filereadable(HOME .. "/.vimrc_background") then
    base16colorspace = 256
    vim.cmd("source " .. HOME .. "/.vimrc_background")
else
    vim.cmd("colorscheme base16-onedark")
end
o.background = "dark"
o.termguicolors = true

g.lightline = {
    colorscheme = 'onedark',
}

-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- White characters
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
opt.list = true
opt.listchars = { tab = "•\\ ", nbsp = "¬", extends = "»", precedes = "«", trail = "•" }

-- Window
-- o.splitbelow = true
-- o.splitright = true

-- Backup files
o.writebackup = false
o.swapfile = false

-- Commands mode
o.wildmode = "list:longest"
o.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.o"

-- vim.cmd("source $NVIMRUNTIME/delmenu.vim")
-- vim.cmd("source $NVIMRUNTIME/menu.vim")

-- Completion
opt.completeopt = { "menuone", "noselect" }
o.shortmess = o.shortmess .. 'c'

o.mouse = "a"

o.lazyredraw = true
o.undodir = HOME .. "/.config/nvim/temp_dirs/undodir"
o.undofile = true

-- filetype
g.do_filetype_lua = 1
g.did_load_filetypes = 0

-- TODO visual mode select current selection
