local map = function(mode, lhs, rhs, opts)
  -- vim.keymap.set sets noremap by default
  opts = vim.tbl_extend("keep", opts or {}, { silent = true })
  vim.keymap.set(mode, lhs, rhs, opts)
end


local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

local imap = function(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

local vmap = function(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

local cmap = function(lhs, rhs, opts)
  map('c', lhs, rhs, opts)
end

local tmap = function(lhs, rhs, opts)
  map('t', lhs, rhs, opts)
end

return {
  nmap = nmap,
  imap = imap,
  vmap = vmap,
  cmap = cmap,
  tmap = tmap,
}
