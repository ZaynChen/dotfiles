local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  vim.api.nvim_err_writeln("Failed to load whichkey")
  return
end

require("which-key.plugins.spelling").actions = {
  { trigger = "z=", mode = "n" },
}

wk.setup {
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
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = {
    ["<leader>y"] = "Yank (copy) to system clipboard",
    -- gb = "Comment toggle blockwise",
    -- gc = "Comment toggle linewise",
  },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    ["<C-Up>"] = "<C-↑>",
    ["<C-Right>"] = "<C-→>",
    ["<C-Down>"] = "<C-↓>",
    ["<C-Left>"] = "<C-←>",
    ["<C-CR>"] = "<C-↵>",
    ["<M-Up>"] = "<M-↑>",
    ["<M-Right>"] = "<M-→>",
    ["<M-Down>"] = "<M-↓>",
    ["<M-Left>"] = "<M-←>",
    ["<M-CR>"] = "<M-↵>",
    ["<Up>"] = "↑",
    ["<Right>"] = "→",
    ["<Down>"] = "↓",
    ["<Left>"] = "←",
    ["<CR>"] = "↵",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>',   -- binding to scroll up inside the popup
  },
  window = {
    border = "none",          -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 3,                                                                -- spacing between columns
    align = "left",                                                             -- align columns left, center or right
  },
  ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  triggers = "auto",                                                            -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

for _, mode in ipairs { "n", "i", "c", "v" } do
  vim.keymap.set(mode, "<C-/>", "<cmd>WhichKey '' " .. mode .. "<cr>", { silent = true })
end

--[[
wk.register(mappings, opts)
{
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
} ]]
wk.register({
  ["<C-D>"] = "delete one shiftwidth of indent in the current line",
  ["<C-E>"] = "[Cmp]Abort",
  ["<C-F>"] = "not used",
  ["<C-H>"] = "same as <BS>",
  ["<C-J>"] = "same as <CR>",
  ["<C-K>"] = "enter digraph",
  ["<C-N>"] = "[Cmp]Next",
  ["<C-O>"] = "execute a single command and return to insert mode",
  ["<C-P>"] = "[Cmp]Prev",
  ["<C-Q>"] = "same as <C-V>, unless used for terminal control flow",
  ["<C-S>"] = "not used or used for terminal control flow",
  ["<C-T>"] = "insert one shiftwidth of indent in the current line",
  ["<C-U>"] = "delete all entered chars in the current line",
  ["<C-W>"] = "delete word before the cursor",
  ["<C-Y>"] = "[Cmp]Comfirm",
  ["<Down>"] = "[Cmp]Next",
  ["<Up>"] = "[Cmp]Prev",
  ["<Tab>"] = "[Cmp]Expand or next",
  ["<S-Tab>"] = "[Cmp]Prev",
  ["<M-e>"] = "[Autopairs]Fast wrap",
  ["<M-k>"] = "[LSP]Toggle signature",
}, { mode = "i" })

wk.register({
  ["<C-B>"] = "cursor to begin of command-line",
  ["<C-D>"] = "list completions that match the pattern in front fo the cursor",
  ["<C-E>"] = "[Cmp]Abort & cursor to end of command-line",
  ["<C-J>"] = "same as <CR>",
  ["<C-K>"] = "enter digraph",
  ["<C-N>"] = "[Cmp]Next",
  ["<C-P>"] = "[Cmp]Prev",
  ["<C-U>"] = "delete all entered chars in the current command-line",
  ["<C-W>"] = "delete word in front of the cursor",
  ["<C-Y>"] = "[Cmp]Confirm",
  ["<C-Z>"] = "[Cmp]Expand or next",
  ["<Tab>"] = "[Cmp]Expand or next",
  ["<S-Tab>"] = "[Cmp]Prev",
}, { mode = "c" })

wk.register {
  -- Treesitter
  ["<M-]>"] = "[TS]Function next",
  ["<M-[>"] = "[TS]Function prev",
  ["<M-l>"] = "[TS]Parameter swap next",
  ["<M-h>"] = "[TS]Parameter swap prev",
  ["<M-j>"] = "[TS]Definition navigation next",
  ["<M-k>"] = "[TS]Definition navigation prev",
  ["<M-r>"] = "[TS]Rename",
  ["<M-m>"] = "[Terminal]Toggle",
  Z = {
    Z = "Write if buffer changed and close window",
    Q = "Close window without writing",
  },
}

wk.register({
  b = { name = "buffer" },
  g = {
    name = "gitsigns",
    t = "toggle",
  },
  h = { name = "help" },
  l = { name = "lsp" },
  y = { name = "Yank (copy) to system clipboard" }
  -- t = { name = "tab" },
}, { prefix = "<leader>" })
