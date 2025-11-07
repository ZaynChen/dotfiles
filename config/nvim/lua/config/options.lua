local opt = vim.opt
local g = vim.g
local env = vim.env

g.mapleader = " "
g.maplocalleader = " "

env.LANG = "en_US.UTF-8"

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Basic settings
opt.fileencodings:append("gbk")
opt.whichwrap:append { ["<"] = true, [">"] = true, h = true, l = true }
opt.fileformats:append("mac")
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"

opt.grepprg = "rg --smart-case --vimgrep $*"
opt.grepformat = "%f:%l:%c:%m"

opt.timeoutlen = 300
opt.updatetime = 200

-- Display
opt.termguicolors = true
opt.showmatch = true
opt.matchtime = 2
opt.scrolloff = 7
opt.laststatus = 3

opt.cursorline = true
opt.linebreak = true -- default off not used when 'wrap' is off
opt.pumblend = 10    -- popup-menu blend
-- opt.pumheight = 10 -- maximu number of entries in a popup menu

opt.splitkeep = "screen"

-- Sidebar
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.colorcolumn:append("80")

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Nontext characters
-- opt.conceallevel = 2
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.list = true
opt.listchars = { tab = "⋅⋅", nbsp = "¬", extends = "»", precedes = "«", trail = "•", eol = "↴" }

-- Fold
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = ""

-- Formatting
opt.formatoptions = "tcqjroln" -- tcqj

-- Completion mode
opt.wildmode = "list:longest"
opt.wildignore = { ".hg", ".svn", "*~", "*.png", "*.jpg", "*.gif", "*.min.js", "*.o" }

-- Insert mode completion
opt.completeopt = { "menu", "menuone", "noselect", "longest", "preview" }
opt.shortmess:append { c = true }

opt.virtualedit = "block"
opt.confirm = true

opt.mouse = "a"

opt.undofile = true

-- TODO visual mode select current selection
