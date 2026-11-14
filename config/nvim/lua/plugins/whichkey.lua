return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<C-/>",
      function() require("which-key").show({ global = true }) end,
      mode = { "n", "i", "v", "c" },
      desc = "Global Keymaps(which-key)"
    }
  },
  opts = {
    preset = "helix", -- "classic" | "modern" | "helix"
    triggers = {
      { "<auto>", mode = "nixsotc" },
    },
    defer = function(ctx)
      if vim.list_contains({ "d", "y" }, ctx.operator) then
        return true
      end
      return vim.list_contains({ "<C-V>", "V" }, ctx.mode)
    end,
    keys = {
      -- <c-d> => <c-d>zz, <c-u> => <c-u>zz,
      -- can not bind this two mapping to scrolling which-key
      scroll_down = "<M-d>",
      scroll_up = "<M-u>",
    },
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
