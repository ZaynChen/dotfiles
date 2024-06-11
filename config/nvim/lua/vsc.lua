local g = vim.g
local o = vim.o
local opt = vim.opt

g.mapleader = " "
o.whichwrap = o.whichwrap .. ",<,>,h,l"
opt.clipboard = { "unnamed", "unnamedplus" }
opt.backspace = { "indent", "eol", "start" }

local DEFAULT_OPTS = {
  mode = "n",
  buffer = nil,
  nowait = nil,
  silent = true,
  script = nil,
  expr = nil,
  unique = nil,
  remap = false,
  callback = nil,
}

function map(lhs, rhs, desc, opts)
  opts = vim.tbl_extend("force", DEFAULT_OPTS, opts or {})
  opts.desc = desc
  mode = opts.mode
  opts.mode = nil
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("0", "virtcol('.') == indent('.')+1 ? '0': '^'", "Start of line (smart)", { expr = true })

map("<leader>e", "<cmd>Edit<cr>", "Edit a file")
map("<leader>w", "<cmd>Write<cr>", "Write to a file")
map("<leader>q", "<cmd>Quit<cr>", "workbench.action.closeActiveEditor")

-- Tab
map("<leader>tc", "<cmd>Tabclose<cr>", "[Tab]Close")
map("<leader>te", "<cmd>Tabedit<cr>", "[Tap]Edit")
map("<leader>tj", "<cmd>Tabnext<cr>", "[Tap]Next")
map("<leader>tk", "<cmd>Tabprevious<cr>", "[Tap]Prev")
map("<leader>t1", "<cmd>Tabfirst<cr>", "[Tab]First")
-- map("<leader>t9", "<cmd>Tablast<cr>", "[Tab]Last") -- using <M-1>
-- map("<leader>tn", "<cmd>Tabnew<cr>", "[Tap]New") -- using <M-9>
map("<leader>to", "<cmd>Tabonly<cr>", "[Tap]Only")
-- map("<leader>tm", "<cmd>Tabmove<cr>", "[Tap]Move") -- Not supported yet

-- Comment
map("gc", "<Plug>VSCodeCommentary", { mode = { "n", "o", "x" } })
map("gcc", "<Plug>VSCodeCommentaryLine")
