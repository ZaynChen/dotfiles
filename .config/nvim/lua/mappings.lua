local keymap = require("utils.keymap")
local nmap = keymap.nmap
local imap = keymap.imap
local cmap = keymap.cmap

nmap("<leader>w", "<cmd>w<cr>")

nmap("<leader>e", ':e <C-R>=expand("%:p:h")."/"<cr>')
-- nmap("<leader>cd", ':cd <C-R>=expand("%:p:h")<cr>:pwd<cr>')

nmap("<leader>q", "<cmd>q<cr>")
nmap("ZZ", function() vim.api.nvim_command("wa"); vim.api.nvim_command(":q") end)
-- ZQ -> :q!

nmap("0", "virtcol('.') == indent('.')+1 ? '0': '^'", { expr = true })

nmap("<leader><cr>", "<cmd>noh<cr>")

-- Buffer
nmap("<leader>l", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
nmap("<leader>h", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
nmap("<leader>d", "<cmd>bdelete<cr>", { desc = "Delete current buffer from buffer list" })

-- Tab
-- nmap("<leader>tc", "<cmd>tabclose<cr>")
-- nmap("<leader>te", ':tabedit <C-R>=expand("%:p:h")."/"<cr>', { silent = false })
-- nmap("<leader>th", "<cmd>tabprevious<cr>")
-- nmap("<leader>tl", "<cmd>tabnext<cr>")
-- nmap("<leader>tm", "<cmd>tabmove<cr>")
-- nmap("<leader>tn", "<cmd>tabnew<cr>")
-- nmap("<leader>to", "<cmd>tabonly<cr>")

-- Spell Check
-- nmap("<leader>ss", "<cmd>setlocal spell!<cr>")

-- nmap("<leader>sn", "]s")
-- nmap("<leader>sp", "[s")
-- nmap("<leader>sa", "zg")
-- nmap("<leader>s?", "z=")

-- Paste Mode
-- nmap("<leader>pp", "<cmd>setlocal paste!<cr>")

-- resize window
nmap("<M-Up>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
nmap("<M-Down>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
nmap("<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
nmap("<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

nmap("<C-h>", "<C-w>h", { desc = "Go to the left window" })
nmap("<C-j>", "<C-w>j", { desc = "Go to the down window" })
nmap("<C-k>", "<C-w>k", { desc = "Go to the up window" })
nmap("<C-l>", "<C-w>l", { desc = "Go to the right window" })

-- tmux doesn't support <C-h> <BS> distinguish yet.
-- alacritty: using https://github.com/alexherbo2/alacritty-extended-keys
imap("<C-h>", "<Left>")
imap("<C-l>", "<Right>")
imap("<M-h>", "<S-Left>")
imap("<M-l>", "<S-Right>")

cmap("<C-a>", "<Home>")
-- cmap("<C-e>", "<End>")
cmap("<C-h>", "<Left>")
cmap("<C-l>", "<Right>")
cmap("<M-h>", "<S-Left>")
cmap("<M-l>", "<S-Right>")

-- tmap("<C-s>", "<C-\\><C-n>")
-- tmap("<Esc><Esc>", "<C-\\><C-n>")

-- nmap("vv", "<C-w>v")
-- nmap("ss", "<C-w>s")
