local map = require("keymap.util").map

map("0", "virtcol('.') == indent('.')+1 ? '0': '^'", "Start of line (smart)", { expr = true })
map("<M-Up>", "<cmd>resize -2<cr>", "[Window]Height Descrease")
map("<M-Down>", "<cmd>resize +2<cr>", "[Window]Height Increase")
map("<M-Left>", "<cmd>vertical resize -2<cr>", "[Window]Width decrease")
map("<M-Right>", "<cmd>vertical resize +2<cr>", "[Window]Width Increase")
-- map("<C-h>", "<C-w>h", "[Window]Left")
-- map("<C-j>", "<C-w>j", "[Window]Down")
-- map("<C-k>", "<C-w>k", "[Window]Up")
-- map("<C-l>", "<C-w>l", "[Window]Right")
map("<leader><cr>", "<cmd>noh<cr>")
map("<leader>bj", "<cmd>bnext<cr>", "[Buffer]Next")
map("<leader>bk", "<cmd>bprevious<cr>", "[Buffer]Prev")
map("<leader>bd", "<cmd>bdelete<cr>", "[Buffer]Delete from list")
map("<leader>cd", ':cd <C-R>=expand("%:p:h")<cr>', "Change directory",
  { silent = false })
map("<leader>clo", "<cmd>close<cr>", "Close current window")
local diagnostic = vim.diagnostic
map("<leader>dj", function() diagnostic.goto_next() end, "[Diagnostic]Next")
map("<leader>dk", function() diagnostic.goto_prev() end, "[Diagnostic]Prev")
map("<leader>e", ':e <C-R>=expand("%:p:h")."/"<cr>', "Edit a file", { silent = false })
map("<leader>q", "<cmd>q<cr>", "Quit current window (when one window quit Vim)")
map("<leader>ss", "<cmd>setlocal spell!<cr>", "[Spell]Spell check")
map("<leader>sj", "]s", "[Spell]Next misspelled word")
map("<leader>sk", "[s", "[Spell]Prevous misspelled word")
map("<leader>sa", "zg", "[Spell]Add word to spell list")
-- map("<leader>s=", "z=", "[Spell]Spelling suggestions")
map("<leader>tc", "<cmd>tabclose<cr>", "[Tab]Close")
map("<leader>te", ':tabedit <C-R>=expand("%:p:h")."/"<cr>', "[Tap]Edit", { silent = false })
map("<leader>tj", "<cmd>tabnext<cr>", "[Tap]Next")
map("<leader>tk", "<cmd>tabprevious<cr>", "[Tap]Prev")
map("<leader>tm", "<cmd>tabmove<cr>", "[Tap]Move")
map("<leader>tn", "<cmd>tabnew<cr>", "[Tap]New")
map("<leader>to", "<cmd>tabonly<cr>", "[Tap]Only")
map("<leader>w", "<cmd>w<cr>", "Write to a file")

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
  map("<leader>/", function() telescope.live_grep() end, "[Telescope]live_grep")
  map("<leader>bb", function() telescope.buffers() end, "[Buffer]List")
  map("<leader>f", function() telescope.find_files() end, "[Telescope]find_files")
  map("<leader>hC", function() telescope.colorscheme() end, "[Telescope]Colorscheme")
  map("<leader>hc", function() telescope.commands() end, "[Telescope]Commands")
  map("<leader>hh", function() telescope.help_tags() end, "[Telescope]Help")
  map("<leader>hk", function() telescope.keymaps() end, "[Telescope]Keymaps")
  map("<leader>hm", function() telescope.man_pages() end, "[Telescope]Man pages")
  map("<leader>hr", function() telescope.registers() end, "[Telescope]Registers")
  map("<leader>ls", function() telescope.lsp_document_symbols() end, "[LSP]Symbols Document(Telescope)")
  map("<leader>lS", function() telescope.lsp_dynamic_workspace_symbols() end, "[LSP]Symbols Document(Telescope)")
end

local trouble_ok, trouble = pcall(require, "trouble")
if trouble_ok then
  map("gi", function() trouble.open("lsp_implementations") end, "[LSP]Implementations(Trouble)")
  map("gr", function() trouble.open("lsp_references") end, "[LSP]References(Trouble)")
  map("<leader>dd", function() trouble.open("document_diagnostics") end, "[Diagnostic]Document(Trouble)")
  map("<leader>dq", function() trouble.open("quickfix") end, "[Diagnostic]Quick Fix(Trouble)")
  map("<leader>dw", function() trouble.open("workspace_diagnostics") end, "[Diagnostic]Workspace(Trouble)")
  map("<leader>ld", function() trouble.open("lsp_type_definition") end, "[LSP]Type definition(Trouble)")
  map("<leader>o", function() trouble.open("todo") end, "[TODO]List(Trouble)")
  map("<leader>x", function() trouble.open() end, "[Trouble]Toggle")
end

local nvimtree_ok, _ = pcall(require, "nvim-tree")
if nvimtree_ok then
  map("<leader>n", "<cmd>NvimTreeToggle<cr>", "[NvimTree]Toggle")
end
