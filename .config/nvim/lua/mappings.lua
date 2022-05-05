local map = function(mode, lhs, rhs, opts)
  -- vim.keymap.set sets noremap by default
  opts = vim.tbl_extend("keep", opts or {}, { silent = true })
  vim.keymap.set(mode, lhs, rhs, opts)
end


local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

local imap = function(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

local vmap = function(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

local cmap = function(lhs, rhs, opts)
  map('c', lhs, rhs, opts)
end

local tmap = function(lhs, rhs, opts)
  map('t', lhs, rhs, opts)
end


nmap("<leader>w", "<cmd>w<cr>")

-- nmap("<leader>e", ':e <C-R>=expand("%:p:h")."/"<cr>')

nmap("<leader>q", "<cmd>q<cr>")
nmap("<leader>Q", "<cmd>q!<cr>")
nmap("<leader>wq", "<cmd>wq<cr>")

nmap("<leader><cr>", "<cmd>noh<cr>")

-- Buffer
nmap("<leader>l", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
nmap("<leader>h", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
nmap("<leader>bd", "<cmd>bdelete<cr>", { desc = "Unload current buffer" })

-- Tab
-- nmap("<leader>tc", "<cmd>tabclose<cr>")
-- nmap("<leader>te", ':tabedit <C-R>=expand("%:p:h")."/"<cr>', { silent = false })
-- nmap("<leader>th", "<cmd>tabprevious<cr>")
-- nmap("<leader>tl", "<cmd>tabnext<cr>")
-- nmap("<leader>tm", "<cmd>tabmove<cr>")
-- nmap("<leader>tn", "<cmd>tabnew<cr>")
-- nmap("<leader>to", "<cmd>tabonly<cr>")

-- Spell Check
nmap("<leader>ss", "<cmd>setlocal spell!<cr>")

-- nmap("<leader>sn", "]s")
-- nmap("<leader>sp", "[s")
-- nmap("<leader>sa", "zg")
-- nmap("<leader>s?", "z=")

-- Paste Mode
nmap("<leader>pp", "<cmd>setlocal paste!<cr>")
-- nmap("<leader>cd", ':cd <C-R>=expand("%:p:h")<cr>:pwd<cr>')

-- resize window
nmap("<C-h>", "<cmd>vertical resize +2<cr>", { desc = "Move window border left" })
nmap("<C-j>", "<cmd>resize -2<cr>", { desc = "Move window border down" })
nmap("<C-k>", "<cmd>resize +2<cr>", { desc = "Move window border up" })
nmap("<C-l>", "<cmd>vertical resize -2<cr>", { desc = "Move window border right" })

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

return {
  nmap = nmap,
  imap = imap,
  vmap = vmap,
  cmap = cmap,
  tmap = tmap,
}
