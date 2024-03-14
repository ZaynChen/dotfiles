local hlslens_ok, hlslens = pcall(require, "hlslens")

if not hlslens_ok then
  vim.api.nvim_err_writeln("Failed to load hlslens")
  return
end

hlslens.setup()
