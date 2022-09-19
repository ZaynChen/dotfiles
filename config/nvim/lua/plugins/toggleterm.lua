local term_ok, term = pcall(require, "toggleterm")
if not term_ok then
  return
end

term.setup {
  size = 12,
  shade_filetypes = {},
  hide_numbers = true,
  shade_terminals = true,
  insert_mappings = true,
  terminal_mappings = true,
  start_in_insert = true,
  persist_size = true,
  close_on_exit = true,
  direction = "horizontal",
  -- shading_factor =
  -- shell = vim.o.shell,
  float_opts = {
    winblend = 0,
  },
  open_mapping = [[<M-t>]]
}
