local Plug = vim.fn["plug#"]
local plug_path = vim.fn.expand("<sfile>:p:h") .. "/plugins"

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
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })

-- Search
Plug "kevinhwang91/nvim-hlslens"

-- Completion
Plug "hrsh7th/nvim-cmp"
Plug "onsails/lspkind.nvim"

Plug "windwp/nvim-autopairs"

-- Sources
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-cmdline"
Plug "hrsh7th/cmp-calc"
Plug "hrsh7th/cmp-omni"
Plug "f3fora/cmp-spell"
Plug "ray-x/cmp-treesitter"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-nvim-lsp-signature-help"
Plug "hrsh7th/cmp-nvim-lua"
-- Plug "rcarriga/cmp-dap"

-- Snippets
Plug "SirVer/ultisnips"
Plug "honza/vim-snippets"
Plug "quangnguyen30192/cmp-nvim-ultisnips"

-- Comment
Plug "tpope/vim-commentary"

-- Formatting
Plug "editorconfig/editorconfig-vim"
-- Plug "lukas-reineke/lsp-format.nvim"

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
-- Plug "sakhnik/nvim-gdb"

-- Tool
Plug "wakatime/vim-wakatime"
Plug "folke/which-key.nvim"

-- this if for im switch, lick fcitx switch, but has bug on macos
-- Plug "rlue/vim-barbaric"
-- TODO
-- Plug "iamcco/markdown-preview.nvim"

Plug("lervag/vimtex", { ["for"] = "tex" })

vim.call("plug#end")

local g = vim.g
g.rainbow_active = 1

require("nvim-web-devicons").setup {}
require("cmp_nvim_ultisnips").setup {}

require("plugins/lualine")
require("plugins/nvim-tree")
require("plugins/treesitter")
require("indent_blankline").setup { show_end_of_line = true }
require("plugins/telescope")

require("plugins/nvim-cmp")
require("plugins/nvim-autopairs")

require("plugins/lspconfig")
require("plugins/gitsigns")
require("plugins/crates")
require("plugins/vimtex")

require("plugins/whichkey")

-- barbaric
-- g.barbaric_ime = "macos"
-- g.barbaric_default = 0
-- g.barbaric_scope = "buffer"
-- g.barbaric_timeout = -1
