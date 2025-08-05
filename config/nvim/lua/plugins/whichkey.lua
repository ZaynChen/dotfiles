return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    presets = "modern", -- "classic" | "modern" | "helix"
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    filter = function(mapping)
      -- return mapping.desc and mapping.desc ~= ""
      return true
    end,
    spec = {},
    notify = true,
    triggers = {
      { "<auto>", mode = "nixso" },
    },
    defer = function(ctx)
      -- list_contains doesn't exist in neovim < v0.10
      if vim.list_contains({ "d", "y" }, ctx.operator) then
        return true
      end
      return vim.list_contains({ "<C-V>", "V" }, ctx.mode)
    end,
    plugins = {
      marks = true,       -- shows a list of your marks on ' and `
      registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
      },
    },
    win = {
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      -- border = "none",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
      zindex = 1000,
      bo = {},
      wo = {
        -- winblend = 10,
      },
    },
    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 3,          -- spacing between columns
    },
    keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    sort = { "local", "order", "group", "alphanum", "mod" },
    expand = 0, -- expand gruops when <= n mappings
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
        -- { "<Space>", "SPC" },
      },
      desc = {
        { "<Plug>%((.*)%)", "%1" },
        { "^%+",            "" },
        { "<[cC]md>",       "" },
        { "<[cC][rR]>",     "" },
        { "<[sS]ilent>",    "" },
        { "^lua%s+",        "" },
        { "^call%s+",       "" },
        { "^:%s*",          "" },
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
      ellipsis = "…",
      rules = {},
      colors = true,
      mappings = true,
      -- used by key format
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "⌫",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      }
    },
    disable = {
      ft = {},
      bt = {},
    },
    show_help = true,
    show_keys = true,
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    debug = false,
  },
  config = function()
    local wk = require("which-key")

    require("which-key.plugins.spelling").actions = {
      { trigger = "z=", mode = "n" }
    }

    wk.add({
      {
        mode = { "i" },
        { "<C-D>",   desc = "delete one shiftwidth of indent in the current line" },
        { "<C-E>",   desc = "[Cmp]Abort" },
        { "<C-F>",   desc = "not used" },
        { "<C-H>",   desc = "same as <BS>" },
        { "<C-J>",   desc = "same as <CR>" },
        { "<C-K>",   desc = "enter digraph" },
        { "<C-N>",   desc = "[Cmp]Next" },
        { "<C-O>",   desc = "execute a single command and return to insert mode" },
        { "<C-P>",   desc = "[Cmp]Prev" },
        { "<C-Q>",   desc = "same as <C-V>, unless used for terminal control flow" },
        { "<C-S>",   desc = "not used or used for terminal control flow" },
        { "<C-T>",   desc = "insert one shiftwidth of indent in the current line" },
        { "<C-U>",   desc = "delete all entered chars in the current line" },
        { "<C-W>",   desc = "delete word before the cursor" },
        { "<C-Y>",   desc = "[Cmp]Comfirm" },
        { "<Down>",  desc = "[Cmp]Next" },
        { "<M-e>",   desc = "[Autopairs]Fast wrap" },
        { "<M-k>",   desc = "[LSP]Toggle signature" },
        { "<S-Tab>", desc = "[Cmp]Prev" },
        { "<Tab>",   desc = "[Cmp]Expand or next" },
        { "<Up>",    desc = "[Cmp]Prev" },
      },
      {
        mode = { "c" },
        { "<C-B>",   desc = "cursor to begin of command-line" },
        { "<C-D>",   desc = "list completions that match the pattern in front fo the cursor" },
        { "<C-E>",   desc = "[Cmp]Abort & cursor to end of command-line" },
        { "<C-J>",   desc = "same as <CR>" },
        { "<C-K>",   desc = "enter digraph" },
        { "<C-N>",   desc = "[Cmp]Next" },
        { "<C-P>",   desc = "[Cmp]Prev" },
        { "<C-U>",   desc = "delete all entered chars in the current command-line" },
        { "<C-W>",   desc = "delete word in front of the cursor" },
        { "<C-Y>",   desc = "[Cmp]Confirm" },
        { "<C-Z>",   desc = "[Cmp]Expand or next" },
        { "<S-Tab>", desc = "[Cmp]Prev" },
        { "<Tab>",   desc = "[Cmp]Expand or next" },
      },
      {
        { "<M-[>",     desc = "[TS]Function prev" },
        { "<M-]>",     desc = "[TS]Function next" },
        { "<M-h>",     desc = "[TS]Parameter swap prev" },
        { "<M-j>",     desc = "[TS]Definition navigation next" },
        { "<M-k>",     desc = "[TS]Definition navigation prev" },
        { "<M-l>",     desc = "[TS]Parameter swap next" },
        { "<M-m>",     desc = "[Terminal]Toggle" },
        { "<M-r>",     desc = "[TS]Rename" },
        { "ZQ",        desc = "Close window without writing" },
        { "ZZ",        desc = "Write if buffer changed and close window" },
        { "<leader>b", group = "buffer" },
        { "<leader>g", group = "gitsigns" },
        { "<leader>h", group = "help" },
        { "<leader>l", group = "lsp" },
        { "gr",        group = "lsp" }
      },
    })
  end,
  keys = {
    {
      "<C-/>",
      function()
        require("which-key").show({ global = false })
      end,
      mode = { "n", "i", "c", "v" },
      desc = "Buffer Local Keymaps(which-key)"
    }
  }
}
