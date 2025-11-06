local highlight = {
  "RainbowDelimiterRed",
  "RainbowDelimiterYellow",
  "RainbowDelimiterBlue",
  "RainbowDelimiterOrange",
  "RainbowDelimiterGreen",
  "RainbowDelimiterViolet",
  "RainbowDelimiterCyan",
}

function define_hlgroups()
  -- base16-onedark
  local colors = {
    RainbowDelimiterRed = { fg = "#E06C75", ctermfg = "Red" },
    RainbowDelimiterYellow = { fg = "#E5C07B", ctermfg = "Yellow" },
    RainbowDelimiterBlue = { fg = "#61AFEF", ctermfg = "Blue" },
    RainbowDelimiterOrange = { fg = "#D19A66", ctermfg = "White" },
    RainbowDelimiterGreen = { fg = "#98C379", ctermfg = "Green" },
    RainbowDelimiterViolet = { fg = "#C678DD", ctermfg = "Magenta" },
    RainbowDelimiterCyan = { fg = "#56B6C2", ctermfg = "Cyan" },
  }

  for name, val in pairs(colors) do
    vim.api.nvim_set_hl(0, name, val)
  end
end

define_hlgroups()

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      indent = {
        char = "▏",
      },
    },
    config = function(_, opts)
      local ibl = require("ibl")
      local hooks = require("ibl.hooks")

      ibl.setup(opts)
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, define_hlgroups)
      ibl.setup {
        scope = { highlight = highlight }
      }

      hooks.register(
        hooks.type.SCOPE_HIGHLIGHT,
        hooks.builtin.scope_highlight_from_extmark)
    end
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = "rainbow-delimiters.strategy.global",
          vim = "rainbow-delimiters.strategy.local",
        },
        query = {
          [''] = "rainbow-delimiters",
          lua = "rainbow-blocks",
          latex = "rainbow-blocks",
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = highlight,
        blacklist = {},
      }
    end
  }
}
