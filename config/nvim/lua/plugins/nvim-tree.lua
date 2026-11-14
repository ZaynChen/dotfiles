return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<C-S-E>", "<cmd>NvimTreeToggle<cr>", desc = "[NvimTree]Toggle" }
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  opts = {
    hijack_cursor = true,
    view = {
      side = "right",
      number = true,
      relativenumber = true,
      signcolumn = "yes",
      width = {
        max = 30,
        padding = 0,
        lines_excluded = {}
      },
    },
    renderer = {
      full_name = true,
      hidden_display = "all",
      highlight_git = true,
      highlight_diagnostics = true,
      highlight_opened_files = "all",
      highlight_modified = "all",
      highlight_hidden = "none",
      highlight_bookmarks = "all",
      highlight_clipboard = "name",
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = true,
          hidden = true,
          diagnostics = true,
          bookmarks = true,
        },
      },
    },
    update_focused_file = { enable = true },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      debounce_delay = 50,
    },
    modified = {
      enable = true,
    },
    actions = {
      expand_all = {
        exclude = { ".git", "target", "build" },
      },
    },
  }
}
