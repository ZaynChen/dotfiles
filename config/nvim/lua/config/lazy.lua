local joinpath = require("util").joinpath
local lazypath = joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config").setup()

require("lazy").setup("plugins", {
  root = joinpath(vim.fn.stdpath("data"), "lazy"),
  defaults = {
    lazy = false,
    version = false,
  },
  rocks = {
    hererocks = false,
  },
  dev = {
    path = joinpath("~", "Repo", "neovim"),
    patterns = {},    -- use local plugins instead
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },
  install = {
    colorscheme = { "base16-onedark", "onedark" },
  },
  ui = {
    border = "rounded",
    custom_keys = {
      -- You can define custom key maps here. If present, the description will
      -- be shown in the help menu.
      -- To disable one of the defaults, set it to false.
      -- ["<localleader>l"] = {
      --   function(plugin)
      --     require("lazy.util").float_term({ "lazygit", "log" }, {
      --       cwd = plugin.dir,
      --     })
      --   end,
      --   desc = "Open lazygit log",
      -- },
      --
      -- ["<localleader>t"] = {
      --   function(plugin)
      --     require("lazy.util").float_term(nil, {
      --       cwd = plugin.dir,
      --     })
      --   end,
      --   desc = "Open terminal in plugin dir",
      -- },
    },
  },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    check_pinned = true, -- check for pinned packages that can't be updated
  },
  change_detection = { notify = false },
  -- Enable profiling of lazy.nvim. This will add some overhead,
  -- so only enable this when you are debugging lazy.nvim
  profiling = {
    -- Enables extra stats on the debug tab related to the loader cache.
    -- Additionally gathers stats about all package.loaders
    loader = true,
    -- Track each new require in the Lazy profiling tab
    require = true,
  },
})
