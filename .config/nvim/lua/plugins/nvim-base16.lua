local o = vim.o
local HOME = vim.env.HOME

-- Colorscheme
base16colorspace = 256
if vim.fn.filereadable(HOME .. "/.vimrc_background") then
    vim.cmd("source " .. HOME .. "/.vimrc_background")
else
    vim.cmd("colorscheme base16-onedark")
end
o.background = "dark"
o.termguicolors = true
