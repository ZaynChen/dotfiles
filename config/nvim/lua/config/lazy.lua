local sep = (function()
  ---@diagnostic disable-next-line: undefined-global
  if jit then
    ---@diagnostic disable-next-line: undefined-global
    local os = string.lower(jit.os)
    if os == "linux" or os == "osx" or os == "bsd" then
      return "/"
    else
      return "\\"
    end
  else
    return string.sub(package.config, 1, 1)
  end
end)()

function joinpath(...)
  local args = { n = select("#", ...), ... }
  return table.concat(args, sep)
end

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

-- local Util = require("util")
-- require("config.options")
vim.g.maplocalleader = " "
vim.g.mapleader = " "
require("lazy").setup("plugins", {
  root = joinpath(vim.fn.stdpath("data"), "lazy"), -- directory where plugins will be installed
  defaults = {
    lazy = false,                                  -- should plugins be lazy-loaded?
    version = false,
    -- default `cond` you can use to globally disable a lot of plugins
    -- when running inside vscode for example
    cond = function()
      return not vim.g.vscode
    end,
    -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
  -- leave nil when passing the spec as the first argument to setup()
  lockfile = joinpath(vim.fn.stdpath("config"), "lazy-lock.json"), -- lockfile generated after running update.
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "-8" }, -- show commits from the last 3 days
    timeout = 120,  -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
  dev = {
    path = "~/Repo/neovim",
    --- plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {},    -- For example {"folke"}
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "onedark" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    title = nil, ---@type string only works when border is not "none"
    title_pos = "center", ---@type "center" | "left" | "right"
    -- Show pills on top of the Lazy window
    pills = true, ---@type boolean
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    -- leave nil, to automatically select a browser depending on your OS.
    -- If you want to use a specific browser, you can define it here
    browser = nil, ---@type string?
    throttle = 20, -- how frequently should the ui process render events
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
  diff = {
    -- diff command <d> can be one of:
    -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
    --   so you can have a different command for diff <d>
    -- * git: will run git diff and open a buffer with filetype git
    -- * terminal_git: will open a pseudo terminal with git diff
    -- * diffview.nvim: will open Diffview to show the diff
    cmd = "git",
  },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = false,       -- get a notification when new updates are found
    frequency = 3600,     -- check for updates every hour
    check_pinned = false, -- check for pinned packages that can't be updated
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true,        -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {},          -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    enabled = true,
    root = joinpath(vim.fn.stdpath("state"), "lazy", "readme"),
    files = { "README.md", joinpath("lua", "**", "README.md") },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
  state = joinpath(vim.fn.stdpath("state"), "lazy", "state.json"), -- state info for checker and other things
  build = {
    -- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
    -- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
    -- executed. In this case, a warning message will be shown.
    warn_on_override = true,
  },
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

require("config").setup()
