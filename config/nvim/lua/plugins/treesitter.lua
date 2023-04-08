local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
local rainbow_ok, rainbow = pcall(require, "ts-rainbow")

if (not treesitter_ok) and (not rainbow_ok) then
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
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
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
  -- rainbow parens
  rainbow = {
    enable = true,
    disable = {},
    extended_mode = true,
    strategy = {
      -- Use global strategy by default
      rainbow.strategy['global'],
      -- Use local for HTML
      html = rainbow.strategy['local'],
      -- Pick the strategy for LaTeX dynamically based on the buffer size
      latex = function()
        -- Disabled for very large files, global strategy for large files,
        -- local strategy otherwise
        if vim.fn.line('$') > 10000 then
          return nil
        elseif vim.fn.line('$') > 1000 then
          return rainbow.strategy['global']
        end
        return rainbow.strategy['local']
      end
    },
    query = {
      "rainbow-parens",
      html = "rainbow-tags",
      latex = "rainbow-blocks",
    },
    -- Highlight groups in order of display
    hlgroups = {
      -- The colours are intentionally not in the usual order to make
      -- the contrast between them stronger
      'TSRainbowRed',
      'TSRainbowYellow',
      'TSRainbowBlue',
      'TSRainbowOrange',
      'TSRainbowGreen',
      'TSRainbowViolet',
      'TSRainbowCyan',
    },
  },
}
