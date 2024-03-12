-- This module contains a number of default definitions
local rb_ok, rb = pcall(require, "rainbow-delimiters")
if not rb_ok then
  vim.api.nvim_err_writeln("Failed to load rainbow-delimiters")
  return
end

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rb.strategy['global'],
    vim = rb.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    latex = "rainbow-blocks",
    query = 'rainbow-blocks',
    -- lua = 'rainbow-blocks',
  },
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
  },
  blacklist = {},
}
