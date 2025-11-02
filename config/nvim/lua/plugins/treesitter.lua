local map = require("util").map

return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-textsubjects",
    "RRethy/nvim-treesitter-endwise",
    {
      "romgrk/nvim-treesitter-context",
      event = { "BufReadPost", "BufNewFile", "BufWritePre" },
      opts = {
        enable = true,
        max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = '-',
        zindex = 20, -- The Z-index of the context window
      },
      config = function(_, opts)
        local tsc = require("treesitter-context")
        tsc.setup(opts)
        map("[a", function() tsc.go_to_context(vim.v.count1) end, "[TS]Go to context")
      end
    },
  },
  config = function()
    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
    opts = { mode = { "n", "x", "o" } }
    map(";", ts_repeat_move.repeat_last_move, "repeat last move", opts)
    map(",", ts_repeat_move.repeat_last_move_opposite, "repeat last move in opposite direction",
      opts)
    map("f", ts_repeat_move.builtin_f, nil, opts)
    map("F", ts_repeat_move.builtin_F, nil, opts)
    map("t", ts_repeat_move.builtin_t, nil, opts)
    map("T", ts_repeat_move.builtin_T, nil, opts)

    require("nvim-treesitter.configs").setup {
      sync_install = false,
      ensure_installed = {
        "bash", "c", "cmake", "css", "csv", "cuda", "dockerfile",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "html", "hyprlang", "javascript", "json", "json5", "julia", "latex",
        "llvm", "lua", "luadoc", "luap", "make", "markdown", "markdown_inline",
        "nasm", "passwd", "python", "query", "ruby", "rust", "scss", "sql",
        "ssh_config", "tmux", "todotxt", "toml", "typescript", "vim", "vimdoc",
        "vue", "xml", "yaml", "zathurarc"
      },
      auto_install = true,
      ignore_install = {},
      parser_install_dir = nil,
      -- builtin modules
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        -- too strict
        enable = false,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = { -- NOTE: experimental feature
        enable = true,
      },
      -- external modules
      textobjects = {
        select = {
          enable = true,
          disable = {},
          lookahead = true,
          lookbehind = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
          selection_modes = {
            ["@parameter.outer"] = 'v',
            ["@function.outer"] = 'V',
            ["@class.outer"] = '<C-V>',
          },
          include_surrounding_whitespace = true,
        },
        move = {
          enable = true,
          disable = {},
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
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
          enable = true,
          border = "rounded",
          floating_preview_opts = {},
          disable = {},
          peek_definition_code = {
            ["<M-f>"] = "@function.outer",
            ["<M-c>"] = "@class.outer",
          }
        }
      },
      -- smart selection
      textsubjects = {
        enable = true,
        disable = {},
        prev_selection = "<C-CR>",
        keymaps = {
          ["<CR>"] = { "textsubjects-smart", desc = "textsubjects smart selection" },
          ["<M-CR>"] = { "textsubjects-container-outer", desc = "Select outside containers (classes, functions, etc.)" },
          ["i<M-CR>"] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
        },
      },
      -- highlight & navigating definition
      refactor = {
        highlight_definitions = {
          enable = true,
          clear_on_cursor_move = true,
        },
        highlight_current_scope = {
          enable = true,
        },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "<M-r>",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            -- goto_definition_lsp_fallback = false,
            goto_definition = false,
            list_definitions = false,
            list_definitions_toc = false,
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
        disable_virtual_text = false,
        include_match_words = true,
      },
    }
  end
}
