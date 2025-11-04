local colors = {
  red = "#e06c75",          -- 08
  orange = "#d19a66",       -- 09
  yellow = "#e5c07b",       -- 0A
  green = "#98c379",        -- 0B
  cyan = "#56b6c2",         -- 0C
  blue = "#61afef",         -- 0D
  magenta = "#c678dd",      -- 0E
  purple = "#c678dd",       -- 0E
  error = "#be5046",        -- 0F
  dark_red = "#be5046",     -- 0F
  black = "#282c34",        -- 00
  bg = "#282c34",           -- 00
  cursor_grey = "#353b45",  -- 01
  visual_grey = "#3e4451",  -- 02
  comment_grey = "#545862", -- 03
  grey = "#565c64",         -- 04
  white = "#abb2bf",        -- 05
  fg = "#abb2bf",           -- 05
  fg1 = "#b6bdca",          -- 06
  fg2 = "#c8ccd4",          -- 07

  -- "#282c34"
  -- "#353b45"
  -- "#3e4451"
  -- "#545862"
  -- "#565c64"
  -- "#abb2bf"
  -- "#b6bdca"
  -- "#c8ccd4"
  -- "#e06c75"
  -- "#d19a66"
  -- "#e5c07b"
  -- "#98c379"
  -- "#56b6c2"
  -- "#61afef"
  -- "#c678dd"
  -- "#be5046"
}

