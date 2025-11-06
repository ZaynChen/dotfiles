return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<C-/>",
      function()
        require("which-key").show({ global = true })
      end,
      mode = { "n", "i", "v", "c" },
      desc = "Global Keymaps(which-key)"
    }
  },
  opts = {
    preset = "helix", -- "classic" | "modern" | "helix"
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    filter = function(_)
      -- return mapping.desc and mapping.desc ~= ""
      return true
    end,
    notify = true,
    triggers = {
      { "<auto>", mode = "nixsotc" },
    },
    defer = function(ctx)
      -- list_contains doesn't exist in neovim < v0.10
      if vim.list_contains({ "d", "y" }, ctx.operator) then
        return true
      end
      return vim.list_contains({ "<C-V>", "V" }, ctx.mode)
    end,
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
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
      -- <c-d> => <c-d>zz, <c-u> => <c-u>zz,
      -- can not bind this two mapping to scrolling which-key
      scroll_down = "<c-n>",
      scroll_up = "<c-p>",
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
    show_help = true,
    show_keys = true,
    disable = {
      ft = {},
      bt = {},
    },
    debug = false,
    spec = {
      {
        mode = { "i" },
        { "<C-D>",   desc = "delete one shiftwidth of indent in the current line" },
        { "<C-E>",   desc = "[Cmp]Abort" },
        { "<C-F>",   desc = "not used" },
        { "<C-H>",   desc = "same as <BS>" },
        { "<C-J>",   desc = "[Cmp]Next" },
        { "<C-K>",   desc = "[Cmp]Prev" },
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
        { "<M-m>",   desc = "[LSP]Toggle signature" },
        { "<S-Tab>", desc = "[Cmp]Prev" },
        { "<Tab>",   desc = "[Cmp]Expand or next" },
        { "<Up>",    desc = "[Cmp]Prev" },
      },
      {
        mode = { "c" },
        { "<C-B>",   desc = "cursor to begin of command-line" },
        { "<C-D>",   desc = "list completions that match the pattern in front fo the cursor" },
        { "<C-E>",   desc = "[Cmp]Abort & cursor to end of command-line" },
        { "<C-J>",   desc = "[Cmp]Next" },
        { "<C-K>",   desc = "[Cmp]Prev" },
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
        -- { "<M-m>",     desc = "[Terminal]Toggle" },
        { "r<CR>",     desc = "Split lines" },
        { "ZQ",        desc = "Close window without writing" },
        { "ZZ",        desc = "Write if buffer changed and close window" },
        { "<leader>b", group = "buffer" },
        { "<leader>g", group = "gitsigns" },
        { "<leader>h", group = "help" },
        { "<leader>l", group = "trouble" },
        { "gr",        group = "lsp" }
      },
    },
  },
}
