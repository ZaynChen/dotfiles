P = function(...)
  local args = { n = select("#", ...), ... }
  for i = 1, args.n do
    args[i] = vim.inspect(args[i])
  end
  print(unpack(args))
  return ...
end


require "settings"
require "plugins"
require "keymap"
require "autocmd"
