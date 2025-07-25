local o = vim.o
local wo = vim.wo
local opt = vim.opt
local g = vim.g
local env = vim.env

g.mapleader = " "
g.maplocalleader = " "

env.LANG = "en_US.UTF-8"

-- Basic settings
o.encoding = "utf-8"
opt.fileencodings = { "ucs-bom", "utf-8", "gbk", "default", "latin1" }
opt.backspace = { "indent", "eol", "start" }
o.whichwrap = o.whichwrap .. ",<,>,h,l"
o.history = 500
opt.fileformats = { "unix", "mac", "dos" }
-- opt.clipboard = { "unnamed", "unnamedplus" }

-- wo.foldmethod = "expr"
-- wo.foldexpr = "nvim_treesitter#foldexpr()"
o.grepprg = "rg --smart-case --vimgrep $*"
o.grepformat = "%f:%l:%c:%m"

o.timeoutlen = 500
o.updatetime = 300

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
-- o.numberwidth = 3
o.signcolumn = "yes"
o.colorcolumn = "80"
-- o.columns = 100
-- o.modelines = 0

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
opt.listchars = { tab = "⋅⋅", nbsp = "¬", extends = "»", precedes = "«", trail = "•", eol = "↴" }

-- Window
-- o.splitbelow = true
-- o.splitright = true

-- Backup files
o.writebackup = false
o.swapfile = false

-- Commands mode
o.wildmode = "list:longest"
o.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.o"

-- Completion
-- 'completeopt' option supports "popup" flag
-- to show extra information in a floating window. -- neovim-0.10
opt.completeopt = { "menuone", "noselect", "noinsert", "popup" }
opt.shortmess = opt.shortmess + { c = true }

o.mouse = "a"

o.lazyredraw = true
-- o.undodir = HOME .. "/.config/nvim/temp_dirs/undodir"
-- o.undodir = vim.fn.stdpath("data") .. "/undo"
o.undofile = true

-- TODO visual mode select current selection
