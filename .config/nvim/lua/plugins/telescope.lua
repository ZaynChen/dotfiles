local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  return
end

local config = {
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

local trouble_ok, trouble = pcall(require, "trouble.providers.telescope")
if trouble_ok then
  config = vim.tbl_deep_extend("force", config, {
    defaults = {
      mappings = {
        i = {
          ["<C-t>"] = trouble.open_with_trouble
        },
      }
    },
  })
end

telescope.setup(config)

telescope.load_extension("fzf")
-- telescope.load_extension("ui-select")
-- telescope.load_extension("dap")
-- telescope.load_extension("vim_bookmarks")
--
