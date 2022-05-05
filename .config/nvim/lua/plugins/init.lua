local Plug = vim.fn["plug#"]
local plug_path = vim.fn.expand("<sfile>:p:h").."/plugins"

vim.call("plug#begin", plug_path)

Plug "nvim-lua/plenary.nvim"
-- Web apis
Plug "mattn/webapi-vim"


-- Color Scheme
Plug "RRethy/nvim-base16"

-- Status Line
Plug "nvim-lualine/lualine.nvim"

-- Display
-- Plug "kien/rainbow_parentheses.vim"
-- Plug "luochen1990/rainbow"
--
Plug "p00f/nvim-ts-rainbow"
Plug "lukas-reineke/indent-blankline.nvim"

-- Syntax Highlight
-- Plug "sheerun/vim-polyglot"
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- File Explorer
Plug "kyazdani42/nvim-web-devicons"
Plug("kyazdani42/nvim-tree.lua", { on = "NvimTreeToggle" })

-- Finder
Plug "nvim-telescope/telescope.nvim"

-- Search
-- Plug "eugen0329/vim-esearch"
Plug "kevinhwang91/nvim-hlslens"
-- TODO
-- Plug "mg979/vim/visual-multi"

-- Completion
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-cmdline"
Plug "hrsh7th/nvim-cmp"
Plug "windwp/nvim-autopairs"

-- Snippets
Plug "SirVer/ultisnips"
Plug "honza/vim-snippets"
Plug "quangnguyen30192/cmp-nvim-ultisnips"

-- Comment
Plug "tpope/vim-commentary"

-- Editorconfig
Plug "editorconfig/editorconfig-vim"

-- Tool
Plug "wakatime/vim-wakatime"
Plug "folke/which-key.nvim"
-- this if for im switch, lick fcitx switch, but has bug on macos
-- Plug "rlue/vim-barbaric"

-- Git
Plug "lewis6991/gitsigns.nvim"

-- LSP
Plug "neovim/nvim-lspconfig"
Plug "nvim-lua/lsp-status.nvim"

-- Rust
Plug "simrat39/rust-tools.nvim"
Plug "saecki/crates.nvim"

-- Julia
Plug "JuliaEditorSupport/julia-vim"

-- Debug
-- TODO
-- Plug "mfussenegger/nvim-dap"
Plug "sakhnik/nvim-gdb"

-- TODO
-- Plug "iamcco/markdown-preview.nvim"

Plug("lervag/vimtex", { ["for"] = "tex" })

vim.call("plug#end")

local g = vim.g
local o = vim.o
local HOME = vim.env.HOME


-- need "RRethy/nvim-base16" first
if vim.fn.filereadable(HOME .. "/.vimrc_background") then
    base16colorspace = 256
    vim.cmd("source " .. HOME .. "/.vimrc_background")
else
    vim.cmd("colorscheme base16-onedark")
end
o.background = "dark"
o.termguicolors = true

g.rainbow_active = 1

require("nvim-web-devicons").setup({})

require("plugins/lualine")
require("plugins/nvim-tree")
require("plugins/nvim-cmp")
require("plugins/treesitter")
require("plugins/whichkey")
require("plugins/lspconfig")
require("plugins/telescope")
require("plugins/gitsigns")
require("plugins/crates")
require("plugins/vimtex")

-- barbaric
-- g.barbaric_ime = "macos"
-- g.barbaric_default = 0
-- g.barbaric_scope = "buffer"
-- g.barbaric_timeout = -1


-- autoparis
require('nvim-autopairs').setup({})

-- local disable_filetype = { "TelescopePrompt" }
-- local disable_in_macro = false  -- disable when recording or executing a macro
-- local disable_in_visualblock = false -- disable when insert after visual block mode
-- local ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", "")
-- local enable_moveright = true
-- local enable_afterquote = true  -- add bracket pairs after quote
-- local enable_check_bracket_line = true  --- check bracket in same line
-- local check_ts = false
-- local map_bs = true  -- map the <BS> key
-- local map_c_h = false  -- Map the <C-h> key to delete a pair
-- local map_c_w = false -- map <c-w> to delete a pair if possible

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

require("indent_blankline").setup({ show_end_of_line = true })

