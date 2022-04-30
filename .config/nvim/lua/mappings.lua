local map = function(mode, lhs, rhs)
    opt = { noremap = true, silent = true }
    -- >= 0.7.0
    vim.keymap.set(mode, lhs, rhs, opt)
    -- < 0.7.0
    -- vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
end

local bmap = function(bufnr, mode, lhs, rhs)
    opt = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opt)
end

local nmap = function(lhs, rhs)
    map('n', lhs, rhs)
end

local nbmap = function(bufnr, lhs, rhs)
    bmap(bufnr, 'n', lhs, rhs)
end

local imap = function(lhs, rhs)
    map('i', lhs, rhs)
end

local vmap = function(lhs, rhs)
    map('v', lhs, rhs)
end

local cmap = function(lhs, rhs)
    map('c', lhs, rhs)
end

local tmap = function(lhs, rhs)
    map('t', lhs, rhs)
end


nmap("<leader>w", "<cmd>w<cr>")

-- nmap("<leader>e", ':e <C-R>=expand("%:p:h")."/"<cr>')
vim.cmd('nmap <leader>e :e <C-R>=expand("%:p:h")."/"<cr>')

nmap("<leader>q", "<cmd>q<cr>")
nmap("<leader>Q", "<cmd>q!<cr>")
nmap("<leader>wq", "<cmd>wq<cr>")

nmap("<leader><cr>", "<cmd>noh<cr>")

nmap("<leader>l", "<cmd>bnext<cr>")
nmap("<leader>h", "<cmd>bprevious<cr>")

nmap("<leader>tn", "<cmd>tabnew<cr>")
nmap("<leader>to", "<cmd>tabonly<cr>")
nmap("<leader>tc", "<cmd>tabclose<cr>")
nmap("<leader>tm", "<cmd>tabmove<cr>")
nmap("<leader>th", "<cmd>tabprevious<cr>")
nmap("<leader>tl", "<cmd>tabnext<cr>")

-- nmap("<leader>te", ':tabedit <C-R>=expand("%:p:h")."/"<cr>')
vim.cmd('nmap <leader>te :tabedit <C-R>=expand("%:p:h")."/"<cr>')

-- Spell Check
nmap("<leader>ss", "<cmd>setlocal spell!<cr>")

-- nmap("<leader>sn", "]s")
-- nmap("<leader>sp", "[s")
-- nmap("<leader>sa", "zg")
-- nmap("<leader>s?", "z=")

-- Paste Mode
nmap("<leader>pp", "<cmd>setlocal paste!<cr>")

-- nmap("<leader>cd", ':cd <C-R>=expand("%:p:h")<cr>:pwd<cr>')

-- cursor up-down
nmap("<C-j>", "<C-e>")
nmap("<C-k>", "<C-y>")

-- <M-h>
imap("˙", "<S-Left>")
-- <M-l>
imap("¬", "<S-Right>")

-- cursor line
imap("<C-g>h", "<Home>")
imap("<C-g>l", "<End>")

cmap("<C-a>", "<Home>")
cmap("<C-e>", "<End>")

-- tmap("<C-s>", "<C-\\><C-n>")
-- tmap("<Esc><Esc>", "<C-\\><C-n>")

-- nmap("vv", "<C-w>v")
-- nmap("ss", "<C-w>s")

vim.o.splitbelow = true
vim.o.splitright = true

return {
    nmap = nmap,
    imap = imap,
    vmap = vmap,
    cmap = cmap,
    tmap = tmap,
    nbmap = nbmap
}
