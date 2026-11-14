return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "onedark",
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
        "lazy",
        "lsp_status", "encoding", "fileformat", "filetype"
      },
    },
    extensions = { "fzf", "lazy", "man", "mason", "nvim-tree", "trouble" }
  }
}
