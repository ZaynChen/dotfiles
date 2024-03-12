local Plug = vim.fn["plug#"]
-- local plug_path = vim.fn.stdpath("data") .. "/plugged"
-- local plug_path = vim.fn.expand("<sfile>:p:h") .. "/plugins"

vim.call("plug#begin")

Plug "nvim-lua/plenary.nvim"
-- Web apis
Plug "mattn/webapi-vim"

-- Colorscheme
-- Plug "RRethy/nvim-base16"
-- Plug("catppuccin/nvim", { ["as"] = "catppuccin" })
-- Plug "navarasu/onedark.nvim"
-- Plug "olimorris/onedarkpro.nvim"
Plug "norcalli/nvim-colorizer.lua"

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
-- TODO: hop easy motion
-- Plug "phaazon/hop.nvim"

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
Plug "L3MON4D3/LuaSnip"
Plug "saadparwaiz1/cmp_luasnip"
Plug "honza/vim-snippets"
-- Plug "SirVer/ultisnips"
-- Plug "quangnguyen30192/cmp-nvim-ultisnips"

-- Editing Support
Plug "HiPhish/rainbow-delimiters.nvim"
Plug "romgrk/nvim-treesitter-context"
Plug "windwp/nvim-autopairs"
Plug "RRethy/nvim-treesitter-endwise"
-- Plug "theHamsta/nvim-treesitter-pairs" -- only normal mode
Plug "andymass/vim-matchup"

-- Comment
-- Plug "tpope/vim-commentary"
Plug "numToStr/Comment.nvim"
Plug "folke/todo-comments.nvim"
-- Plug "JoosepAlviste/nvim-ts-context-commentstring"

-- Formatting
-- neovim 0.9 add builtin EditorConfig support
-- Plug "editorconfig/editorconfig-vim"
-- Plug "lukas-reineke/lsp-format.nvim"

-- Terminal integration
Plug("akinsho/toggleterm.nvim")

-- Git
Plug "lewis6991/gitsigns.nvim"

-- LSP
-- Plug "williamboman/mason.nvim"
-- Plug "williamboman/mason-lspconfig.nvim"
Plug "jose-elias-alvarez/null-ls.nvim"
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
-- TODO: debugging
Plug "mfussenegger/nvim-dap"
-- Plug "sakhnik/nvim-gdb"

-- Tool
Plug "lewis6991/impatient.nvim"
Plug "wakatime/vim-wakatime"
Plug "folke/which-key.nvim"

-- Plug "iamcco/markdown-preview.nvim"

Plug("lervag/vimtex", { ["for"] = "tex" })

vim.call("plug#end")

local plugins = {
  -- To use impatient,
  -- you need only to include it near the top of your init.lua or init.vim.
  "plugins.impatient",
  --
  "plugins.colorscheme",
  "plugins.nvim-tree",
  "plugins.treesitter",
  "plugins.rainbow-delimiters",
  "plugins.indent_blankline",
  "plugins.todo-comments",
  "plugins.comment",
  "plugins.nvim-hlslens",
  --
  "plugins.nvim-cmp",
  "plugins.nvim-autopairs",
  "plugins.treesitter-context",
  --
  "plugins.lsp",
  "plugins.null-ls",
  --
  "plugins.gitsigns",
  "plugins.crates",
  "plugins.vimtex",
  --
  "plugins.telescope",
  "plugins.trouble",
  -- "plugins/navigator",
  "plugins.toggleterm",
  "plugins.whichkey",
}

for _, plugin in ipairs(plugins) do
  if not pcall(require, plugin) then
    vim.api.nvim_err_writeln("Failed to load " .. plugin)
  end
end

local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
if devicons_ok then
  devicons.setup {}
else
  vim.api.nvim_err_writeln("Failed to load nvim-web-devicons")
end

local colorizer_ok, colorizer = pcall(require, "colorizer")
if colorizer_ok then
  colorizer.setup {}
else
  vim.api.nvim_err_writeln("Failed to load colorizer")
end
