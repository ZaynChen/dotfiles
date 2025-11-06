local map = require("util").map

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function(_, _opts)
    local ts = require("nvim-treesitter")
    ts.setup(_opts)
    -- (This is a no-op if the parsers are already installed.)
    ts.install {
      "bash", "c", "cmake", "css", "csv", "cuda", "dockerfile",
      "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
      "html", "hyprlang", "javascript", "json", "json5", "julia", "latex",
      "llvm", "lua", "luadoc", "luap", "make", "markdown", "markdown_inline",
      "nasm", "passwd", "python", "query", "ruby", "rust", "scss", "sql",
      "ssh_config", "tmux", "todotxt", "toml", "typescript",
      "vim", "vimdoc", "vue", "xml", "yaml", "zathurarc"
    }
  end,
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-refactor",
    -- "RRethy/nvim-treesitter-textsubjects",
    "RRethy/nvim-treesitter-endwise",
    {
      "nvim-treesitter/nvim-treesitter-context",
      event = { "BufReadPost", "BufNewFile", "BufWritePre" },
      opts = {
        enable = true,
        multiwindow = false,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        mode = "cursor",
        separator = "-",
        zindex = 20,
        on_attach = nil
      },
      config = function(_, _opts)
        local tsc = require("treesitter-context")
        tsc.setup(_opts)
        map("[a", function() tsc.go_to_context(vim.v.count1) end, "[TS]Go to context")
      end
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      opts = {
        select = {
          enable = true,
          disable = {},
          lookahead = true,
          lookbehind = true,
          selection_modes = {
            ["@parameter.outer"] = 'v',
            ["@function.outer"] = 'V',
            ["@class.outer"] = '<C-V>',
          },
          include_surrounding_whitespace = true,
        },
        move = {
          set_jumps = true,
        },
      },
      config = function(_, _opts)
        require("nvim-treesitter-textobjects").setup(_opts)

        -- keymaps
        -- You can use the capture groups defined in `textobjects.scm`
        function select_keymaps()
          local select = require("nvim-treesitter-textobjects.select")

          map("af", function()
            select.select_textobject("@function.outer", "textobjects")
          end, "[TS]select around function @function.outer", { mode = { "x", "o" } })
          map("if", function()
            select.select_textobject("@function.inner", "textobjects")
          end, "[TS]select inside function @function.inner", { mode = { "x", "o" } })
          map("ac", function()
            select.select_textobject("@class.outer", "textobjects")
          end, "[TS]select around class @class.outer", { mode = { "x", "o" } })
          map("ic", function()
            select.select_textobject("@class.inner", "textobjects")
          end, "[TS]select inside class @class.inner", { mode = { "x", "o" } })
          -- You can also use captures from other query groups like `locals.scm`
          -- vim.keymap.set({ "x", "o" }, "as", function()
          --   select_textobject("@local.scope", "locals")
          -- end)
        end

        function swap_keymaps()
          local swap = require("nvim-treesitter-textobjects.swap")
          map("<M-l>", function()
            swap.swap_next("@parameter.inner")
          end, "[TS]Parameter swap with next")
          map("<M-h>", function()
            swap.swap_previous("@parameter.inner")
          end, "[TS]parameter swap with previous")
        end

        function move_keymaps()
          local move = require("nvim-treesitter-textobjects.move")
          -- keymaps
          map("]m", function()
            move.goto_next_start("@function.outer", "textobjects")
          end, "[TS]Next method start", { mode = { "n", "x", "o" } })
          map("]M", function()
            move.goto_next_end("@function.outer", "textobjects")
          end, "[TS]Next method end", { mode = { "n", "x", "o" } })
          map("[m", function()
            move.goto_previous_start("@function.outer", "textobjects")
          end, "[TS]Previous method start", { mode = { "n", "x", "o" } })
          map("[M", function()
            move.goto_previous_end("@function.outer", "textobjects")
          end, "[TS]Previous method end", { mode = { "n", "x", "o" } })

          map("]n", function()
            move.goto_next_start("@class.outer", "textobjects")
          end, "[TS]Next class start", { mode = { "n", "x", "o" } })
          map("]N", function()
            move.goto_next_end("@class.outer", "textobjects")
          end, "[TS]Next class end", { mode = { "n", "x", "o" } })
          map("[n", function()
            move.goto_previous_start("@class.outer", "textobjects")
          end, "[TS]Previous class start", { mode = { "n", "x", "o" } })
          map("[N", function()
            move.goto_previous_end("@class.outer", "textobjects")
          end, "[TS]Previous class end", { mode = { "n", "x", "o" } })

          -- You can also pass a list to group multiple queries.
          -- map("]o", function()
          --   move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
          -- end, "[TS]Next loop start", { mode = { "n", "x", "o" } })
          -- map("[o", function()
          --   move.goto_previous_start({ "@loop.inner", "@loop.outer" }, "textobjects")
          -- end, "[TS]Previous loop start", { mode = { "n", "x", "o" } })

          -- Go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- "]d", "[d" conficts with got to diagnostic
          -- map("]d", function()
          --   move.goto_next("@conditional.outer", "textobjects")
          -- end, { mode = { "n", "x", "o" } })
          -- map("[d", function()
          --   move.goto_previous("@conditional.outer", "textobjects")
          -- end, { mode = { "n", "x", "o" } })

          -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
          -- map("]s", function()
          --   move.goto_next_start("@local.scope", "locals")
          -- end, { mode = { "n", "x", "o" } })
          -- map("]z", function()
          --   move.goto_next_start("@fold", "folds")
          -- end, { mode = { "n", "x", "o" } })
        end

        function repeat_move_keymaps()
          local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
          local opts = { mode = { "n", "x", "o" } }
          map(";", ts_repeat_move.repeat_last_move,
            "[TS]repeat last move", opts)
          map(",", ts_repeat_move.repeat_last_move_opposite,
            "[TS]repeat last move in opposite direction", opts)

          opts.expr = true
          map("f", ts_repeat_move.builtin_f_expr, nil, opts)
          map("F", ts_repeat_move.builtin_F_expr, nil, opts)
          map("t", ts_repeat_move.builtin_t_expr, nil, opts)
          map("T", ts_repeat_move.builtin_T_expr, nil, opts)
        end

        select_keymaps()
        swap_keymaps()
        move_keymaps()
        repeat_move_keymaps()
      end
    },
  },
}
