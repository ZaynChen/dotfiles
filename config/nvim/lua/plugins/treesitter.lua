local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_ok then
  return
end

treesitter.setup {
  sync_install = false,
  ensure_installed = {
    "bash", "c", "cmake", "csv", "cuda", "dockerfile",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
    "html", "javascript", "json", "json5", "julia",
    "latex", "llvm", "lua", "luadoc", "make", "markdown", "nasm", "passwd",
    "python", "query", "ruby", "rust", "sql", "ssh_config", "tmux", "todotxt",
    "toml", "vim", "vimdoc", "vue", "xml", "yaml", "zathurarc",
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
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
      },
      goto_next = {
        ["<M-]>"] = "@function.outer",
      },
      goto_previous = {
        ["<M-[>"] = "@function.outer",
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
