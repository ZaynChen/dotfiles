local npairs_ok, npairs = pcall(require, "nvim-autopairs")
if not npairs_ok then
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    -- lua = { 'string', 'source' },
    -- javascript = { 'string', 'template_string' },
  },
  disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment'
  },
}

-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

-- cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
