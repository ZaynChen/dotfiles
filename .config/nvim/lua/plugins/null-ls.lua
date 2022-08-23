local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
  return
end

-- local u = require("null-ls.utils")
local sources = {
  null_ls.builtins.formatting.black
}

local defaults = {
  cmd = { "nvim" },
  debounce = 250,
  debug = false,
  default_timeout = 5000,
  diagnostics_format = "#{m}",
  fallback_severity = vim.diagnostic.severity.ERROR,

  -- @usage set logging level
  -- possible values: { "off", "error", "warn", "info", "debug", "trace" }
  log_level = "warn",
  -- format string for vim.notify messages
  notify_format = "[null-ls] %s",
  on_attach = require("plugins.lsp").on_attach,
  on_init = nil,
  on_exit = nil,
  -- root_dir = u.root_pattern(".null-ls-root", "Makefile", ".git"),
  sources = sources,
  update_in_insert = false,
}

null_ls.setup(defaults)
