-- local extension_path = "/usr/lib/codelldb"
-- local codelldb_path = extension_path .. "/adapter/codelldb"
-- local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"
local orig_open_floating_preview = vim.lsp.util.open_floating_preview;
function vim.lsp.util.open_floating_preview(contents, syntax, opts)
  opts = opts or {}
  -- floating windows will be closed when
  -- 1. leave current buffer (go to definition)
  -- 2. cursor moved (page up or page down also moves cursor)
  opts.close_events = {
    "BufWinLeave",
    "CursorMoved", "CursorMovedI",
  }
  return orig_open_floating_preview(contents, syntax, opts)
end

return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "asm_lsp", "bashls", "clangd", "cmake", "cssls", "hyprls", "html",
      "jsonls", "julials", "lua_ls", "mesonlsp", "pyright", "ruff",
      "taplo", "ts_ls", "vue_ls", "yamlls",
    },

    automatic_enable = true,
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        -- The directory in which to install packages.
        -- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

        ---@type '"prepend"' | '"append"' | '"skip"'
        PATH = "prepend",
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      },
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        -- "hrsh7th/cmp-nvim-lsp",
        {
          "mrcjkb/rustaceanvim",
          lazy = false, -- This plugin is already lazy
          init = function()
            -- Configure rustaceanvim here
            vim.g.rustaceanvim = {
              server = {
                default_settings = {
                  ["rust-analyzer"] = {
                    -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
                  }
                }
              }
            }
          end,
        },
        {
          "stevearc/conform.nvim",
          event = { "BufWritePre" },
          cmd = { "ConformInfo" },
          opts = {
            formatters_by_ft = {
              python = { "ruff" },
              javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            default_format_opts = { lsp_format = "fallback" },
            format_on_save = { timeout_ms = 500 }
          },
          init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
          end,
        },
        {
          "chrisgrieser/nvim-lsp-endhints",
          event = "LspAttach",
          opts = {
            icons = {
              type = "󰜁 ",
              parameter = "󰏪 ",
              offspec = " ", -- hint kind not defined in official LSP spec
              unknown = " ", -- hint kind is nil
            },
            label = {
              truncateAtChars = 20,
              padding = 1,
              marginLeft = 0,
              sameKindSeparator = ", ",
            },
            extmark = {
              priority = 50,
            },
            autoEnableHints = true,
          }, -- required, even if empty
        },
      },
      config = function()
        -- lsp.config("*", {
        --   capabilities = require("cmp_nvim_lsp").default_capabilities(),
        -- })

        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(args)
            -- Show diagnostic popup on cursor hover
            -- <C-W>d (and <C-W><C-D>) map to vim.diagnostic.open_float()
            -- CTRL-W_d-default
            vim.api.nvim_create_autocmd("CursorHold", {
              group = vim.api.nvim_create_augroup("UserLspConfig", { clear = false }),
              buffer = args.buf,
              desc = "[Diagnostic]Open float when cursor hold",
              callback = function()
                vim.diagnostic.open_float({ bufnr = args.buf })
              end
            })
          end
        })

        -- diagnostic config
        vim.diagnostic.config {
          update_in_insert = true,
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.HINT] = "",
              [vim.diagnostic.severity.INFO] = "",
            },
          },
          float = {
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
            focusable = false,
            close_events = {
              "BufWinLeave",
              "CursorMoved", "CursorMovedI",
              "InsertCharPre"
            }
          },
        }
      end,
    },
    "JuliaEditorSupport/julia-vim",
    {
      "ray-x/lsp_signature.nvim",
      event = { "InsertEnter" },
      opts = {
        debug = false, -- set to true to enable debug logging
        -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        bind = true,
        doc_lines = 10,
        wrap = true,
        floating_window = true,
        floating_window_above_cur_line = true,
        floating_window_off_x = 1, -- adjust float windows x position.
        floating_window_off_y = 0, -- adjust float windows y position.
        zindex = 200,
        max_height = 12,
        max_width = function()
          -- get current windows width
          return math.max(math.floor(vim.api.nvim_win_get_width(0) * 0.8), 128)
        end,
        padding = "",
        transparency = nil,
        -- double, rounded, single, shadow, none
        handler_opts = { border = "rounded" },
        -- when using shadow as border
        shadow_blend = 36,      -- shadow opacity
        shadow_guibg = "Black", -- shadow bg
        close_timeout = 4000,
        -- set to true, the floating window will not auto-close until finish all parameters
        fix_pos = false,
        auto_close_after = nil,
        hint_enable = true,
        hint_prefix = {
          above = "↙ ",
          current = "← ",
          below = "↖ "
        },
        hint_scheme = "String",
        hint_inline = function() return false end,
        -- how your parameter will be highlight
        -- hi_parameter = "LspSignatureActiveParameter",
        hi_parameter = "Search",
        cursorhold_update = true,
        check_completion_visible = true,
        -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        log_path = require("util").joinpath(vim.fn.stdpath("cache"), "lsp_signature.log"),
        verbose = false, -- show debug line number
        timer_interval = 200,
        always_trigger = false,
        extra_trigger_chars = {},
        -- toggle signature on and off in insert mode
        -- set this key also helps if you want see signature in newline
        toggle_key = "<M-m>",
        -- toggle key will enable|disable floating_window flag
        toggle_key_flip_floatwin_setting = false,
        -- cycle to next signature, e.g. '<M-n>' function overloading
        -- internal vars, init here to suppress linter warnings
        select_signature_key = nil,
        move_cursor_key = nil,          -- use nvim_set_current_win
        move_signature_window_key = {}, -- move floating window, default ['<M-j>', '<M-k>']
        show_struct = { enable = true },
      },
    }
  },
}
