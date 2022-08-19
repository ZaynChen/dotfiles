local wk = require("which-key")

-- tmux doesn't support <C-h> <BS> distinguish yet.
-- alacritty: using https://github.com/alexherbo2/alacritty-extended-keys
wk.register({
  ["<C-h>"] = { "<Left>", "Cursor one character left" },
  ["<C-l>"] = { "<Right>", "Cursor one character right" },
  ["<M-h>"] = { "<S-Left>", "Cursor one word left" },
  ["<M-l>"] = { "<S-Right>", "Cursor one word right" },
  ["<M-k>"] = "[LSP]Signature toggle"
}, { mode = "i" })

wk.register({
  ["<C-a>"] = { "<Home>", "Cursor to start of line" },
  -- cmap("<C-e>", "<End>")
  ["<C-h>"] = { "<Left>", "Cursor one character left" },
  ["<C-l>"] = { "<Right>", "Cursor one character right" },
  ["<M-h>"] = { "<S-Left>", "Cursor one word left" },
  ["<M-l>"] = { "<S-Right>", "Cursor one word right" },
}, { mode = "c" })

wk.register({
  [","] = "[TS]Selection prev",
  ["."] = "[TS]Selection smart",
  [";"] = "[TS]Selection container outer",
  ["i;"] = "[TS]Selection container inner",
}, { mode = 'v' })


wk.register {
  ["0"] = { "virtcol('.') == indent('.')+1 ? '0': '^'", "Start of line (smart)", expr = true },
  g = {
    n = {
      d = "[TS]Go to definition",
      D = "[TS]List definitions",
    },
    O = "[TS]List definitions toc",
  },
  Z = {
    Z = "Write if buffer changed and close window",
    Q = "Close window without writing",
  },

  -- ["\\"] = { name = "toggle" },
  -- Treesitter
  ["<M-]>"] = "[TS]Function next",
  ["<M-[>"] = "[TS]Function prev",
  ["<M-l>"] = "[TS]Parameter swap next",
  ["<M-h>"] = "[TS]Parameter swap prev",
  ["<M-j>"] = "[TS]Definition navigation next",
  ["<M-k>"] = "[TS]Definition navigation prev",
  ["<M-t>"] = "[Terminal]Toggle",

  -- Window
  ["<C-h>"] = { "<C-w>h", "[Window]Left" },
  ["<C-j>"] = { "<C-w>j", "[Window]Down" },
  ["<C-k>"] = { "<C-w>k", "[Window]Up" },
  ["<C-l>"] = { "<C-w>l", "[Window]Right" },
  ["<M-Up>"] = { "<cmd>resize -2<cr>", "[Window]Height Decrease" },
  ["<M-Down>"] = { "<cmd>resize +2<cr>", "[Window]Height Increase" },
  ["<M-Left>"] = { "<cmd>vertical resize -2<cr>", "[Window]Width Decrease" },
  ["<M-Right>"] = { "<cmd>vertical resize +2<cr>", "[Window]Width Increase" },
}

wk.register({
  b = {
    name = "buffer",
    d = { "<cmd>bdelete<cr>", "[Buffer]Delete from list" },
    n = { "<cmd>bnext<cr>", "[Buffer]Next" },
    p = { "<cmd>bprevious<cr>", "[Buffer]Prev" }
  },
  -- c = { w = { "<cmd>cwindow<cr>", "Open or close quickfix window" } },
  ["clo"] = { "<cmd>close<cr>", "Close current window" },
  e = { ':e <C-R>=expand("%:p:h")."/"<cr>', "Edit a file", silent = false },
  ["cd"] = { ':cd <C-R>=expand("%:p:h")<cr>', "Change directory", silent = false },
  g = {
    name = "gitsigns",
    t = "toggle"
  },
  -- p = { p = { "<cmd>setlocal paste!<cr>", "" } },
  q = { "<cmd>q<cr>", "Quite current window (when one window quit Vim)" },
  r = "[TS]Rename(smart)",
  s = {
    n = { "]s", "Next misspelled word" },
    p = { "[s", "Previous misspelled word" },
    a = { "zg", "Add word to spell list" },
    s = { "<cmd>setlocal spell!<cr>", "spelling" },
    -- ["="] = { "z=", "Spelling suggestions" }
  },
  t = {
    name = "tab",
    c = { "<cmd>tabclose<cr>", "[Tab]Close" },
    e = { ':tabedit <C-R>=expand("%:p:h")."/"<cr>', "[Tab]Edit" },
    j = { "<cmd>tabnext<cr>", "[Tab]Next" },
    k = { "<cmd>tabprevious<cr>", "[Tab]Prev" },
    m = { "<cmd>tabmove<cr>", "[Tab]Move" },
    n = { "<cmd>tabnew<cr>", "[Tab]New" },
    o = { "<cmd>tabonly<cr>", "[Tab]Only" },
  },
  w = { "<cmd>w<cr>", "Write to a file" },
  ["<cr>"] = { "<cmd>noh<cr>", "noh" },
}, { prefix = "<leader>" })
