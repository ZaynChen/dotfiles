local map = require("keymap.util").map

local lsp = vim.lsp
local diagnostic = vim.diagnostic

local M = {}

M.on_attach = function(bufnr)
  local mappings = {
    { "K",          lsp.buf.hover,           "[LSP]Hover" },
    { "<leader>la", lsp.buf.code_action,     "[LSP]Code action" },
    { "<leader>R",  lsp.buf.rename,          "[LSP]Rename" },
    { "gd",         lsp.buf.definition,      "[LSP]Definition" },
    { "gD",         lsp.buf.type_definition, "[LSP]Definition" },
  }
  for _, mapping in ipairs(mappings) do
    local lhs, rhs, desc = mapping[1], mapping[2], mapping[3]
    map(lhs, rhs, desc, { buffer = bufnr })
  end
end

return M
