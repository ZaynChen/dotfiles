return {
  -- { "mattn/webapi-vim",            lazy = true },
  { "norcalli/nvim-colorizer.lua", event = "BufReadPost", opts = { "*" } },
  { "andymass/vim-matchup",        event = "BufReadPost" },
  { "kevinhwang91/nvim-hlslens",   event = "BufReadPost", opts = {} },
  { "wakatime/vim-wakatime",       event = "VeryLazy" },
}
