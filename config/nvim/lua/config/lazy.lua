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
  -- leave nil when passing the spec as the first aurgument to setup()
  spec = nil,
  local_spec = true,
  lockfile = joinpath(vim.fn.stdpath("config"), "lazy-lock.json"),
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "--since=3 days ago" }, -- show commits from the last 3 days
    log = { "-8" }, -- show the last 8 commits
    timeout = 120,  -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    filter = true,
    throttle = { enabled = false, rate = 2, duration = 5 * 1000 },
    cooldown = 0,
  },
  pkg = {
    enabled = true,
    cache = joinpath(vim.fn.stdpath("state"), "lazy", "pkg-cache.lua"),
    sources = { "lazy", "rockspec", "packspec" }
  },
  rocks = {
    enabled = true,
    root = joinpath(vim.fn.stdpath("data"), "lazy-rocks"),
    server = "https://lumen-oss.github.io/rocks-binaries/",
    hererocks = false,
  },
  dev = {
    path = joinpath("~", "Repo", "neovim"),
    patterns = {},    -- use local plugins instead
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },
  install = {
    missing = true,
    colorscheme = { "base16-onedark", "onedark" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
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
      list = { "●", "➜", "★", "‒" },
    },
    -- leave nil, to automatically select a browser depending on your OS.
    -- If you want to use a specific browser, you can define it here
    browser = nil, ---@type string?
    throttle = 1000 / 30, -- how frequently should the ui process render events
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
  -- Output options for headless mode
  headless = {
    -- show the output from process commands like git
    process = true,
    -- show log messages
    log = true,
    -- show task start/end
    task = true,
    -- use ansi colors
    colors = true,
  },
  -- diff command <d> can be one of:
  -- * browser: opens the github compare view. Note that this is always mapped
  --   to <K> as well, so you can have a different command for diff <d>
  -- * git: will run git diff and open a buffer with filetype git
  -- * terminal_git: will open a pseudo terminal with git diff
  -- * diffview.nvim: will open Diffview to show the diff
  diff = { cmd = "git" },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = false,      -- get a notification when new updates are found
    frequency = 3600,    -- check for updates every hour
    check_pinned = true, -- check for pinned packages that can't be updated
  },
  change_detection = { enabled = true, notify = false },
  performance = {
    cache = { enabled = true },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      -- reset the runtime path to $VIMRUNTIME and your config directory
      reset = true,
      -- add any custom paths here that you want to includes in the rtp
      ---@type string[]
      paths = {},
      -- list any plugins you want to disable here
      ---@type string[]
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
  -- state info for checker and other things
  state = joinpath(vim.fn.stdpath("state"), "lazy", "state.json"),
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
