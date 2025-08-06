P = function(...)
  local args = { n = select("#", ...), ... }
  for i = 1, args.n do
    args[i] = vim.inspect(args[i])
  end
  print(unpack(args))
  return ...
end

if vim.g.vscode then
  if not pcall(require, "vsc") then
    vim.api.nvim_err_writeln("Failed to load vscode")
  end
  return
end

require("config.lazy")
