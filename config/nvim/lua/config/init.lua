local Util = require("util")

local M = {}

function M.setup()
  M.load("options")

  -- autocmds can be loaded lazily when not opening a file
  local lazy_autocmds = vim.fn.argc(-1) == 0
  if not lazy_autocmds then M.load("autocmds") end

  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("lazynvim", { clear = true }),
    pattern = "VeryLazy",
    callback = function()
      if lazy_autocmds then M.load("autocmds") end
      M.load("keymaps")
    end
  })

  vim.cmd.colorscheme("base16-onedark")
end

-- @param name "autocmds" | "options" | "keymaps"
function M.load(name)
  local mod = "config." .. name
  if require("lazy.core.cache").find(mod)[1] then
    Util.try(function() require(mod) end, { msg = "Failed loading " .. mod })
  end
end

return M
