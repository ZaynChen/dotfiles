-- local extension_path = "/usr/lib/codelldb"
-- local codelldb_path = extension_path .. "/adapter/codelldb"
-- local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"

return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufNewFile", },
  opts = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {
      "lua_ls", "clangd", "cmake", "pyright", "bashls",
      "vue_ls", "asm_lsp", "rust_analyzer", "julials",
    },

    -- Whether installed servers should automatically be enabled via `:h vim.lsp.enable()`.
    --
    -- To exclude certain servers from being automatically enabled:
    -- ```lua
    --   automatic_enable = {
    --     exclude = { "rust_analyzer", "ts_ls" }
    --   }
    -- ```
    --
    -- To only enable certain servers to be automatically enabled:
    -- ```lua
    --   automatic_enable = {
    --     "lua_ls",
    --     "vimls"
    --   }
    --   FIX: do not work
    -- ```
    ---@type boolean | string[] | { exclude: string[] }
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
        "hrsh7th/cmp-nvim-lsp",
      },
      config = function()
        local lsp = vim.lsp

        lsp.config("*", {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        local map = require("util").map

        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(ev)
            local buf = ev.buf

            vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
            vim.bo[buf].tagfunc = "v:lua.vim.lsp.tagfunc"

            -- FormatOnSave
            local grp = vim.api.nvim_create_augroup("UserLspConfig", { clear = false })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = grp,
              buffer = buf,
              desc = "[LSP]FormatOnSave",
              callback = function()
                lsp.buf.format({ async = false })
              end
            })

            -- Show diagnostic popup on cursor hover
            -- <C-W>d (and <C-W><C-D>) map to vim.diagnostic.open_float()
            -- CTRL-W_d-default
            vim.api.nvim_create_autocmd("CursorHold", {
              group = grp,
              buffer = buf,
              desc = "[Diagnostic]Open float when cursor hold",
              callback = function()
                vim.diagnostic.open_float(nil, { focusable = false })
              end
            })

            local mappings = {
              { "K",  lsp.buf.hover,          "[LSP]Hover" },
              { "gd", lsp.buf.definition,     "[LSP]Definition" },
              { "gD", lsp.buf.declaration,    "[LSP]Declaration" },
              { "gK", lsp.buf.signature_help, "[LSP]Signature" },
            }
            for _, mapping in ipairs(mappings) do
              local lhs, rhs, desc = mapping[1], mapping[2], mapping[3]
              map(lhs, rhs, desc, { buffer = buf })
            end
          end
        })

        -- diagnostic config
        vim.diagnostic.config {
          virtual_text = false,
          -- signs = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.HINT] = "",
              [vim.diagnostic.severity.INFO] = "",
            },
          },
          update_in_insert = true,
          underline = true,
          severity_sort = true,
          float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
          },
        }
      end,
    },
    "JuliaEditorSupport/julia-vim",
    "simrat39/rust-tools.nvim",
    {
      "ray-x/lsp_signature.nvim",
      event = { "VeryLazy" },
      opts = {
        debug = false,                                              -- set to true to enable debug logging
        log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        verbose = false,                                            -- show debug line number

        bind = true,                                                -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 10,                                             -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default

        floating_window = true,                -- show hint in a floating window, set to false for virtual text only mode

        floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
        -- will set to true when fully tested, set to false will use whichever side has more space
        -- this setting will be helpful if you do not want the PUM and floating win overlap

        floating_window_off_x = 1, -- adjust float windows x position.
        floating_window_off_y = 0, -- adjust float windows y position.


        fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = false, -- virtual hint enable
        hint_prefix = "🐼 ", -- Panda for parameter
        hint_scheme = "String",
        hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
        max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
        -- to view the hiding contents
        max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
          border = "rounded" -- double, rounded, single, shadow, none
        },

        always_trigger = false,   -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

        auto_close_after = nil,   -- autoclose signature float win after x sec, disabled if nil.
        extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        zindex = 200,             -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

        padding = '',             -- character to pad on left and right of signature can be ' ', or '|'  etc

        transparency = nil,       -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 36,        -- if you using shadow as border use this set the opacity
        shadow_guibg = 'Black',   -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
        timer_interval = 200,     -- default timer check interval set to lower value if you want to reduce latency
        toggle_key = "<M-k>"      -- toggle signature on and off in insert mode
      },
    }
  },
  config = function()
    -- enable all servers
    vim.lsp.enable({
      "lua_ls", "clangd", "cmake", "pyright", "bashls",
      "vue_ls", "asm_lsp", "rust_analyzer", "julials",
    })
  end
}
