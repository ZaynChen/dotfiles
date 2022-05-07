local nmap = require('utils.keymap').nmap

local telescope = require("telescope")
local builtin   = require("telescope.builtin")

require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
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

      },
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
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
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
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
nmap("<leader>f", builtin.find_files, { desc = "Telescope find_files" })
nmap("<leader>/", builtin.live_grep, { desc = "Telescope live_grep" })
-- nmap("<leader>b", builtin.buffers, { desc = "Telescope buffers" })
nmap("<leader>z", builtin.help_tags, { desc = "Telescope help_tags" })
-- nmap("<leader>fj", builtin.jumplist)
