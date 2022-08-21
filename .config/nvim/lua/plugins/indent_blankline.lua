local ibl_ok, ibl = pcall(require, "indent_blankline")
if not ibl_ok then
  return
end

ibl.setup {
  space_char_blankline = " ",
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
}

-- vim.cmd [[highlight IndentBlanklineContextStart guibg=#E5C07B gui=nocombine]]
