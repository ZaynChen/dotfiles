return {
  { "mattn/webapi-vim",            lazy = true },
  { "norcalli/nvim-colorizer.lua", event = "BufReadPost" },
  { "andymass/vim-matchup",        event = "BufReadPost" },
  { "kevinhwang91/nvim-hlslens",   event = "BufReadPost", opts = {} },
  { "wakatime/vim-wakatime",       event = "VeryLazy" },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      indent = {
        char = "▏",
      }
    },
  },
}
