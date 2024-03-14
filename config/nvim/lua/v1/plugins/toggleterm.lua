local term_ok, term = pcall(require, "toggleterm")
if not term_ok then
  vim.api.nvim_err_writeln("Faield to load toggleterm")
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
  persist_mode = true,
  close_on_exit = true,
  -- direction = "horizontal",
  direction = "float", -- "vertical" | "horizontal" | "tab" | "float"
  autochdir = false,
  auto_scroll = true,
  float_opts = {
    winblend = 0,
  },
  open_mapping = [[<M-m>]]
}
