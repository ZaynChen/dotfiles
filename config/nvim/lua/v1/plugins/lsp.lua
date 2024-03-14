local lsp = vim.lsp

-- local lsp_format = require("lsp-format") -- autocmd
require("v1.plugins.lsp.lsp_signature")
-- require("plugins.lsp.mason")

local lsp_status = require("lsp-status")
lsp_status.register_progress()

local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_status.capabilities)
M.on_attach = function(client, bufnr)
  lsp_status.on_attach(client)
  -- lsp_format.on_attach(client)
end

local extension_path = "/usr/lib/codelldb"
local codelldb_path = extension_path .. "/adapter/codelldb"
local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"

local lspconfig = require("lspconfig")

-- Enable rust-tools
require("rust-tools").setup {
  -- tools = {
  --   inlay_hints = {
  --     show_variable_name = true,
  --   }
  -- },
  server = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
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

-- Enable julials
lspconfig.julials.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

-- Enable clangd
lspconfig.clangd.setup {
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true,
  },
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

-- Enable cmake
lspconfig.cmake.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

-- Enable pyright
lspconfig.pyright.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

-- Enable bashls
lspconfig.bashls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities
}

lspconfig.volar.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  init_options = {
    typescript = {
      tsdk = vim.env.XDG_DATA_HOME .. '/npm/lib/node_modules/typescript/lib'
    }
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

-- Enable lua language server
lspconfig.lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
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
}

-- Enable asm_lsp language server
-- FIX: root directory not found
lspconfig.asm_lsp.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

local map = require("v1.keymap.util").map
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
    vim.api.nvim_create_autocmd("CursorHold", {
      group = grp,
      buffer = buf,
      desc = "[Diagnostic]Open float when cursor hold",
      callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end
    })

    local mappings = {
      { "K",          lsp.buf.hover,           "[LSP]Hover" },
      { "<leader>la", lsp.buf.code_action,     "[LSP]Code action" },
      { "<leader>r",  lsp.buf.rename,          "[LSP]Rename" },
      { "gd",         lsp.buf.definition,      "[LSP]Definition" },
      { "gD",         lsp.buf.type_definition, "[LSP]Type Definition" },
    }
    for _, mapping in ipairs(mappings) do
      local lhs, rhs, desc = mapping[1], mapping[2], mapping[3]
      map(lhs, rhs, desc, { buffer = buf })
    end
  end
})
--
-- diagnostic config
--
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
end

vim.diagnostic.config {
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

return M
