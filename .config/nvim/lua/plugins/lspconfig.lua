local lsp = vim.lsp
local diagnostic = vim.diagnostic

local nmap = require("utils.keymap").nmap
-- local lsp_format = require("lsp-format") -- autocmd
local lsp_status = require("lsp-status")
lsp_status.register_progress()

local capabilities = require("cmp_nvim_lsp").update_capabilities(lsp_status.capabilities)

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  -- desc for which_key hints
  local opts = function(desc)
    local opts = { buffer = true }
    opts.desc = desc
    return opts
  end

  -- nmap("gD", lsp.buf.declaration, opts("lsp.buf.declaration"))
  nmap("K", lsp.buf.hover, opts("[LSP]Hover info"))
  nmap("<C-s>", lsp.buf.signature_help, opts("[LSP]Signature info"))

  nmap("<C-]>", lsp.buf.definition, opts("[LSP]Go to definition"))
  nmap("gd", lsp.buf.type_definition, opts("[LSP]Go to type definition"))

  nmap("gi", lsp.buf.implementation, opts("[LSP]List Implementations"))
  -- nmap("<leader>in", lsp.buf.incoming_calls, opts("[LSP]List calls"))
  nmap("gr", lsp.buf.references, opts("[LSP]List References"))

  nmap("<M-r>", lsp.buf.rename, opts("[LSP]Rename"))
  nmap("<leader>m", lsp.buf.formatting, opts("[LSP]Formatting"))
  nmap("<M-cr>", lsp.buf.code_action, opts("[LSP]Code action"))

  nmap("\\d", diagnostic.open_float, opts("[Diagnostic]Open float"))
  nmap("]d", diagnostic.goto_next, opts("[Diagnostic]Goto next"))
  nmap("[d", diagnostic.goto_prev, opts("[Diagnostic]Goto prev"))
  -- nmap("<leader>dq", diagnostic.setloclist, opts("diagnostic.setloclist"))

  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.lsp.omnifunc")
  vim.bo.omnifunc = "v:lua.lsp.omnifunc"

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

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

diagnostic.config {
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

lsp.handlers["textDocument/hover"] = lsp.with(
  lsp.handlers.hover,
  { border = "rounded" }
)

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
  lsp.handlers.signature_help,
  { border = "rounded" }
)

lsp.handlers["textDocument/references"] = lsp.with(
  lsp.handlers["textDocument/references"],
  { loclist = true }
)

lsp.handlers['textDocument/typeDefinition'] = lsp.with(
  lsp.handlers['textDocument/typeDefinition'],
  { loclist = true, }
)

lsp.handlers['textDocument/declaration'] = lsp.with(
  lsp.handlers['textDocument/declaration'],
  { loclist = true }
)

lsp.handlers['textDocument/definition'] = lsp.with(
  lsp.handlers['textDocument/definition'],
  { loclist = true }
)

lsp.handlers['textDocument/implementation'] = lsp.with(
  lsp.handlers['textDocument/implementation'],
  { loclist = true, }
)
