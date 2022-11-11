P = function(...)
  local args = { n = select("#", ...), ... }
  for i = 1, args.n do
    args[i] = vim.inspect(args[i])
  end
  print(unpack(args))
  return ...
end

if vim.g.vscode then
  require "vscode"
else
  require "settings"
  require "plugins"
  require "keymap"
  require "autocmd"
end
