local lsp_status = require("lsp-status")
lsp_status.register_progress()

local nmap = require("mappings").nmap
local nbmap = require("mappings").nbmap

-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require("cmp_nvim_lsp").update_capabilities(lsp_status.capabilities)

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  -- Enable completioon triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  nbmap(bufnr, "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  nbmap(bufnr, "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  nbmap(bufnr, "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  nbmap(bufnr, "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
  -- origin map: go to sleep for N seconds (default 1)
  nbmap(bufnr, "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
  -- origin map: go to the next tab page, using <leader>tl instead
  nbmap(bufnr, "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
  nbmap(bufnr, "<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>")

  nbmap(bufnr, "gwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>")
  nbmap(bufnr, "gwr", "<cmd>lua vim.lsp.buf.remove_workspace_ffolder()<cr>")
  nbmap(bufnr, "gwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>")
  -- Quick-fix
  nbmap(bufnr, "gca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

  nbmap(bufnr, "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
  nbmap(bufnr, "<leader>m", "<cmd>lua vim.lsp.buf.formatting()<cr>")

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

