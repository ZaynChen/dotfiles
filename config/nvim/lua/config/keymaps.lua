local map = require("util").map

map("0", "virtcol('.') == indent('.')+1 ? '0': '_'", "Start of line (smart)", { expr = true })
map("J", "mzJ`z", "Join lines")
map("n", "nzzzv", "Search next")
map("N", "Nzzzv", "Search previous")
map("J", ":m '>+1<CR>gv=gv", "Move lines down", { mode = "x" })
map("K", ":m '<-2<CR>gv=gv", "Move lines up", { mode = "x" })

map("<leader><cr>", "<cmd>noh<cr>", "Clear highlight")
map("<ESC>", "<cmd>noh<cr><ESC>", "Escape and clear hlsearch")

map("<leader>w", "<cmd>w<cr>", "Write to a file")
map("<leader>q", "<cmd>q<cr>", "Quit current window (when one window quit Vim)")
map("<leader>e", ':e <C-R>=expand("%:p:h")."/"<cr>', "Edit a file", { silent = false })
map("<leader>d", '"_d', "Delete avoid register", { mode = { "n", "x" } })
map("<leader>y", '"+y', "Yank (copy) to system clipboard", { mode = { "n", "x" } })
map("<leader>Y", '"+Y', "Yank (copy) line to system clipboard")
map("<leader>p", '"_dP', "Paste & avoid register", { mode = "x" })
map("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Subtitude", { silent = false })

map("<leader>clo", "<cmd>close<cr>", "Close current window")
map("<leader>cd", ':cd <C-R>=expand("%:p:h")<cr>', "Change directory",
  { silent = false })
map("<leader>x", "<cmd>!chmod +x %<CR>", "Add ex permission to current file")
--
map("<C-H>", "<cmd>bprevious<cr>", "[Buffer]Prev")
map("<C-L>", "<cmd>bnext<cr>", "[Buffer]Next")
map("[b", "<cmd>bprevious<cr>", "[Buffer]Prev")
map("]b", "<cmd>bnext<cr>", "[Buffer]Next")
map("<leader>bd", "<cmd>bdelete<cr>", "[Buffer]Delete from list")

-- map("<leader>tc", "<cmd>tabclose<cr>", "[Tab]Close")
-- map("<leader>te", ':tabedit <C-R>=expand("%:p:h")."/"<cr>', "[Tap]Edit", { silent = false })
-- map("<leader>tj", "<cmd>tabnext<cr>", "[Tap]Next")
-- map("<leader>tk", "<cmd>tabprevious<cr>", "[Tap]Prev")
-- map("<leader>tm", "<cmd>tabmove<cr>", "[Tap]Move")
-- map("<leader>tn", "<cmd>tabnew<cr>", "[Tap]New")
-- map("<leader>to", "<cmd>tabonly<cr>", "[Tap]Only")

map("z<CR>", "<cmd>setlocal spell!<cr>", "Toggle spell check")

-- map("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
-- "]d" and "[d" in Normal mode map to vim.diagnostic.goto_next()
-- and vim.diagnostic.goto_prev(), respectively. ]d-default [d-default
-- neovim-0.10
-- map("[d", diagnostic_goto(false), "[Diagnostic]Prev")
-- map("]d", diagnostic_goto(true), "[Diagnostic]Next")
map("[e", diagnostic_goto(false, "ERROR"), "[Error]Prev")
map("]e", diagnostic_goto(true, "ERROR"), "[Error]Next")
map("[w", diagnostic_goto(false, "WARN"), "[WARN]Prev")
map("]w", diagnostic_goto(true, "WARN"), "[WARN]Next")

map("[q", "<cmd>lprev<cr>zz", "[Quickfix]Previous")
map("]q", "<cmd>lnext<cr>zz", "[Quickfix]Next")

map("<C-D>", "<C-D>zz", "Scroll lines down")
map("<C-U>", "<C-U>zz", "Scroll lines up")

map("<C-Up>", "<cmd>resize -2<cr>", "[Window]Height Descrease")
map("<C-Down>", "<cmd>resize +2<cr>", "[Window]Height Increase")
map("<C-Left>", "<cmd>vertical resize -2<cr>", "[Window]Width decrease")
map("<C-Right>", "<cmd>vertical resize +2<cr>", "[Window]Width Increase")
