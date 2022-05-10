local wk = require("which-key")

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments", ["<leader>e"] = "Run" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    ["<M-Up>"] = "<M-↑>",
    ["<M-Right>"] = "<M-→>",
    ["<M-Down>"] = "<M-↓>",
    ["<M-Left>"] = "<M-←>",
    ["<M-CR>"] = "<M-↵>",
    ["<Up>"] = "<↑>",
    ["<Right>"] = "→",
    ["<Down>"] = "↓",
    ["<Left>"] = "←",
    ["<CR>"] = "↵",
    ["<NL>"] = "<C-J>",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
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
  vim.keymap.set(mode, "<C-_>", "<cmd>WhichKey '' " .. mode .. "<cr>", { silent = true })
end


local trouble = require("trouble")
local diagnostic = vim.diagnostic
local telescope = require("telescope.builtin")

-- group
wk.register {
  ["gc"] = { name = "commentary" },
  ["]"] = { name = "next" },
  ["["] = { name = "prev" },
  ["\\"] = { name = "toggle" }
}

wk.register {
  ["<M-]>"] = "[TS]Function next",
  ["<M-[>"] = "[TS]Function prev",
  ["<M-l>"] = "[TS]Parameter swap next",
  ["<M-h>"] = "[TS]Parameter swap prev",
  ["<M-j>"] = "[TS]Definition navigation next",
  ["<M-k>"] = "[TS]Definition navigation prev",
  ["<M-t>"] = "[Terminal]Toggle",
}

wk.register({
  b = { name = "buffer" },
  d = {
    name = "diagnostic",
    ["]"] = { function() diagnostic.goto_next() end, "[Diagnostic]Next" },
    ["["] = { function() diagnostic.goto_prev() end, "[Diagnostic]Prev" },
    d = { function() trouble.open("document_diagnostics") end, "[Diagnostics]Document(Trouble)" },
    w = { function() trouble.open("workspace_diagnostics") end, "[Diagnostics]Workspace(Trouble)" },
    q = { function() trouble.open("quickfix") end, "[Diagnostic]Quick Fix(Trouble)" },
  },
  g = {
    name = "gitsigns",
    t = "toggle"
  },
  h = {
    name = 'help',
    c = { function() telescope.colorscheme() end, "[Telescope]Colorscheme" },
    C = { function() telescope.commands() end, "[Telescope]Commands" },
    h = { function() telescope.help_tags() end, "[Telescope]Help" },
    k = { function() telescope.keymaps() end, "[Telescope]Keymaps" },
    m = { function() telescope.man_pages() end, "[Telescope]Man Pages" },
    r = { function() telescope.registers() end, "[Telescope]Registers" },
  },
  l = {
    name = "LSP",
    i = { function() telescope.lsp_implementations() end, "[LSP]Implementations(Telescope)" },
    s = { function() telescope.lsp_dynamic_workspace_symbols() end, "[LSP]Symbols Document(Telescope)" },
    S = { function() telescope.lsp_document_symbols() end, "[LSP]Symbols Workspace(Telescope)" },
    u = { function() trouble.open("lsp_references") end, "[LSP]References(Trouble)" },
  },
  r = "[TS]Rename(smart)",
  t = { name = "tab" },
  x = { function() trouble.open() end, "[Trouble]Toggle" },
}, { prefix = "<leader>" })

wk.register({
  ["<M-k>"] = "[LSP]Signature toggle"
}, { mode = "i" })

wk.register({
  [","] = "[TS]Selection prev",
  ["."] = "[TS]Selection smart",
  [";"] = "[TS]Selection container outer",
  ["i;"] = "[TS]Selection container inner",
}, { mode = "v" })
