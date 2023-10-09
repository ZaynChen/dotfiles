local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_ok then
  return
end

treesitter.setup {
  ensure_installed = {
    "c", "lua", "rust", "julia", "python", "ruby", "bash", "llvm",
    "vimdoc", "luadoc", "todotxt",
    "html", "javascript",
    "yaml", "toml", "json",
    "markdown"
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  parser_install_dir = nil,
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
  indent = { -- NOTE: experimental feature
    enable = true,
  },
  textobjects = {
    -- TODO: explore
    select = {
      -- TODO: textsubjects conflict ??
      enable = false,
      disable = {},
      lookahead = true,
      lookbehind = true,
      keymaps = {},
      selection_modes = {},
      include_surrounding_whitespace = true,
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
      -- can peek the function body, not only signature
      -- TODO: customizing
      enable = true,
      disable = {},
      border = "none",
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>lf"] = "@function.outer",
        ["<leader>lF"] = "@class.outer",
      }
    }
  },
  -- smart selection
  -- TODO: explore Visual mode selection
  textsubjects = {
    enable = true,
    disable = {},
    prev_selection = ",",
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = "textsubjects-container-inner",
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
  -- alternative: nvim-treesitter-pairs
  matchup = {
    enable = true,
    disable = {},
    disable_virtual_text = true,
    include_match_words = true,
  },
}
