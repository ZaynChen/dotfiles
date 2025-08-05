local Util = require("util")

local M = {}

function M.setup()
  M.load("options")

  -- autocmds can be loaded lazily when not opening a file
  local lazy_autocmds = vim.fn.argc(-1) == 0
  if not lazy_autocmds then
    M.load("autocmds")
  end

  local group = vim.api.nvim_create_augroup("lazynvim", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    callback = function()
      if lazy_autocmds then
        M.load("autocmds")
      end
      M.load("keymaps")
    end
  })

  Util.track("colorscheme")

  -- 'termguicolors' is enabled by default
  -- when Nvim is able to determine that
  -- the host terminal emulator supports 24-bit color.  neovim-0.10
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.cmd.colorscheme("base16-onedark")

  Util.track()
end

-- @param name "autocmds" | "options" | "keymaps"
function M.load(name)
  local function _load(mod)
    if require("lazy.core.cache").find(mod)[1] then
      Util.try(function()
        require(mod)
      end, { msg = "Failed loading " .. mod })
    end
  end

  _load("config." .. name)
end

return M