local groups = {
  -- Standard
  Normal = { fg = colors.fg, bg = colors.bg },
  Bold = { bold = true },
  Debug = { fg = colors.red },
  Directory = { fg = colors.blue },
  Error = { fg = colors.bg, bg = colors.red },
  ErrorMsg = { fg = colors.red, bg = colors.bg },
  Exception = { fg = colors.red },
  FoldColumn = { fg = colors.cyan, bg = colors.cursor_grey },
  Folded = { fg = colors.comment_grey, bg = colors.cursor_grey },
  IncSearch = { fg = colors.cursor_grey, bg = colors.orange },
  Italic = {},
  Macro = { fg = colors.red },
  MatchParen = { bg = colors.comment_grey },
  ModeMsg = { fg = colors.green },
  MoreMsg = { fg = colors.green },
  Question = { fg = colors.blue },
  Search = { fg = colors.cursor_grey, bg = colors.yellow },
  Substitute = { fg = colors.cursor_grey, bg = colors.yellow },
  SpecialKey = { fg = colors.comment_grey },
  TooLong = { fg = colors.red },
  Underlined = { fg = colors.red },
  Visual = { bg = colors.visual_grey },
  VisualNOS = { fg = colors.red },
  WarningMsg = { fg = colors.red },
  WildMenu = { fg = colors.red, bg = colors.yellow }, -- nobg
  Title = { fg = colors.blue },
  Conceal = { fg = colors.blue, bg = colors.bg },
  Cursor = { fg = colors.bg, bg = colors.fg },
  NonText = { fg = colors.comment_grey },
  LineNr = { fg = colors.comment_grey, bg = colors.cursor_grey },
  SignColumn = { fg = colors.comment_grey, bg = colors.cursor_grey },
  StatusLine = { fg = colors.grey, bg = colors.visual_grey },
  StatusLineNC = { fg = colors.comment_grey, bg = colors.cursor_grey },
  VertSplit = { fg = colors.visual_grey, bg = colors.visual_grey },
  ColorColumn = { bg = colors.cursor_grey },
  CursorColumn = { bg = colors.cursor_grey },
  CursorLine = { bg = colors.cursor_grey },
  CursorLineNr = { fg = colors.grey, bg = colors.cursor_grey },
  QuickFixLine = { bg = colors.cursor_grey },
  PMenu = { fg = colors.fg, bg = colors.cursor_grey },
  PMenuSel = { fg = colors.cursor_grey, bg = colors.fg },
  TabLine = { fg = colors.comment_grey, bg = colors.cursor_grey },
  TabLineFill = { fg = colors.comment_grey, bg = colors.cursor_grey },
  TabLineSel = { fg = colors.green, bg = colors.cursor_grey },

  -- Standard syntax highlighting
  Boolean = { fg = colors.orange },
  Character = { fg = colors.red },
  Comment = { fg = colors.comment_grey },
  Conditional = { fg = colors.magenta },
  Constant = { fg = colors.orange },
  Define = { fg = colors.magenta },
  Delimiter = { fg = colors.error },
  Float = { fg = colors.orange },
  Function = { fg = colors.blue },
  Identifier = { fg = colors.red },
  Include = { fg = colors.blue },
  Keyword = { fg = colors.magenta },
  Label = { fg = colors.yellow },
  Number = { fg = colors.orange },
  Operator = { fg = colors.fg },
  PreProc = { fg = colors.yellow },
  Repeat = { fg = colors.yellow },
  Special = { fg = colors.cyan },
  SpecialChar = { fg = colors.error },
  Statement = { fg = colors.red },
  StorageClass = { bg = colors.yellow },
  String = { fg = colors.green },
  Structure = { fg = colors.magenta },
  Tag = { fg = colors.yellow },
  Todo = { fg = colors.yellow, bg = colors.cursor_grey },
  Type = { fg = colors.yellow },
  Typedef = { fg = colors.yellow },

  -- C highlighting
  cOperator = { fg = colors.cyan },
  cPreCondit = { fg = colors.magenta },

  -- C# highlighting
  csClass = { fg = colors.yellow },
  csAttribute = { fg = colors.yellow },
  csModifier = { fg = colors.magenta },
  csType = { fg = colors.red },
  csUnspecifiedStatement = { fg = colors.blue },
  csContextualStatement = { fg = colors.magenta },
  csNewDecleration = { fg = colors.red },

  -- CSS highlighting
  cssBraces = { fg = colors.fg },
  cssClassName = { fg = colors.magenta },
  cssColor = { fg = colors.cyan },

  -- Diff highlighting
  DiffAdd = { fg = colors.green, bg = colors.cursor_grey },
  DiffChange = { fg = colors.comment_grey, bg = colors.cursor_grey },
  DiffDelete = { fg = colors.red, bg = colors.cursor_grey },
  DiffText = { fg = colors.blue, bg = colors.cursor_grey },
  DiffAdded = { fg = colors.green, bg = colors.bg },
  DiffFile = { fg = colors.red, bg = colors.bg },
  DiffNewFile = { fg = colors.green, bg = colors.bg },
  DiffLine = { fg = colors.blue, bg = colors.bg },
  DiffRemoved = { fg = colors.red, bg = colors.bg },

  -- Git highlighting
  gitcommitOverflow = { fg = colors.red },
  gitcommitSummary = { fg = colors.green },
  gitcommitComment = { fg = colors.comment_grey },
  gitcommitUntracked = { fg = colors.comment_grey },
  gitcommitDiscarded = { fg = colors.comment_grey },
  gitcommitSelected = { fg = colors.comment_grey },
  gitcommitHeader = { fg = colors.magenta },
  gitcommitSelectedType = { fg = colors.blue },
  gitcommitUnmergedType = { fg = colors.blue },
  gitcommitDiscardedType = { fg = colors.blue },
  gitcommitBranch = { fg = colors.orange, bold = true },
  gitcommitUntrackedFile = { fg = colors.yellow },
  gitcommitUnmergedFile = { fg = colors.red, bold = true },
  gitcommitDiscardedFile = { fg = colors.red, bold = true },
  gitcommitSelectedFile = { fg = colors.green, bold = true },

  -- GitGutter highlighting
  GitGutterAdd = { fg = colors.green, bg = colors.cursor_grey },
  GitGutterChange = { fg = colors.blue, bg = colors.cursor_grey },
  GitGutterDelete = { fg = colors.red, bg = colors.cursor_grey },
  GitGutterChangeDelete = { fg = colors.magenta, bg = colors.cursor_grey },

  -- HTML highlighting
  htmlBold = { fg = colors.yellow },
  htmlItalic = { fg = colors.magenta },
  htmlEndTag = { fg = colors.fg },
  htmlTag = { fg = colors.fg },

  -- JavaScript highlighting
  javaScript = { fg = colors.fg },
  javaScriptBraces = { fg = colors.fg },
  javaScriptNumber = { fg = colors.orange },

  -- pangloss/vim-javascript highlighting
  jsOperator = { fg = colors.blue },
  jsStatement = { fg = colors.magenta },
  jsReturn = { fg = colors.magenta },
  jsThis = { fg = colors.red },
  jsClassDefinition = { fg = colors.yellow },
  jsFunction = { fg = colors.magenta },
  jsFuncName = { fg = colors.blue },
  jsFuncCall = { fg = colors.blue },
  jsClassFuncName = { fg = colors.blue },
  jsClassMethodType = { fg = colors.magenta },
  jsRegexpString = { fg = colors.cyan },
  jsGlobalObjects = { fg = colors.yellow },
  jsGlobalNodeObjects = { bg = colors.yellow },
  jsExceptions = { fg = colors.yellow },
  jsBuiltins = { fg = colors.yellow },

  -- Mail highlighting
  mailQuoted1 = { fg = colors.yellow },
  mailQuoted2 = { fg = colors.green },
  mailQuoted3 = { fg = colors.magenta },
  mailQuoted4 = { fg = colors.cyan },
  mailQuoted5 = { fg = colors.blue },
  mailQuoted6 = { fg = colors.yellow },
  mailURL = { fg = colors.blue },
  mailEmail = { fg = colors.blue },

  -- Markdown highlighting
  markdownCode = { fg = colors.green },
  markdownError = { fg = colors.fg, bg = colors.bg },
  markdownCodeBlock = { fg = colors.green },
  markdownHeadingDelimiter = { fg = colors.blue },

  -- NERDTree highlighting
  NERDTreeDirSlash = { fg = colors.blue },
  NERDTreeExecFile = { fg = colors.fg },

  -- PHP highlighting
  phpMemberSelector = { fg = colors.fg },
  phpComparison = { fg = colors.fg },
  phpParent = { fg = colors.fg },
  phpMethodsVar = { fg = colors.cyan },

  -- Python highlighting
  pythonOperator = { fg = colors.magenta },
  pythonRepeat = { fg = colors.magenta },
  pythonInclude = { fg = colors.magenta },
  pythonStatement = { bg = colors.magenta },

  -- Ruby highlighting
  rubyAttribute = { fg = colors.blue },
  rubyConstant = { fg = colors.yellow },
  rubyInterpolationDelimiter = { fg = colors.error },
  rubyRegexp = { fg = colors.cyan },
  rubySymbol = { fg = colors.green },
  rubyStringDelimiter = { fg = colors.green },

  -- SASS highlighting
  sassidChar = { fg = colors.red },
  sassClassChar = { fg = colors.orange },
  sassInclude = { fg = colors.magenta },
  sassMixing = { fg = colors.magenta },
  sassMixinName = { fg = colors.blue },

  -- Signify highlighting
  SignifySignAdd = { fg = colors.green, bg = colors.cursor_grey },
  SignifySignChange = { fg = colors.blue, bg = colors.cursor_grey },
  SignifySignDelete = { fg = colors.red, bg = colors.cursor_grey },

  -- Spelling highlighting
  SpellBad = { undercurl = true, sp = colors.red },
  SpellLocal = { undercurl = true, sp = colors.cyan },
  SpellCap = { undercurl = true, sp = colors.blue },
  SpellRare = { undercurl = true, sp = colors.magenta },

  -- Startify highlighting
  StartifyBracket = { fg = colors.comment_grey },
  StartifyFile = { fg = colors.fg2 },
  StartifyFooter = { fg = colors.comment_grey },
  StartifyHeader = { fg = colors.green },
  StartifyNumber = { fg = colors.orange },
  StartifyPath = { fg = colors.comment_grey },
  StartifySection = { fg = colors.magenta },
  StartifySelect = { fg = colors.cyan },
  StartifySlash = { fg = colors.comment_grey },
  StartifySpecial = { fg = colors.comment_grey },

  -- Java highlighting
  javaOperator = { fg = colors.blue },
}

function setup_termcolors()
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.comment_grey
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.magenta
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_15 = colors.fg2
end

function setup(opts)
  if opts.term_colors then
    setup_termcolors()
  end
  for group, setting in pairs(groups) do
    vim.api.nvim_set_hl(0, group, setting)
  end
end

setup({ term_colors = vim.o.termguicolors })
