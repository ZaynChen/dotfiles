P = function(...)
  local args = { n = select("#", ...), ... }
  for i = 1, args.n do
    args[i] = vim.inspect(args[i])
  end
  print(unpack(args))
  return ...
end

local configfiles = {}
if vim.g.vscode then
  configfiles = vim.tbl_extend("force", configfiles, { "vscode" })
else
  configfiles = vim.tbl_extend("force", configfiles, {
    "settings",
    "plugins",
    "keymap",
    "autocmd",
  })
end

for _, file in ipairs(configfiles) do
  if not pcall(require, file) then
    vim.api.nvim_err_writeln("Failed to load " .. file)
  end
end
