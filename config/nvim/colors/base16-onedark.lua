local gui        = {
  -- Base16 colors.
  "#282c34", "#353b45", "#3e4451", "#545862", "#565c64",
  "#abb2bf", "#b6bdca", "#c8ccd4",
  "#e06c75", "#d19a66", "#e5c07b", "#98c379", "#56b6c2", "#61afef", "#c678dd",
  "#be5046",
  -- Base24 colors.
  "#282c34", "#282c34",
  "#e06c75", "#e5c07b", "#98c379", "#56b6c2", "#61afef", "#c678dd",
}

-- #000000 00, #00ff00 10, #ffff00 11, #808080 08, #0000ff 12
-- #c0c0c0 07, #ff00ff 13, #ffffff 15,
-- #800000 01, #ff0000 09, #808000 03, #008000 02, #008080 06, #000080 04, #800080 05,
-- #00ffff 14,
-- #000000 00, #000000 00,
-- #ff0000 09, #ffff00 11, #00ff00 10, #00ffff 14, #0000ff 12, #ff00ff 13
local cterm      = {
  -- Base16 colors.
  00, 10, 11, 08, 12,
  07, 13, 15,
  01, 09, 03, 02, 06, 04, 05,
  14,
  -- Base24 colors.
  00, 00,
  09, 11, 10, 14, 12, 13,
}

