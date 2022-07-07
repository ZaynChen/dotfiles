local g = vim.g

g.tex_flavor = "latex"
g.vimtex_view_method = "zathura"
g.vimtex_view_skim_sync = 1
g.vimtex_view_skim_activate = 1

g.vimtex_compiler_progname = "nvr"
g.vimtex_quickfix_mode = 0

vim.o.conceallevel = 1
g.tex_conceal = "abdmg"

g.vimtex_view_general_options = "-r @line @pdf @tex"

g.vimtex_compiler_latexmk = {
  build_dir = "build",
  option = {
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
  }
}
