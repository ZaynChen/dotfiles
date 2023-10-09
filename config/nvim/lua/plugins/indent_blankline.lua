local ibl_ok, ibl = pcall(require, "indent_blankline")
if not ibl_ok then
  return
end

<<<<<<< HEAD
-- local hooks = require("ibl.hooks")
--
-- local highlight = {
--   "RainbowRed",
--   "RainbowYellow",
--   "RainbowBlue",
--   "RainbowOrange",
--   "RainbowGreen",
--   "RainbowViolet",
--   "RainbowCyan",
-- }

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
--   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)

-- vim.g.rainbow_delimiters = { highlight = highlight }

ibl.setup {
  indent = {
    char = "▏",
  },
  -- scope = { highlight = highlight }
}

-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
=======
ibl.setup {
  space_char_blankline = " ",
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
}

-- vim.cmd [[highlight IndentBlanklineContextStart guibg=#E5C07B gui=nocombine]]
>>>>>>> parent of 9a84d6a (update neovim plugin)
