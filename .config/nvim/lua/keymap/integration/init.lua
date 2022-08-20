local map = require("keymap.util").map

local telescope = require("telescope.builtin")
if telescope then
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

local trouble = require("trouble")
if trouble then
  map("gi", function() trouble.open("lsp_implementations") end, "[LSP]Implementations(Trouble)")
  map("gr", function() trouble.open("lsp_references") end, "[LSP]References(Trouble)")
  map("<leader>dd", function() trouble.open("document_diagnostics") end, "[Diagnostic]Document(Trouble)")
  map("<leader>dq", function() trouble.open("quickfix") end, "[Diagnostic]Quick Fix(Trouble)")
  map("<leader>dw", function() trouble.open("workspace_diagnostics") end, "[Diagnostic]Workspace(Trouble)")
  map("<leader>ld", function() trouble.open("lsp_type_definition") end, "[LSP]Type definition(Trouble)")
  map("<leader>o", function() trouble.open("todo") end, "[TODO]List(Trouble)")
  map("<leader>x", function() trouble.open() end, "[Trouble]Toggle")
end

map("<leader>n", "<cmd>NvimTreeToggle<cr>", "[NvimTree]Toggle")

