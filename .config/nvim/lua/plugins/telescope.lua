local telescope = require("telescope")
local trouble   = require("trouble.providers.telescope")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<ESC>"] = "close",
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",

        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",

        ["<C-f>"] = "preview_scrolling_down",
        ["<C-b>"] = "preview_scrolling_up",

        ["<C-l>"] = "smart_send_to_qflist",

        -- ["<C-u>"] = "preview_scrolling_up",
        ["<C-u>"] = { "<C-u>", type = "command" },
        ["<C-a>"] = { "<Home>", type = "command" },
        ["<C-e>"] = { "<End>", type = "command" },
        -- ["<C-w>"] = { "<c-s-w>", type = "command" },

        -- ["<C-h>"] = "which_key",
        ["<C-t>"] = trouble.open_with_trouble,
      },
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
    },
    live_grep = {
      theme = "dropdown",
    },
    help_tags = {
      theme = "dropdown",
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },

  }
}

telescope.load_extension("fzf")
-- telescope.load_extension("ui-select")
-- telescope.load_extension("dap")
-- telescope.load_extension("vim_bookmarks")
--
