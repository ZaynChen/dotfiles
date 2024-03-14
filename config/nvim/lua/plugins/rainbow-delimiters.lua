return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rb = require("rainbow-delimiters")
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
  end
}
