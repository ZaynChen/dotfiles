local map = require("keymap.util").map

map("0", "virtcol('.') == indent('.')+1 ? '0': '_'", "Start of line (smart)", { expr = true })
map("J", "mzJ`z", "Join lines")
map("n", "nzzzv", "Search next")
map("N", "Nzzzv", "Search previous")
map("J", ":m '>+1<CR>gv=gv", "Move lines down", { mode = "v" })
map("K", ":m '<-2<CR>gv=gv", "Move lines up", { mode = "v" })

map("<leader><cr>", "<cmd>noh<cr>", "No highlight")
map("<leader>w", "<cmd>w<cr>", "Write to a file")
map("<leader>q", "<cmd>q<cr>", "Quit current window (when one window quit Vim)")
map("<leader>e", ':e <C-R>=expand("%:p:h")."/"<cr>', "Edit a file", { silent = false })
map("<leader>d", "\"_d", "Delete avoid register")
map("<leader>d", "\"_d", "Delete avoid register", { mode = "v" })
map("<leader>y", "\"+y", "Yank (copy) to system clipboard")
map("<leader>y", "\"+y", "Yank (copy) to system clipboard", { mode = "v" })
map("<leader>Y", "\"+Y", "Yank (copy) line to system clipboard")
map("<leader>p", "\"_dP", "Paste & avoid register", { mode = "x" })
map("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Subtitude", { silent = false })

map("<leader>clo", "<cmd>close<cr>", "Close current window")
map("<leader>cd", ':cd <C-R>=expand("%:p:h")<cr>', "Change directory",
  { silent = false })
map("<leader>x", "<cmd>!chmod +x %<CR>", "Add ex permission to current file")
--
map("<leader>bj", "<cmd>bnext<cr>", "[Buffer]Next")
map("<leader>bk", "<cmd>bprevious<cr>", "[Buffer]Prev")
map("<leader>bd", "<cmd>bdelete<cr>", "[Buffer]Delete from list")

-- map("<leader>tc", "<cmd>tabclose<cr>", "[Tab]Close")
-- map("<leader>te", ':tabedit <C-R>=expand("%:p:h")."/"<cr>', "[Tap]Edit", { silent = false })
-- map("<leader>tj", "<cmd>tabnext<cr>", "[Tap]Next")
-- map("<leader>tk", "<cmd>tabprevious<cr>", "[Tap]Prev")
-- map("<leader>tm", "<cmd>tabmove<cr>", "[Tap]Move")
-- map("<leader>tn", "<cmd>tabnew<cr>", "[Tap]New")
-- map("<leader>to", "<cmd>tabonly<cr>", "[Tap]Only")

map("z.", "<cmd>setlocal spell!<cr>", "Toggle spell check")
map("zj", "]s", "Next misspelled word")
map("zk", "[s", "Prevous misspelled word")

-- map("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

local diagnostic = vim.diagnostic
map("<C-j>", diagnostic.goto_next, "[Diagnostic]Next")
map("<C-k>", diagnostic.goto_prev, "[Diagnostic]Prev")
-- map("<leader>j", "<cmd>lnext<CR>zz", "[Quickfix]go to next location")
-- map("<leader>k", "<cmd>lprev<CR>zz", "[Quickfix]go to previous location")
-- map("<C-j>", "<cmd>cnext<CR>zz", "[Quickfix]go to next error")
-- map("<C-k>", "<cmd>cprev<CR>zz", "[Quickfix]go to prevous error")

map("<C-d>", "<C-d>zz", "Scroll lines down")
map("<C-u>", "<C-u>zz", "Scroll lines up")

map("<M-Up>", "<cmd>resize -2<cr>", "[Window]Height Descrease")
map("<M-Down>", "<cmd>resize +2<cr>", "[Window]Height Increase")
map("<M-Left>", "<cmd>vertical resize -2<cr>", "[Window]Width decrease")
map("<M-Right>", "<cmd>vertical resize +2<cr>", "[Window]Width Increase")

-- tmux doesn't support <C-h> <BS> distinguish yet.
-- alacritty: using https://github.com/alexherbo2/alacritty-extended-keys
-- map("<C-h>", "<Left>", "Cursor one character left", { mode = "i" })
-- map("<C-l>", "<Right>", "Cursor one character right", { mode = "i" })
-- map("<M-h>", "<S-Left>", "Cursor one word left", { mode = "i" })
-- map("<M-l>", "<S-Right>", "Cursor one word ricght", { mode = "i" })

-- map("<C-a>", "<Home>", "Cursor to start of line", { mode = "c" })
-- map("<C-e>", "<End>", {mode = "c"})
-- map("<C-h>", "<Left>", "Cursor one character left", { mode = "c" })
-- map("<C-l>", "<Right>", "Cursor one character right", { mode = "c" })
-- map("<M-h>", "<S-Left>", "Cursor one word left", { mode = "c" })
-- map("<M-l>", "<S-Right>", "Cursor one word right", { mode = "c" })

-- tmap("<C-s>", "<C-\\><C-n>")
-- tmap("<Esc><Esc>", "<C-\\><C-n>")

local telescope_ok, telescope = pcall(require, "telescope.builtin")
if telescope_ok then
  map("<leader>/", telescope.live_grep, "[Telescope]live_grep")
  map("<leader>bb", telescope.buffers, "[Buffer]List")
  map("<leader>f", telescope.find_files, "[Telescope]find_files")
  map("<leader>hC", telescope.colorscheme, "[Telescope]Colorscheme")
  map("<leader>hc", telescope.commands, "[Telescope]Commands")
  map("<leader>hh", telescope.help_tags, "[Telescope]Help")
  map("<leader>hk", telescope.keymaps, "[Telescope]Keymaps")
  map("<leader>hm", telescope.man_pages, "[Telescope]Man pages")
  map("<leader>hr", telescope.registers, "[Telescope]Registers")
end

local trouble_ok, trouble = pcall(require, "trouble")
if trouble_ok then
  map("<leader>lr", function() trouble.open("lsp_references") end, "[LSP]References(Trouble)")
  map("<leader>li", function() trouble.open("lsp_implementations") end, "[LSP]Implementations(Trouble)")
  map("<leader>ld", function() trouble.open("document_diagnostics") end, "[LSP]Document diagnostics(Trouble)")
  map("<leader>lw", function() trouble.open("workspace_diagnostics") end, "[LSP]Workspace diagnostics(Trouble)")
  map("<leader>lq", function() trouble.open("quickfix") end, "[Trouble]Quickfix")
  map("<leader>ll", function() trouble.open("loclist") end, "[Trouble]Location list")
  map("<leader>o", function() trouble.open("todo") end, "[Trouble]TODO list")
  -- map("<leader>x", function() trouble.open() end, "[Trouble]Toggle previous")
end

local nvimtree_ok, _ = pcall(require, "nvim-tree")
if nvimtree_ok then
  map("<leader>n", "<cmd>NvimTreeToggle<cr>", "[NvimTree]Toggle")
end
