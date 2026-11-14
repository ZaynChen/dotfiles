local opt = vim.opt

vim.g.mapleader = " "
opt.whichwrap:append { ["<"] = true, [">"] = true, h = true, l = true }
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"
opt.timeoutlen = 1000

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

local function map(lhs, rhs, desc, opts)
  opts = vim.tbl_extend("force", DEFAULT_OPTS, opts or {})
  opts.desc = desc
  local mode = opts.mode
  opts.mode = nil
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("0", "virtcol('.') == indent('.')+1 ? '0': '^'", "Start of line (smart)", { expr = true })

map("<leader>e", "<cmd>Edit<cr>", "Edit a file")
map("<leader>w", "<cmd>Update<cr>", "Write to a file when buffer is modified")
map("<leader>q", "<cmd>Quit<cr>", "workbench.action.closeActiveEditor")

-- Comment
map("gc", "<Plug>VSCodeCommentary", "gc", { mode = { "n", "o", "x" } })
map("gcc", "<Plug>VSCodeCommentaryLine", "gcc")
