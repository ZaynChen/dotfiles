local lsp_status = require("lsp-status")
lsp_status.register_progress()

local nmap = require("mappings").nmap

local capabilities = require("cmp_nvim_lsp").update_capabilities(lsp_status.capabilities)

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  opts = { buffer = bufnr, silent = true}

  nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  nmap("gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  -- origin map: go to sleep for N seconds (default 1)
  nmap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  -- origin map: go to the next tab page, using <leader>tl instead
  nmap("gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

  nmap("gwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
  nmap("gwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", opts)
  nmap("gwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", opts)
  -- Quick-fix
  nmap("gca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

  nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  nmap("<leader>m", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

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
          "/usr/share/lua/5.4/?.lua",
          "/usr/share/lua/5.4/?/init.lua"
        }
      },
      workspace = {
        -- library = vim.api.nvim_get_runtime_file("", true)
        library = {
          vim.fn.expand("~/.luarocks/share/lua/5.4"),
          "/usr/share/lua/5.4"
        }
      },
      completion = {
        keywordSnippet = "Enable"
        -- callSnippet = "Replace",
      },
      diagnostics = {
        enable = true,
        globals = { "vim", "hs", "it", "describe", "before_eac", "after_each" },
        disable = { "lowercase-global" }
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      }
    }
  }
}

-- -- Enable diagnostics
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--   }
-- )

vim.o.updatetime = 300

-- Show diagnostic popup on cursor hover
vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
-- Goto previous/next diagnostic warning/error
nmap("g[", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
nmap("g]", "<cmd>lua vim.diagnostic.goto_next()<cr>")
