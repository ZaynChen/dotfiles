local lsp = vim.lsp
local diagnostic = vim.diagnostic

-- local lsp_format = require("lsp-format") -- autocmd
local lsp_status = require("lsp-status")
lsp_status.register_progress()

local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(lsp_status.capabilities)
local on_attach = function(client, bufnr)
  require("keymap.integration.lsp").on_attach(bufnr)

  -- Enable completion triggered by <c-x><c-o>
  -- vim.bo.omnifunc = "v:lua.lsp.omnifunc"

  -- FormatOnSave
  local lsp_augroup = vim.api.nvim_create_augroup("lsp_augroup" .. bufnr, { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_augroup,
    buffer = bufnr,
    desc = "[LSP]FormatOnSave",
    callback = function() lsp.buf.formatting_sync(nil, 3000) end
  })

  -- Show diagnostic popup on cursor hover
  vim.api.nvim_create_autocmd("CursorHold", {
    group = lsp_augroup,
    buffer = bufnr,
    desc = "[Diagnostic]Open float when cursor hold",
    callback = function() diagnostic.open_float(nil, { focusable = false }) end
  })

  lsp_status.on_attach(client)
  -- lsp_format.on_attach(client)
end

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

-- Enable rust-tools
require("rust-tools").setup {
  -- tools = {
  --   inlay_hints = {
  --     show_variable_name = true,
  --   }
  -- },
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    standalone = true,
    settings = {
      ["rust-analyzer"] = {
        -- imports = {
        --   granularity = {
        --     group = "module",
        --   },
        --   prefix = "self",
        -- },
        checkOnSave = {
          command = "clippy",
        },
      }
    }
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
      codelldb_path, liblldb_path)
    -- adapter = {
    --   type = "executable",
    --   command = "lldb-vscode",
    --   name = "rt_lldb"
    -- }
  }
}

-- Enable clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Enable cmake
lspconfig.cmake.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Enable pyright
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Enable sumneko_lua
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
        keywordSnippet = "Enable",
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
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      }
    },
  }
}

local sign_define = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ""
  })
end

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  sign_define(sign)
  -- vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

diagnostic.config {
  virtual_text = false,
  signs = true,
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
