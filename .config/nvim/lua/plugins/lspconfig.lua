local nmap = require("utils.keymap").nmap

local lsp_status = require("lsp-status")
lsp_status.register_progress()

local capabilities = require("cmp_nvim_lsp").update_capabilities(lsp_status.capabilities)

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  opts = { buffer = bufnr }

  nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  nmap("<leader>in", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)
  -- nmap("gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  nmap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

  -- Quick-fix
  nmap("<M-cr>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  nmap("<M-r>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  nmap("<leader>m", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

  nmap("g[", "<cmd>lua vim.diagnostic.goto_prev({border = 'rounded'})<cr>", opts)
  nmap("g]", "<cmd>lua vim.diagnostic.goto_next({border = 'rounded'})<cr>", opts)

  nmap("gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
  -- nmap("<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)

  lsp_status.on_attach(client)
end

-- Enable rust-tools
require("rust-tools").setup({
  on_attach = on_attach,
  capabilities = capabilities,
  tools = {
    inlay_hints = {
      show_variable_name = true,
    }
  },
  server = {
    standalone = true,
  },
  -- dap = {
  --   adapter = {
  --     type = "executable",
  --     command = "lldb-vscode",
  --     name = "rt_lldb"
  --   }
  -- }
})

-- Enable pyright
lspconfig.pyright.setup {
  cmd = { "pyright-langserver", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  signle_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  },
}

-- Enable sumneko_lua
lspconfig.sumneko_lua.setup {
  cmd = { "lua-language-server" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
  log_level = 2,
  signle_file_support = true,
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

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config {
  virtual_text = false,
  signs = {
    active = signs
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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })


