local api = vim.api

local keymap = require("utils.keymap")
local nmap = keymap.nmap
local imap = keymap.imap
local cmap = keymap.cmap

nmap("<leader>w", "<cmd>w<cr>")

nmap("<leader>e", ':e <C-R>=expand("%:p:h")."/"<cr>', { silent = false, desc = "Edit a file" })
nmap("<leader>c", "<cmd>close<cr>", { desc = "Close current window" })
-- nmap("<leader>cd", ':cd <C-R>=expand("%:p:h")<cr>:pwd<cr>')

nmap("<leader>q", "<cmd>q<cr>")
nmap("ZZ", function() api.nvim_command("wa"); api.nvim_command(":q") end, { desc = "Save all buffers & quit" })
-- ZQ -> :q!

nmap("0", "virtcol('.') == indent('.')+1 ? '0': '^'", { expr = true, desc = "Start of line (smart)" })

nmap("<leader><cr>", "<cmd>noh<cr>")

-- Buffer
nmap("<leader>bl", "<cmd>bnext<cr>", { desc = "[Buffer]Next" })
nmap("<leader>bh", "<cmd>bprevious<cr>", { desc = "[Buffer]Prev" })
nmap("<leader>bd", "<cmd>bdelete<cr>", { desc = "[Buffer]Delete from list" })

-- Tab
nmap("<leader>tc", "<cmd>tabclose<cr>", { desc = "[Tab]Close" })
nmap("<leader>te", ':tabedit <C-R>=expand("%:p:h")."/"<cr>', { silent = false, desc = "[Tap]Edit" })
nmap("<leader>th", "<cmd>tabprevious<cr>", { desc = "[Tap]Prev" })
nmap("<leader>tl", "<cmd>tabnext<cr>", { desc = "[Tap]Next" })
nmap("<leader>tm", "<cmd>tabmove<cr>", { desc = "[Tap]Move" })
nmap("<leader>tn", "<cmd>tabnew<cr>", { desc = "[Tap]New" })
nmap("<leader>to", "<cmd>tabonly<cr>", { desc = "[Tap]Only" })

-- Spell Check
nmap("<leader>ss", "<cmd>setlocal spell!<cr>")

-- nmap("<leader>sn", "]s")
-- nmap("<leader>sp", "[s")
-- nmap("<leader>sa", "zg")
-- nmap("<leader>s?", "z=")

-- Paste Mode
-- nmap("<leader>pp", "<cmd>setlocal paste!<cr>")

-- resize window
nmap("<M-Up>", "<cmd>resize -2<cr>", { desc = "[Window]Height Descrease" })
nmap("<M-Down>", "<cmd>resize +2<cr>", { desc = "[Window]Height Increase" })
nmap("<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "[Window]Width decrease" })
nmap("<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "[Window]Width Increase" })

nmap("<C-h>", "<C-w>h", { desc = "[Window]Left" })
nmap("<C-j>", "<C-w>j", { desc = "[Window]Down" })
nmap("<C-k>", "<C-w>k", { desc = "[Window]Up" })
nmap("<C-l>", "<C-w>l", { desc = "[Window]Right" })

-- tmux doesn't support <C-h> <BS> distinguish yet.
-- alacritty: using https://github.com/alexherbo2/alacritty-extended-keys
imap("<C-h>", "<Left>", { desc = "Cursor one character left" })
imap("<C-l>", "<Right>", { desc = "Cursor one character right" })
imap("<M-h>", "<S-Left>", { desc = "Cursor one word left" })
imap("<M-l>", "<S-Right>", { desc = "Cursor one word right" })

cmap("<C-a>", "<Home>", { desc = "Cursor to start of line" })
-- cmap("<C-e>", "<End>")
cmap("<C-h>", "<Left>", { desc = "Cursor one character left" })
cmap("<C-l>", "<Right>", { desc = "Cursor one character right" })
cmap("<M-h>", "<S-Left>", { desc = "Cursor one word left" })
cmap("<M-l>", "<S-Right>", { desc = "Cursor one word right" })

-- tmap("<C-s>", "<C-\\><C-n>")
-- tmap("<Esc><Esc>", "<C-\\><C-n>")

-- nmap("vv", "<C-w>v")
-- nmap("ss", "<C-w>s")
