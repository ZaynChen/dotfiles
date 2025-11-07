local map = require("util").map

map("0", [[virtcol(".") == indent(".")+1 ? "0": "_"]], "Start of line(smart)", { expr = true })
map("J", "mzJ`z", "Join lines")
map("n", "nzzzv", "Search next")
map("N", "Nzzzv", "Search previous")

-- Move Lines
map("<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", "Move Down")
map("<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "Move Up")
map("<A-j>", "<esc><cmd>m .+1<cr>==gi", "Move Down", { mode = "i" })
map("<A-k>", "<esc><cmd>m .-2<cr>==gi", "Move Up", { mode = "i" })
map("<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "Move Down", { mode = "v" })
map("<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move Up", { mode = "v" })

map("<leader><cr>", "<cmd>noh<cr>", "Clear highlight")
map("<ESC>", "<cmd>noh<cr><ESC>", "Escape and clear highlight")

map("<leader>w", "<cmd>update<cr>", "Write when the buffer has been modified")
map("<leader>q", "<cmd>q<cr>", "Quit current window (when one window quit Vim)")
map("<leader>e", [[:e <C-R>=expand("%:p:h")."/"<cr>]], "Edit a file", { silent = false })
map("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Subtitude", { silent = false })

-- Add undo break-points
map(",", ",<c-g>u", nil, { mode = "i" })
map(".", ".<c-g>u", nil, { mode = "i" })
map(";", ";<c-g>u", nil, { mode = "i" })

map("<leader>cd", ':cd <C-R>=expand("%:p:h")<cr>', "Change directory",
  { silent = false })
map("<leader>x", "<cmd>!chmod +x %<CR>", "Add ex permission to current file")
--
map("<C-H>", "<cmd>bprevious<cr>", "[Buffer]Prev")
map("<C-L>", "<cmd>bnext<cr>", "[Buffer]Next")
map("<leader>bd", "<cmd>bdelete<cr>", "[Buffer]Delete from list")

map("z<CR>", "<cmd>setlocal spell!<cr>", "Toggle spell check")

map("<C-D>", "<C-D>zz", "Scroll lines down with cursor centered")
map("<C-U>", "<C-U>zz", "Scroll lines up with cursor centered")
map("<C-I>", "<C-I>zz", "Go to N newer entry in jump list with cursor centered")
map("<C-O>", "<C-O>zz", "Go to N older entry in jump list with cursor centered")

-- map("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

-- map("[q", "<cmd>lprev<cr>zz", "[Quickfix]Previous")
-- map("]q", "<cmd>lnext<cr>zz", "[Quickfix]Next")
--
-- map("<leader>tc", "<cmd>tabclose<cr>", "[Tab]Close")
-- map("<leader>te", ':tabedit <C-R>=expand("%:p:h")."/"<cr>', "[Tap]Edit", { silent = false })
-- map("<leader>tj", "<cmd>tabnext<cr>", "[Tap]Next")
-- map("<leader>tk", "<cmd>tabprevious<cr>", "[Tap]Prev")
-- map("<leader>tm", "<cmd>tabmove<cr>", "[Tap]Move")
-- map("<leader>tn", "<cmd>tabnew<cr>", "[Tap]New")
-- map("<leader>to", "<cmd>tabonly<cr>", "[Tap]Only")

-- map("<C-Up>", "<cmd>resize -2<cr>", "[Window]Height Descrease")
-- map("<C-Down>", "<cmd>resize +2<cr>", "[Window]Height Increase")
-- map("<C-Left>", "<cmd>vertical resize -2<cr>", "[Window]Width decrease")
-- map("<C-Right>", "<cmd>vertical resize +2<cr>", "[Window]Width Increase")
