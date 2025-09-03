local Util = require("util")

function telescope(builtin, opts)
  return function()
    require("telescope.builtin")[builtin](opts)
  end
end

function zoxide()
  return function()
    require("telescope").extensions.zoxide.list()
  end
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
      config = function()
        Util.on_load("telescope.nvim", function()
          require("telescope").load_extension("fzf")
        end)
      end
    },
    {
      "jvgrootveld/telescope-zoxide",
      config = function()
        Util.on_load("telescope.nvim", function()
          require("telescope").load_extension("zoxide")
        end)
      end
    }
  },
  keys = {
    { "<leader>/",  telescope("live_grep"),    desc = "[TScope]live_grep" },
    { "<leader>f",  telescope("find_files"),   desc = "[TScope]find_files" },
    { "<leader>j",  zoxide(),                  desc = "[TScope]zoxide" },
    { "<leader>bb", telescope("buffers"),      desc = "[TScope]buffers" },

    { "<leader>ha", telescope("autocommands"), desc = "[TScope]autocommands" },
    { "<leader>hc", telescope("commands"),     desc = "[TScope]commands" },
    { "<leader>hh", telescope("help_tags"),    desc = "[TScope]help_tags" },
    { "<leader>hk", telescope("keymaps"),      desc = "[TScope]keymaps" },
    { "<leader>hm", telescope("man_pages"),    desc = "[TScope]man_pages" },
    { "<leader>ho", telescope("vim_options"),  desc = "[TScope]options" },
    { "<leader>hC", telescope("colorscheme"),  desc = "[TScope]colorscheme" },
  },
  opts = function()
    local builtin = require("telescope.builtin")
    local z_utils = require("telescope._extensions.zoxide.utils")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")

    local open_with_trouble = function(...)
      return require("trouble.providers.telescope").open_with_trouble(...)
    end
    local open_selected_with_trouble = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end

    local find_files_no_ignore = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      telescope("find_files", { no_ignore = true, default_text = line })()
    end
    local find_files_with_hidden = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      telescope("find_files", { hidden = true, default_text = line })()
    end

    return {
      defaults = {
        mappings = {
          i = {
            ["<C-t>"] = open_with_trouble,
            ["<M-t>"] = open_selected_with_trouble,
            ["<C-h>"] = find_files_with_hidden,
            ["<C-g>"] = find_files_no_ignore,

            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<M-u>"] = actions.preview_scrolling_up,
            ["<M-d>"] = actions.preview_scrolling_down,
            ["<M-h>"] = actions.preview_scrolling_left,
            ["<M-l>"] = actions.preview_scrolling_right,

            ["<M-p>"] = action_layout.toggle_preview,
            ["<C-q>"] = actions.smart_send_to_qflist,
            ["<C-y>"] = actions.complete_tag,

            ["<C-w>"] = { "<C-s-w>", type = "command" },
            ["<C-b>"] = { "<Home>", type = "command" },
            ["<C-e>"] = { "<End>", type = "command" },

            ["<C-/>"] = actions.which_key,
            ["<ESC>"] = actions.close,


            ["<C-d>"] = false,
            ["<C-f>"] = false,
            ["<C-l>"] = false,
            ["<C-u>"] = false,
            ["<C-v>"] = false,
            ["<C-x>"] = false,
            ["<M-k>"] = false,
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
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        zoxide = {
          prompt_title = "[ Zoxide List ]",
          list_command = "zoxide query -ls",
          mappings = {
            default = {
              action = function(selection)
                vim.cmd.cd(selection.path)
              end,
              after_action = function(selection)
                vim.notify("Directory changed to " .. selection.path)
              end,
            },
            ["<C-s>"] = { action = z_utils.create_basic_command("split") },
            ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
            ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
            ["<C-f>"] = {
              keepinsert = true,
              action = function(selection)
                builtin.find_files({ cwd = selection.path })
              end,
            },
            ["C-t"] = { action = function(selection) vim.cmd.tcd(selection.path) end }
          }
        }
      }
    }
  end,
}
