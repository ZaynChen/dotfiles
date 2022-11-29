local map = require("keymap.util").map

local lsp = vim.lsp

local M = {}

M.on_attach = function(bufnr)
  local mappings = {
    { "gd", function() lsp.buf.definition() end, "[LSP]Definition" },
    { "K", function() lsp.buf.hover() end, "[LSP]Hover" },
    { "<leader>la", function() lsp.buf.code_action() end, "[LSP]Code action" },
    { "<leader>lf", function() lsp.buf.format { async = true } end, "[LSP]Formatting" },
    { "<leader>lr", function() lsp.buf.rename() end, "[LSP]Rename" },
  }
  for _, mapping in ipairs(mappings) do
    local lhs, rhs, desc = mapping[1], mapping[2], mapping[3]
    map(lhs, rhs, desc, { buffer = bufnr })
  end
end

return M
