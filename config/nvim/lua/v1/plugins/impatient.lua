_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache') .. '/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache') .. '/luacache_modpaths',
  }
}

if not pcall(require, "impatient") then
  -- print "Failed to load impatient."
  vim.api.nvim_err_writeln("Failed to load impatient")
end
