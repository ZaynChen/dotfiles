-- The nvim-treesitter.ts_utils.get_node_text is deprecated
-- TODO
-- local ts_utils = require("nvim-treesitter.ts_utils")
-- ts_utils.get_node_text = vim.treesitter.query.get_node_text

require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "lua", "python", "rust", "ruby", "yaml", "toml", "json", "markdown" },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      -- init_selection = "<M-i>",
    }
  },
  textobjects = {
    select = {
      enable = false,
      disable = {},
      lookahead = true,
      lookbehind = true,
      keymaps = {},
      selection_modes = {},
    },
    move = {
      enable = true,
      disable = {},
      set_jumps = true,
      goto_next_start = {
        ["<M-]>"] = "@function.outer",
      },
      goto_next_end = {},
      goto_previous_start = {
        ["<M-[>"] = "@function.outer",
      },
      goto_previous_end = {},
    },
    swap = {
      enable = true,
      disable = {},
      swap_next = {
        ["<M-l>"] = "@parameter.inner",
      },
      swap_previous = {
        ["<M-h>"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = false,
      border = "none",
      disable = {},
      peek_definition_code = {},
    }
  },
  -- smart selection
  textsubjects = {
    enable = true,
    disable = {},
    prev_selection = ",",
    keymaps = {
      ["."] = 'textsubjects-smart',
      [";"] = 'textsubjects-container-outer',
      ["i;"] = 'textsubjects-container-inner',
    },
  },
  -- highlight & navigating definition
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    highlight_current_scope = {
      enable = false,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<leader>r",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_next_usage = "<M-j>",
        goto_previous_usage = "<M-k>",
      }
    }
  },
  -- smart add `end`
  endwise = {
    enable = true,
  },

  matchup = {
    enable = true,
    disable_virtual_text = {},
    include_match_words = {},
  },
  -- rainbow brackets
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings

    -- colors = {

    -- },

    -- termcolors = {

    -- }
  },
}