local highlights = {
  -- basic editor highlight-groups
  Normal                           = { fg = 06, bg = 01 },
  NormalNC                         = {},
  Visual                           = { bg = 03 },
  VisualNOS                        = { fg = 09 },
  Search                           = { fg = 02, bg = 11 },
  Substitute                       = { link = "Search" },
  CurSearch                        = { fg = 02, bg = 10 },
  IncSearch                        = { fg = 02, bg = 10 },

  Cursor                           = { fg = 01, bg = 06 },
  lCursor                          = { link = "Cursor" },
  CursorIM                         = { link = "Cursor" },
  TermCursor                       = { reverse = true },

  ColorColumn                      = { bg = 02 },
  CursorColumn                     = { bg = 02 },
  FoldColumn                       = { fg = 13, bg = 02 },
  SignColumn                       = { fg = 04, bg = 02 },

  LineNr                           = { fg = 04, bg = 02 },
  LineNrAbove                      = { link = "LineNr" },
  LineNrBelow                      = { link = "LineNr" },
  Folded                           = { fg = 04, bg = 02 },
  CursorLine                       = { bg = 02 },
  CursorLineNr                     = { fg = 05, bg = 02 },
  CursorLineFold                   = { link = "FoldColumn" },
  CursorLineSign                   = { link = "SignColumn" },
  QuickFixLine                     = { bg = 02 },

  NormalFloat                      = { bg = 01 },
  FloatBorder                      = { link = "NormalFloat" },
  FloatTitle                       = { link = "Title" },
  FloatFooter                      = { link = "FloatTitle" },
  -- FloatShadow                = { bg = 04, ctermbg = 0, blend = 80 },
  -- FloatShadowThrough         = { bg = 04, ctermbg = 0, blend = 100 },

  StatusLine                       = { fg = 05, bg = 03 },
  StatusLineNC                     = { fg = 04, bg = 02 },
  StatusLineTerm                   = { link = "StatusLine" },
  StatusLineTermNC                 = { link = "StatusLineNC" },

  TabLine                          = { fg = 04, bg = 02 },
  TabLineFill                      = { fg = 04, bg = 02 },
  TabLineSel                       = { fg = 12, bg = 02 },

  WinBar                           = { fg = 04, bg = 01, bold = true },
  WinBarNC                         = { fg = 04, bg = 01 },
  WinSeparator                     = { fg = 03, bg = 03 },
  VertSplit                        = { link = "WinSeparator" },

  -- OkMsg                      = {},
  WarningMsg                       = { fg = 09 },
  ErrorMsg                         = { fg = 09, bg = 01 },
  -- StderrMsg                  = {},
  -- StdoutMsg                  = {},
  ModeMsg                          = { fg = 12 },
  MoreMsg                          = { link = "ModeMsg" },
  MsgArea                          = {},
  MsgSeparator                     = { link = "StatusLine" },

  Conceal                          = { fg = 14, bg = 01 },
  Directory                        = { fg = 14 },
  Question                         = { fg = 14 },
  Title                            = { fg = 14 },

  MatchParen                       = { bg = 04 },
  NonText                          = { fg = 04 },
  SpecialKey                       = { fg = 04 },
  Whitespace                       = { link = "NonText" },
  EndOfBuffer                      = { link = "NonText" },
  SnippetTabstop                   = { link = "Visual" },

  SpellBad                         = { undercurl = true, sp = 09 },
  SpellLocal                       = { undercurl = true, sp = 13 },
  SpellCap                         = { undercurl = true, sp = 14 },
  SpellRare                        = { undercurl = true, sp = 15 },

  PMenu                            = { fg = 06, bg = 02 },
  PMenuSel                         = { fg = 02, bg = 06 },
  PmenuKind                        = { link = "Pmenu" },
  PmenuKindSel                     = { link = "PmenuSel" },
  PmenuExtra                       = { link = "Pmenu" },
  PmenuExtraSel                    = { link = "PmenuSel" },
  PmenuSbar                        = { link = "Pmenu" },
  PmenuThumb                       = { bg = 04 },
  PmenuMatch                       = { bold = true },
  PmenuMatchSel                    = { bold = true },
  -- PmenuBorder            = {},
  -- PmenuShadow            = {},
  -- PmenuShadowThrough     = {},
  WildMenu                         = { fg = 09, bg = 11 },
  ComplMatchIns                    = {},
  -- PreInsert              = {},
  -- ComplHint              = {},
  -- ComplHintMore          = {},

  DiffAdd                          = { fg = 12, bg = 02 },
  DiffChange                       = { fg = 04, bg = 02 },
  DiffDelete                       = { fg = 09, bg = 02 },
  DiffText                         = { fg = 14, bg = 02 },
  DiffTextAdd                      = { link = "DiffText" },

  -- standard syntax group-names (in addition, syntax fies can define
  -- language-specific groups ,which ware prefixed with the langauge name)
  Added                            = { fg = 12, bg = 01 },
  Changed                          = { fg = 04, bg = 01 },
  Removed                          = { fg = 09, bg = 01 },

  Comment                          = { fg = 04 },

  Constant                         = { fg = 10 },
  String                           = { fg = 12 },
  Character                        = { fg = 09 },
  Number                           = { fg = 10 },
  Boolean                          = { fg = 10 },
  Float                            = { fg = 10 },

  Identifier                       = { fg = 09 },
  Function                         = { fg = 14 },

  Statement                        = { fg = 15 },
  Conditional                      = { fg = 15 },
  Repeat                           = { fg = 11 },
  Label                            = { fg = 11 },
  Operator                         = { fg = 06 },
  Keyword                          = { fg = 15 },
  Exception                        = { fg = 09 },
  PreCondit                        = { fg = 15 },

  PreProc                          = { fg = 11 },
  Include                          = { fg = 14 },
  Define                           = { fg = 15 },
  Macro                            = { fg = 09 },

  Type                             = { fg = 11 },
  StorageClass                     = { fg = 11 },
  Structure                        = { fg = 15 },
  Typedef                          = { fg = 11 },

  Special                          = { fg = 13 },
  SpecialChar                      = { fg = 16 },
  Tag                              = { fg = 11 },
  Delimiter                        = { fg = 16 },
  SpecialComment                   = { fg = 11, italic = true },
  Debug                            = { fg = 09 },

  Underlined                       = { fg = 09 },

  Ignore                           = { link = "Normal" },

  Error                            = { fg = 01, bg = 09 },

  Todo                             = { fg = 11, bg = 02 },

  -- custom
  Bold                             = { bold = true },
  Italic                           = { italic = true },
  Strikethrough                    = { strikethrough = true },
  underline                        = { underline = true },
  TooLong                          = { fg = 09 },

  -- diagnostic-highlights
  DiagnosticError                  = { fg = 09 },
  DiagnosticWarn                   = { fg = 11 },
  DiagnosticInfo                   = { fg = 13 },
  DiagnosticHint                   = { fg = 14 },
  DiagnosticOk                     = { fg = 12 },
  DiagnosticVirtualTextError       = { link = "DiagnosticError" },
  DiagnosticVirtualTextWarn        = { link = "DiagnosticWarn" },
  DiagnosticVirtualTextInfo        = { link = "DiagnosticInfo" },
  DiagnosticVirtualTextHint        = { link = "DiagnosticHint" },
  DiagnosticVirtualTextOk          = { link = "DiagnosticOk" },
  DiagnosticVirtualLinesError      = { link = "DiagnosticError" },
  DiagnosticVirtualLinesWarn       = { link = "DiagnosticWarn" },
  DiagnosticVirtualLinesInfo       = { link = "DiagnosticInfo" },
  DiagnosticVirtualLinesHint       = { link = "DiagnosticHint" },
  DiagnosticVirtualLinesOk         = { link = "DiagnosticOk" },
  DiagnosticUnderlineError         = { underline = true, sp = 9 },
  DiagnosticUnderlineWarn          = { underline = true, sp = 11 },
  DiagnosticUnderlineInfo          = { underline = true, sp = 13 },
  DiagnosticUnderlineHint          = { underline = true, sp = 14 },
  DiagnosticUnderlineOk            = { underline = true, sp = 12 },
  DiagnosticFloatingError          = { link = "DiagnosticError" },
  DiagnosticFloatingWarn           = { link = "DiagnosticWarn" },
  DiagnosticFloatingInfo           = { link = "DiagnosticInfo" },
  DiagnosticFloatingHint           = { link = "DiagnosticHint" },
  DiagnosticFloatingOk             = { link = "DiagnosticOk" },
  DiagnosticSignError              = { link = "DiagnosticError" },
  DiagnosticSignWarn               = { link = "DiagnosticWarn" },
  DiagnosticSignInfo               = { link = "DiagnosticInfo" },
  DiagnosticSignHint               = { link = "DiagnosticHint" },
  DiagnosticSignOk                 = { link = "DiagnosticOk" },
  DiagnosticDeprecated             = { strikethrough = true, sp = 09 },
  DiagnosticUnnecessary            = { link = "Comment" },

  -- treesitter-highlight-groups
  ["@variable"]                    = { link = "Identifier" },
  ["@variable.builtin"]            = { fg = 06, italic = true },
  ["@variable.parameter"]          = { link = "Identifier" },
  ["@variable.parameter.builtin"]  = { link = "@variable.builtin" },
  ["@variable.member"]             = { link = "Identifier" },

  ["@constant"]                    = { link = "Constant" },
  ["@constant.builtin"]            = { fg = 10, italic = true },
  ["@constant.macro"]              = { link = "Constant" },

  ["@module"]                      = { link = "Identifier" },
  ["@module.builtin"]              = { fg = 06, italic = true },
  ["@label"]                       = { link = "Label" },

  ["@string"]                      = { link = "String" },
  ["@string.documentation"]        = { link = "String" },
  ["@string.regexp"]               = { link = "SpecialComment" },
  ["@string.escape"]               = { link = "SpecialComment" },
  ["@string.special"]              = { link = "SpecialComment" },
  ["@string.special.symbol"]       = { link = "SpecialComment" },
  ["@string.special.path"]         = { fg = 14, italic = true },
  ["@string.special.url"]          = { fg = 09, italic = true },

  ["@character"]                   = { link = "Character" },
  ["@character.special"]           = { link = "SpecialChar" },

  ["@boolean"]                     = { link = "Boolean" },
  ["@number"]                      = { link = "Number" },
  ["@number.float"]                = { link = "Float" },

  ["@type"]                        = { link = "Type" },
  ["@type.builtin"]                = { fg = 11, italic = true },
  ["@type.definition"]             = { link = "Typedef" },

  ["@attribute"]                   = { link = "Special" },
  ["@attribute.builtin"]           = { fg = 13, italic = true },

  ["@property"]                    = { link = "@variable.member" },

  ["@function"]                    = { fg = 23 },
  ["@function.builtin"]            = { fg = 23, italic = true },
  ["@function.call"]               = { link = "@function" },
  ["@function.macro"]              = { link = "Macro" },
  ["@function.method"]             = { link = "Function" },
  ["@function.method.call"]        = { link = "@function.method" },

  ["@constructor"]                 = { fg = 14, bold = true },
  ["@operator"]                    = { link = "Operator" },

  ["@keyword"]                     = { link = "Keyword" },
  ["@keyword.coroutine"]           = { link = "Repeat" },
  ["@keyword.function"]            = { link = "Keyword" },
  ["@keyword.operator"]            = { link = "Operator" },
  ["@keyword.import"]              = { fg = 15, italic = true },
  ["@keyword.type"]                = { link = "keyword" },
  ["@keyword.modifier"]            = { link = "Repeat" },
  ["@keyword.repeat"]              = { link = "Repeat" },
  ["@keyword.return"]              = { link = "Keyword" },
  ["@keyword.debug"]               = { link = "Debug" },
  ["@keyword.exception"]           = { link = "Exception" },
  ["@keyword.conditional"]         = { link = "Conditional" },
  ["@keyword.conditional.ternary"] = { link = "Conditional" },
  ["@keyword.directive"]           = { link = "PreProc" },
  ["@keyword.directive.define"]    = { link = "Define" },

  ["@punctuation"]                 = { link = "Delimiter" },
  ["@punctuation.delimiter"]       = { link = "Delimiter" },
  ["@punctuation.bracket"]         = { link = "Delimiter" },
  ["@punctuation.special"]         = { link = "Special" },

  ["@comment"]                     = { link = "Comment" },
  ["@comment.documentation"]       = { link = "Comment" },
  ["@comment.error"]               = { fg = 09, italic = true },
  ["@comment.warning"]             = { fg = 10, italic = true },
  ["@comment.todo"]                = { fg = 13, italic = true },
  ["@comment.note"]                = { fg = 14, italic = true },

  ["@markup"]                      = { link = "Special" },
  ["@markup.strong"]               = { link = "Bold" },
  ["@markup.italic"]               = { link = "Italic" },
  ["@markup.strikethrough"]        = { link = "Strikethrough" },
  ["@markup.underline"]            = { link = "Underline" },

  ["@markup.heading"]              = { link = "Title" },
  -- ["@markup.heading.1"]           = {},
  -- ["@markup.heading.2"]           = {},
  -- ["@markup.heading.3"]           = {},
  -- ["@markup.heading.4"]           = {},
  -- ["@markup.heading.5"]           = {},
  -- ["@markup.heading.6"]           = {},

  ["@markup.quote"]                = { fg = 13 },
  ["@markup.math"]                 = { link = "Special" },

  ["@markup.link"]                 = { fg = 09 },
  ["@markup.link.label"]           = { link = "@markup.link" },
  ["@markup.link.url"]             = { fg = 10 },

  ["@markup.raw"]                  = { fg = 12 },
  ["@markup.raw.block"]            = { link = "@markup.raw" },

  ["@markup.list"]                 = { link = "SpecialChar" },
  ["@markup.list.checked"]         = { link = "DiagnosticOk" },
  ["@markup.list.unchecked"]       = { link = "DiagnosticError" },

  -- ["@diff"]                       = {},
  ["@diff.plus"]                   = { link = "Added" },
  ["@diff.minus"]                  = { link = "Removed" },
  ["@diff.delta"]                  = { link = "Changed" },

  ["@tag"]                         = { link = "Tag" },
  ["@tag.builtin"]                 = { fg = 10, italic = true },
  ["@tag.attribute"]               = { link = "Special" },
  ["@tag.delimiter"]               = { link = "Delimiter" },

  -- lsp-semantic-highight groups
  ["@lsp.type.class"]              = { link = "@type" },
  ["@lsp.type.comment"]            = { link = "@comment" },
  ["@lsp.type.decorator"]          = { link = "@attribute" },
  ["@lsp.type.enum"]               = { link = "@type" },
  ["@lsp.type.enumMember"]         = { link = "@constant" },
  ["@lsp.type.event"]              = { link = "@type" },
  ["@lsp.type.function"]           = { link = "@function" },
  ["@lsp.type.interface"]          = { link = "@type" },
  ["@lsp.type.keyword"]            = { link = "@keyword" },
  ["@lsp.type.macro"]              = { link = "@function.macro" },
  ["@lsp.type.method"]             = { link = "@function.method" },
  ["@lsp.type.modifier"]           = { link = "@type.modifier" },
  ["@lsp.type.namespace"]          = { link = "@module" },
  ["@lsp.type.number"]             = { link = "@number" },
  ["@lsp.type.operator"]           = { link = "@operator" },
  ["@lsp.type.parameter"]          = { link = "@variable.parameter" },
  ["@lsp.type.property"]           = { link = "@property" },
  ["@lsp.type.regexp"]             = { link = "@string.regexp" },
  ["@lsp.type.string"]             = { link = "@string" },
  ["@lsp.type.struct"]             = { link = "@type" },
  ["@lsp.type.type"]               = { link = "@type" },
  ["@lsp.type.typeParameter"]      = { link = "@variable.parameter" },
  ["@lsp.type.variable"]           = { link = "@variable" },

  ["@lsp.mod.abstract"]            = { link = "@lsp" },
  ["@lsp.mod.async"]               = { link = "@lsp" },
  ["@lsp.mod.declaration"]         = { link = "@lsp" },
  ["@lsp.mod.defaultLibrary"]      = { link = "@lsp" },
  ["@lsp.mod.definition"]          = { link = "@lsp" },
  ["@lsp.mod.deprecated"]          = { link = "DiagnosticDeprecated" },
  ["@lsp.mod.documentation"]       = { link = "@lsp" },
  ["@lsp.mod.modification"]        = { link = "@lsp" },
  ["@lsp.mod.readonly"]            = { link = "@lsp" },
  ["@lsp.mod.static"]              = { link = "@lsp" },

  -- lsp-highlight of symbols and references
  LspReferenceText                 = { link = "Search" },
  LspReferenceRead                 = { fg = 02, bg = 21 },
  LspReferenceWrite                = { fg = 02, bg = 19 },
  LspReferenceTarget               = { link = "LspReferenceText" },
  LspInlayHint                     = { link = "NonText" },
  LspCodeLens                      = { link = "NonText" },
  LspCodeLensSeparator             = { link = "LspCodeLens" },
  LspSignatureActiveParameter      = { link = "Visual" },

  -- language-specific groups, prefixed with the language name
  -- C highlighting
  cOperator                        = { fg = 13 },
  cPreCondit                       = { fg = 15 },

  -- C# highlighting
  csClass                          = { fg = 11 },
  csAttribute                      = { fg = 11 },
  csModifier                       = { fg = 15 },
  csType                           = { fg = 09 },
  csUnspecifiedStatement           = { fg = 14 },
  csContextualStatement            = { fg = 15 },
  csNewDecleration                 = { fg = 09 },

  -- CSS highlighting
  cssBraces                        = { fg = 06 },
  cssClassName                     = { fg = 15 },
  cssColor                         = { fg = 13 },

  -- Git highlighting
  gitcommitOverflow                = { fg = 09 },
  gitcommitSummary                 = { fg = 12 },
  gitcommitComment                 = { fg = 04 },
  gitcommitUntracked               = { fg = 04 },
  gitcommitDiscarded               = { fg = 04 },
  gitcommitSelected                = { fg = 04 },
  gitcommitHeader                  = { fg = 15 },
  gitcommitSelectedType            = { fg = 14 },
  gitcommitUnmergedType            = { fg = 14 },
  gitcommitDiscardedType           = { fg = 14 },
  gitcommitBranch                  = { fg = 10, bold = true },
  gitcommitUntrackedFile           = { fg = 11 },
  gitcommitUnmergedFile            = { fg = 09, bold = true },
  gitcommitDiscardedFile           = { fg = 09, bold = true },
  gitcommitSelectedFile            = { fg = 12, bold = true },

  -- GitGutter highlighting
  GitGutterAdd                     = { fg = 12, bg = 02 },
  GitGutterChange                  = { fg = 14, bg = 02 },
  GitGutterDelete                  = { fg = 09, bg = 02 },
  GitGutterChangeDelete            = { fg = 15, bg = 02 },

  -- HTML highlighting
  htmlBold                         = { fg = 11 },
  htmlItalic                       = { fg = 15 },
  htmlEndTag                       = { fg = 06 },
  htmlTag                          = { fg = 06 },

  -- JavaScript highlighting
  javaScript                       = { fg = 06 },
  javaScriptBraces                 = { fg = 06 },
  javaScriptNumber                 = { fg = 10 },

  -- pangloss/vim-javascript highlighting
  jsOperator                       = { fg = 14 },
  jsStatement                      = { fg = 15 },
  jsReturn                         = { fg = 15 },
  jsThis                           = { fg = 09 },
  jsClassDefinition                = { fg = 11 },
  jsFunction                       = { fg = 15 },
  jsFuncName                       = { fg = 14 },
  jsFuncCall                       = { fg = 14 },
  jsClassFuncName                  = { fg = 14 },
  jsClassMethodType                = { fg = 15 },
  jsRegexpString                   = { fg = 13 },
  jsGlobalObjects                  = { fg = 11 },
  jsGlobalNodeObjects              = { bg = 11 },
  jsExceptions                     = { fg = 11 },
  jsBuiltins                       = { fg = 11 },

  -- Mail highlighting
  mailQuoted1                      = { fg = 11 },
  mailQuoted2                      = { fg = 12 },
  mailQuoted3                      = { fg = 15 },
  mailQuoted4                      = { fg = 13 },
  mailQuoted5                      = { fg = 14 },
  mailQuoted6                      = { fg = 11 },
  mailURL                          = { fg = 14 },
  mailEmail                        = { fg = 14 },

  -- Markdown highlighting
  markdownCode                     = { fg = 12 },
  markdownError                    = { fg = 06, bg = 01 },
  markdownCodeBlock                = { fg = 12 },
  markdownHeadingDelimiter         = { fg = 14 },

  -- NERDTree highlighting
  NERDTreeDirSlash                 = { fg = 14 },
  NERDTreeExecFile                 = { fg = 06 },

  -- PHP highlighting
  phpMemberSelector                = { fg = 06 },
  phpComparison                    = { fg = 06 },
  phpParent                        = { fg = 06 },
  phpMethodsVar                    = { fg = 13 },

  -- Python highlighting
  pythonOperator                   = { fg = 15 },
  pythonRepeat                     = { fg = 15 },
  pythonInclude                    = { fg = 15 },
  pythonStatement                  = { bg = 15 },

  -- Ruby highlighting
  rubyAttribute                    = { fg = 14 },
  rubyConstant                     = { fg = 11 },
  rubyInterpolationDelimiter       = { fg = 16 },
  rubyRegexp                       = { fg = 13 },
  rubySymbol                       = { fg = 12 },
  rubyStringDelimiter              = { fg = 12 },

  -- SASS highlighting
  sassidChar                       = { fg = 09 },
  sassClassChar                    = { fg = 10 },
  sassInclude                      = { fg = 15 },
  sassMixing                       = { fg = 15 },
  sassMixinName                    = { fg = 14 },

  -- Signify highlighting
  SignifySignAdd                   = { fg = 12, bg = 02 },
  SignifySignChange                = { fg = 14, bg = 02 },
  SignifySignDelete                = { fg = 09, bg = 02 },

  -- Startify highlighting
  StartifyBracket                  = { fg = 04 },
  StartifyFile                     = { fg = 08 },
  StartifyFooter                   = { fg = 04 },
  StartifyHeader                   = { fg = 12 },
  StartifyNumber                   = { fg = 10 },
  StartifyPath                     = { fg = 04 },
  StartifySection                  = { fg = 15 },
  StartifySelect                   = { fg = 13 },
  StartifySlash                    = { fg = 04 },
  StartifySpecial                  = { fg = 04 },

  -- Java highlighting
  javaOperator                     = { fg = 14 },
}

vim.o.background = "dark"

vim.cmd [[
  highlight clear
  syntax reset
]]

vim.g.colors_name          = "base16-onedark"
vim.g.terminal_ansi_colors = {
  "#282c34",
  "#e06c75",
  "#98c379",
  "#e5c07b",
  "#61afef",
  "#c678dd",
  "#56b6c2",
  "#abb2bf",
  "#545862",
  "#e06c75",
  "#98c379",
  "#e5c07b",
  "#61afef",
  "#c678dd",
  "#56b6c2",
  "#c8ccd4",
}

for name, val in pairs(highlights) do
  if val.fg and type(val.fg) == "number" then
    val.ctermfg = val.ctermfg or cterm[val.fg]
    val.fg = gui[val.fg]
  end
  if val.bg and type(val.bg) == "number" then
    val.ctermbg = val.ctermbg or cterm[val.bg]
    val.bg = gui[val.bg]
  end
  if val.sp and type(val.sp) == "number" then
    val.sp = gui[val.sp]
  end
  vim.api.nvim_set_hl(0, name, val)
end
