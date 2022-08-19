local wk = require("which-key")

local diagnostic = vim.diagnostic
local trouble    = require("trouble")
local telescope  = require("telescope.builtin")
local builtin    = require("telescope.builtin")

-- nmap("<leader>r", "<cmd>NvimTreeRefresh<cr>")
-- nmap("<leader>", "<cmd>NvimTreeFindFileToggle<cr>")
--
wk.register {
  g = {
    i = { function() trouble.open("lsp_implementations") end, "[LSP]Implementations(Trouble)" },
    r = { function() trouble.open("lsp_references") end, "[LSP]References(Trouble)" },
  }
}

wk.register({
  ["/"] = { function() builtin.live_grep() end, "[Telescope]live_grep" },
  d = {
    name = "diagnostic",
    j = { function() diagnostic.goto_next() end, "[Diagnostic]Next" },
    k = { function() diagnostic.goto_prev() end, "[Diagnostic]Prev" },
    d = { function() trouble.open("document_diagnostics") end, "[Diagnostics]Document(Trouble)" },
    w = { function() trouble.open("workspace_diagnostics") end, "[Diagnostics]Workspace(Trouble)" },
    q = { function() trouble.open("quickfix") end, "[Diagnostic]Quick Fix(Trouble)" },
  },
  f = { function() builtin.find_files() end, "[Telescope]find_files" },
  b = {
    b = { function() builtin.buffers() end, "[Buffer]List" }
  },
  h = {
    name = 'help',
    c = { function() telescope.colorscheme() end, "[Telescope]Colorscheme" },
    C = { function() telescope.commands() end, "[Telescope]Commands" },
    h = { function() telescope.help_tags() end, "[Telescope]Help" },
    k = { function() telescope.keymaps() end, "[Telescope]Keymaps" },
    m = { function() telescope.man_pages() end, "[Telescope]Man Pages" },
    r = { function() telescope.registers() end, "[Telescope]Registers" },
  },
  l = {
    name = "LSP",
    d = { function() trouble.open("lsp_type_definitions") end, "[LSP]Type definition(Trouble)" },
    s = { function() telescope.lsp_dynamic_workspace_symbols() end, "[LSP]Symbols Document(Telescope)" },
    S = { function() telescope.lsp_document_symbols() end, "[LSP]Symbols Workspace(Telescope)" },
  },
  n = { "<cmd>NvimTreeToggle<cr>", "[NvimTree]Toggle" },
  o = { function() trouble.open("todo") end, "[TODO]List(Trouble)" },
  x = { function() trouble.open() end, "[Trouble]Toggle" },
}, { prefix = "<leader>" })
