local Plug = vim.fn["plug#"]
local plug_path = vim.fn.expand("<sfile>:p:h") .. "/plugins"

vim.call("plug#begin", plug_path)

Plug "nvim-lua/plenary.nvim"
-- Web apis
Plug "mattn/webapi-vim"

-- Colorscheme
Plug "RRethy/nvim-base16"

-- Statusline
Plug "nvim-lualine/lualine.nvim"

-- Indent
Plug "lukas-reineke/indent-blankline.nvim"

-- Syntax
-- Plug "sheerun/vim-polyglot"
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug "nvim-treesitter/nvim-treesitter-refactor"
Plug "nvim-treesitter/nvim-treesitter-textobjects"
Plug "RRethy/nvim-treesitter-textsubjects"

-- Icon
Plug "kyazdani42/nvim-web-devicons"

-- File Explorer
Plug("kyazdani42/nvim-tree.lua", { on = "NvimTreeToggle" })

-- Finder
Plug "nvim-telescope/telescope.nvim"
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })

-- Pretty list
Plug "folke/trouble.nvim"

-- Search
Plug "kevinhwang91/nvim-hlslens"

-- Completion
Plug "hrsh7th/nvim-cmp"
Plug "onsails/lspkind.nvim"

-- Sources
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-cmdline"
Plug "hrsh7th/cmp-calc"
Plug "hrsh7th/cmp-omni"
Plug "f3fora/cmp-spell"
-- Plug "ray-x/cmp-treesitter" -- to much content
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-nvim-lsp-signature-help"
Plug "hrsh7th/cmp-nvim-lua"
-- Plug "jsfaint/gen_tags.vim"
-- Plug "c0r73x/neotags.lua"
-- Plug "rcarriga/cmp-dap"

-- Snippets
Plug "SirVer/ultisnips"
Plug "honza/vim-snippets"
Plug "quangnguyen30192/cmp-nvim-ultisnips"

-- Editing Support
Plug "romgrk/nvim-treesitter-context"
Plug "windwp/nvim-autopairs"
Plug "p00f/nvim-ts-rainbow"
Plug "RRethy/nvim-treesitter-endwise"
Plug "andymass/vim-matchup"

-- Comment
Plug "tpope/vim-commentary"
Plug "folke/todo-comments.nvim"
-- Plug "JoosepAlviste/nvim-ts-context-commentstring"

-- Formatting
Plug "editorconfig/editorconfig-vim"
-- Plug "lukas-reineke/lsp-format.nvim"

-- Terminal integration
Plug("akinsho/toggleterm.nvim", { tag = "v1.*" })

-- Git
Plug "lewis6991/gitsigns.nvim"

-- LSP
Plug "neovim/nvim-lspconfig"
Plug "nvim-lua/lsp-status.nvim"
Plug "ray-x/lsp_signature.nvim"
-- Plug("ray-x/guihua.lua", { ["do"] = "cd lua/fzy && make" })
-- Plug("ray-x/navigator.lua")

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
require("plugins/indent_blankline")
require("plugins/todo-comments")

require("plugins/telescope")
require("plugins/toggleterm")

require("plugins/nvim-cmp")
require("plugins/nvim-autopairs")
require("plugins/treesitter-context")

require("plugins/lspconfig")
require("plugins/lsp_signature")
-- require("plugins/navigator")

require("plugins/gitsigns")
require("plugins/crates")
require("plugins/vimtex")

require("plugins/whichkey")
