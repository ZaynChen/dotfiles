local g = vim.g

g.tex_flavor="latex"
-- g.vimtex_compiler_progname = "nvr"
-- g.vimtex_view_method = "zathura"
g.vimtex_view_method = "skim"
g.vimtex_quickfix_mode = 0

vim.o.conceallevel = 1
g.tex_conceal = "abdmg"
-- g.vimtex_view_general_viewer = "/Applications/Skim.app/Contents/sharedSupport/displayline"
g.vimtex_view_general_options = "-r @line @pdf @tex"


g.vimtex_compiler_latexmk_engines = {
  _ = "-xelatex",
  pdflatex =  "-pdf",
  dvipdfex = "-pdfdvi",
  lualatex = "-lualatex",
  xelatex = "-xelatex",
  ["context (pdftex)"] = "-pdf -pdflatex=texexec",
  ["context (luatex)"] = "-pdf -pdflatex=contex",
  ["context (xetex)"] = "-pdf -pdflatex=''texexec --xtx''"
}

g.vimtex_compiler_latexrun_engines = {
  _ = "xelatex",
  pdflatex = "pdflatex",
  lualatex = "lualatex",
  xelatex = "xelatex"
}

-- g.vimtex_compiler_latexmk = {
--   executable = "latexmk",
--   option = {
--     "-xelatex",
--     "-file-line-error",
--     "-synctex=1",
--     "-interaction=nonstopmode"
--   }
-- }


-- local UpdateSkim = function()
--   local out = b.vimtex.out()
--   local tex = fn.expand("%:p")
--   local cmd = {g.vimtex_view_general_viewer, "-r"}

--   if #fn.system("pgrep Skim") > 0 then
--     vim.call(fn.expand(cmd, {"-g"}))
--   end

--   if fn.has("nvim") then
--     cmd = table.move({fn.line("."), out, tex}, 0, 2, #cmd, cmd)
--     vim.call(fn.jobstart(cmd))
--   elseif fn.has("job") then
--     cmd = table.move({fn.line("."), out, tex}, 0, 2, #cmd, cmd)
--     vim.call(fn.job_start(cmd))
--   else
--     cmd = table.move({fn.line("."), fn.shellescape(out), fn.shellescape(tex)}, 0, 2, #cmd, cmd)
--     vim.call(fn.system(fn.join(cmd, " ")))
--   end
-- end

-- vim.cmd([[
--   augroup vimtex_compilation
--     au!
--     au User VimtexEventCompileSuccess call UpdateSkim()
--   augroup END
-- ]])

