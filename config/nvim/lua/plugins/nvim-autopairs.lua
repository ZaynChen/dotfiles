return {
  "windwp/nvim-autopairs",
  opts = {
    map_bs = true,
    map_c_h = true,
    map_c_w = true,
    map_cr = true,
    disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
    disable_in_macro = false,
    disable_in_visualblock = false,
    disable_in_replace_mode = true,
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    break_undo = true,
    check_ts = true,
    enable_moveright = true,
    enable_afterquote = true,
    enable_check_bracket_line = true,
    enable_bracket_in_quote = true,
    enable_abbr = true,
    ts_config = {
      -- lua = { 'string', 'source' },
      -- javascript = { 'string', 'template_string' },
    },
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      before_key = 'h',
      after_key = 'l',
      cursor_pos_before = true,
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      manual_position = true,
      highlight = 'Search',
      highlight_grey = 'Comment'
    },
  }
}
