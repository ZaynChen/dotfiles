local LazyUtil = require("lazy.core.util")

local M = {}

setmetatable(M, {
  __index = function(t, k)
    if LazyUtil[k] then
      return LazyUtil[k]
    end
    t[k] = require("util." .. k) -- load here to prevent loops)
    return t[k]
  end
})

--[[
    Parameters:
        {mode}  string|table Same mode short names as
                |nvim_set_keymap()|. Can also be list of modes to
                create mapping on multiple modes.
        {lhs}   string Left-hand side |{lhs}| of the mapping.
        {rhs}   string|function Right-hand side |{rhs}| of the
                mapping. Can also be a Lua function. If a Lua
                function and `opts.expr == true`, returning `nil`
                is equivalent to an empty string.
        {desc}  string Can be used to give a description to keymap.
        {opts}  table Optional parameters map.
                • buffer: (number or boolean) Add a mapping to the
                  given buffer. When "true" or 0, use the current
                  buffer.
                • nowait: (boolean, default false)
                • silent: (boolean, default true)
                • script: (boolean, default false)
                • expr: (boolean, default false) if true,
                  replace_keycodes alse true
                  |nvim_replace_termcodes()| is applied to the
                  result of Lua expr maps.
                • unique: (boolean, default false)
                • remap: (boolean) Make the mapping recursive.
                  This is the inverse of the "noremap" option from
                  |nvim_set_keymap()|. Default `false`.
                • callback: When called from Lua, takes a Lua
                  function to call when the mapping is executed.
                Values are Booleans. Unknown key is an error.
    See also:
        |nvim_set_keymap()|
--]]
-- mode
-- {
--    "n", Normal
--    "i", Insert
--    "c", Cmd
--    "v", Visual, Select
--    "x", Visual
--    "s", Select
--    "o", Operator-pending
-- }
local DEFAULT_OPTS = {
  mode = "n",
  buffer = nil,
  nowait = nil,
  silent = true,
  script = nil,
  expr = nil,
  unique = nil,
  remap = false,
  callback = nil,
}

M.map = function(lhs, rhs, desc, opts)
  opts = vim.tbl_extend("force", DEFAULT_OPTS, opts or {})
  opts.desc = desc
  mode = opts.mode
  opts.mode = nil
  vim.keymap.set(mode, lhs, rhs, opts)
end

local sep = (function()
  ---@diagnostic disable-next-line: undefined-global
  if jit then
    ---@diagnostic disable-next-line: undefined-global
    local os = string.lower(jit.os)
    if os == "linux" or os == "osx" or os == "bsd" then
      return "/"
    else
      return "\\"
    end
  else
    return string.sub(package.config, 1, 1)
  end
end)()

M.joinpath = function(...)
  local args = { n = select("#", ...), ... }
  return table.concat(args, sep)
end

M.on_load = function(name, fn)
  local config = require("lazy.core.config")
  if config.plugins[name] and config.plugins[name]._.loadded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end
    })
  end
end

return M
