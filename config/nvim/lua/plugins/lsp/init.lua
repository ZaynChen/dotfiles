local extension_path = "/usr/lib/codelldb"
local codelldb_path = extension_path .. "/adapter/codelldb"
local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"

return {
  "neovim/nvim-lspconfig",
  version = false,
  event = { "BufReadPost", "BufNewFile", },
  dependencies = {
    {
      "williamboman/mason.nvim",
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
      "williamboman/mason-lspconfig.nvim",
      opts = {
        -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
        -- This setting has no relation with the `automatic_installation` setting.
        ensure_installed = {
          "lua_ls", "clangd", "cmake", "pyright", "bashls",
          "volar", "asm_lsp", "rust_analyzer", "julials",
        },

        -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
        -- This setting has no relation with the `ensure_installed` setting.
        -- Can either be:
        --   - false: Servers are not automatically installed.
        --   - true: All servers set up via lspconfig are automatically installed.
        --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
        --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
        ---@type boolean
        automatic_installation = true,

        -- See `:h mason-lspconfig.setup_handlers()`
        ---@type table<string, fun(server_name: string)>?
        handlers = nil,
      },
    },
    "nvim-lua/lsp-status.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "JuliaEditorSupport/julia-vim",
    "simrat39/rust-tools.nvim",
    "ray-x/lsp_signature.nvim",
  },
  config = function()
    local lsp = vim.lsp
    local lsp_status = require("lsp-status")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason_lspconfig = require("mason-lspconfig")
    -- local lsp_format = require("lsp-format") -- autocmd
    -- require("plugins.lsp.mason")

    lsp_status.register_progress()

    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, lsp_status.capabilities)
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    local on_attach = function(client)
      lsp_status.on_attach(client)
      -- lsp_format.on_attach(client)
    end

    local server_opts = {
      {
        capabilities,
        on_attach,
      },
      julials = true,
      clangd = {
        handlers = lsp_status.extensions.clangd.setup(),
        init_options = {
          clangdFileStatus = true,
        },
      },
      cmake = true,
      pyright = true,
      bashls = true,
      volar = {
        init_options = {
          typescript = {
            tsdk = vim.env.XDG_DATA_HOME .. '/npm/lib/node_modules/typescript/lib'
          }
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = 'Lua 5.4',
              path = {
                "?.lua",
                "?/init.lua",
                vim.fn.expand("~/.luarocks/share/lua/5.4/?.lua"),
                vim.fn.expand("~/.luarocks/share/lua/5.4/?/init.lua"),
                -- "/usr/share/lua/5.4/?.lua",
                -- "/usr/share/lua/5.4/?/init.lua"
              }
            },
            workspace = {
              library = {
                vim.fn.expand("~/.luarocks/share/lua/5.4"),
                -- "/usr/share/lua/5.4",
              }
              -- library = vim.tbl_extend("keep",
              --   vim.api.nvim_get_runtime_file("", true), {
              --   -- vim.fn.expand(vim.env.NVIMRUNTIME .. "/lua"),
              --   vim.fn.expand("~/.luarocks/share/lua/5.4"),
              --   -- "/usr/share/lua/5.4",
              -- })
            },
            format = {
              enable = true,
              -- defaultConfig = {
              --   indent_style = "space",
              --   indent_size = "2",
              -- }
            },
            completion = {
              keywordSnippet = "Replace", -- Disable,Replace,Both
              -- callSnippet = "Replace",
            },
            diagnostics = {
              enable = true,
              globals = { "vim", "hs", "it", "describe", "before_each", "after_each" },
              disable = { "lowercase-global" },
              -- neededFileStatus = {
              --   ["codestyle-check"] = "Any",
              -- }
            },
            hint = {
              enable = true,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            }
          },
        }
      },
      asm_lsp = true
    }

    mason_lspconfig.setup_handlers {
      function(server)
        local opts = server_opts[server]
        if not opts then
          return
        end

        if type(opts) ~= "table" then
          opts = {}
        end

        opts = vim.tbl_deep_extend("force", server_opts[1], opts)
        lspconfig[server].setup(opts)
      end
    }

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
}
