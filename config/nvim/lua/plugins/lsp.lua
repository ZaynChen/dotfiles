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
  event = { "BufReadPost", "BufNewFile", },
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
          version = "^6", -- Recommended
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
          lazy = false, -- This plugin is already lazy
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
        local lsp = vim.lsp

        -- lsp.config("*", {
        --   capabilities = require("cmp_nvim_lsp").default_capabilities(),
        -- })

        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(args)
            local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

            local grp = vim.api.nvim_create_augroup("UserLspConfig", { clear = false })

            -- FormatOnSave
            if not client:supports_method("textDocument/willSaveWaitUntil")
                and client:supports_method("textDocument/formatting") then
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = grp,
                buffer = args.buf,
                desc = "[LSP]FormatOnSave",
                callback = function()
                  lsp.buf.format({ bufnr = args.buf, id = client.id })
                end
              })
            end

            -- Show diagnostic popup on cursor hover
            -- <C-W>d (and <C-W><C-D>) map to vim.diagnostic.open_float()
            -- CTRL-W_d-default
            vim.api.nvim_create_autocmd("CursorHold", {
              group = grp,
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
      event = { "VeryLazy" },
      opts = {
        debug = false, -- set to true to enable debug logging
        -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        bind = true,
        wrap = true, -- allow doc/signature wrap inside floating_window, useful if your lsp doc/sig is too long
        -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default
        doc_lines = 10,
        floating_window = true,    -- show hint in a floating window, set to false for virtual text only mode
        floating_window_off_x = 1, -- adjust float windows x position.
        floating_window_off_y = 0, -- adjust float windows y position.
        zindex = 200,              -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
        -- double, rounded, single, shadow, none
        handler_opts = { border = "rounded" },
        padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc
        -- max height of signature floating_window, if content is more than max_height, you can scroll down
        -- to view the hiding contents
        max_height = 12,
        -- max_width of signature floating_window, line will be wrapped if exceed max_width
        max_width = function()
          -- get current windows width
          return math.max(math.floor(vim.api.nvim_win_get_width(0) * 0.8), 128)
        end,
        -- try to place the floating above the current line when possible Note:
        -- will set to true when fully tested, set to false will use whichever side has more space
        -- this setting will be helpful if you do not want the PUM and floating win overlap
        floating_window_above_cur_line = true,
        close_timeout = 4000, -- close floating window after ms when laster parameter is entered
        fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
        auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
        transparency = nil, -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 36, -- if you using shadow as border use this set the opacity
        shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
        hint_enable = false, -- virtual hint enable
        hint_prefix = "🐼 ", -- Panda for parameter
        hint_scheme = "String",
        hint_inline = false,
        -- how your parameter will be highlight
        hi_parameter = "LspSignatureActiveParameter",
        cursorhold_update = true,        -- if cursorhold slows down the completion, set to false to disable it
        check_completion_visible = true, -- adjust position of signature window relative to completion popup
        -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
        verbose = false,          -- show debug line number
        timer_interval = 200,     -- default timer check interval set to lower value if you want to reduce latency
        always_trigger = false,   -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
        extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        -- toggle signature on and off in insert mode
        -- set this key also helps if you want see signature in newline
        toggle_key = "<M-m>",
        toggle_key_flip_floatwin_setting = false, -- toggle key will enable|disable floating_window flag
        -- cycle to next signature, e.g. '<M-n>' function overloading
        -- internal vars, init here to suppress linter warnings
        select_signature_key = nil,
        move_cursor_key = nil,               -- use nvim_set_current_win
        move_signature_window_key = {},      -- move floating window, default ['<M-j>', '<M-k>']
        show_struct = { enable = true },
        ignore_error = function(err, ctx, _) -- provide your ignore callback here
          -- (err, ctx, config)
          -- ignore error for some clients
          -- this will also make it a bit harder to track issues
          if ctx and ctx.client_id then
            -- ignore error for some clients
            -- get client name by id
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            if client and vim.tbl_contains({ "rust_analyer", "clangd" }, client.name) then
              return true
            end
          end
          -- other examples:
          -- if err.code_name == 'InvalidParams' then return true end
          if err.code_name == "ContentModified" then return true end
        end,
      },
    }
  },
  opts = {
    ensure_installed = {
      "asm_lsp", "bashls", "clangd", "cmake", "cssls", "hyprls",
      "jsonls", "julials", "lua_ls", "mesonlsp", "pyright",
      "ruff", "vue_ls", "yamlls", "taplo",
    },

    automatic_enable = true,
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)
    -- enable all servers
    vim.lsp.enable({
      "asm_lsp", "bashls", "clangd", "cmake", "cssls", "hyprls",
      "jsonls", "julials", "lua_ls", "mesonlsp", "pyright",
      "ruff", "vue_ls", "yamlls", "taplo"
    })
  end,
}
