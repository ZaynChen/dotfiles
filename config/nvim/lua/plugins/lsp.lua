return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "cmake", "hyprls", "yamlls", "tombi", "mesonlsp", "termux_language_server",
      -- language
      "asm_lsp", "bashls", "clangd", "lua_ls", "zls",
      -- python
      "ruff", "ty",
      -- web
      "cssls", "html", "jsonls", "ts_ls", "vue_ls",
    },

    automatic_enable = true,
  },
  config = function(_, _opts)
    require("mason-lspconfig").setup(_opts)
    local registry = require("mason-registry")
    local ensure_installed_nolsp = { "prettier", "prettierd", "yq" }

    for _, pkg_name in ipairs(ensure_installed_nolsp) do
      local ok, pkg = pcall(registry.get_package, pkg_name)
      if ok and not pkg:is_installed() then
        pkg:install()
      end
    end
  end,
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
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
        { "mrcjkb/rustaceanvim",            lazy = false },
        { "chrisgrieser/nvim-lsp-endhints", event = "LspAttach", opts = {} },
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
      },
      config = function()
        vim.lsp.enable("julials")

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
              callback = function() vim.diagnostic.open_float({ bufnr = args.buf }) end
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
            border = "rounded",
            source = true,
            header = "",
            prefix = "",
            focusable = false,
            close_events = {
              "CursorMoved", "CursorMovedI", "InsertCharPre", -- default
              "BufWinLeave",
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
        hint_prefix = {
          above = "↙ ",
          current = "← ",
          below = "↖ "
        },
        -- how your parameter will be highlight
        -- hi_parameter = "LspSignatureActiveParameter",
        hi_parameter = "Search",
        -- toggle signature on and off in insert mode
        -- set this key also helps if you want see signature in newline
        toggle_key = "<M-m>",
        show_struct = { enable = true },
      },
    }
  },
}
