-- Setup nvim-cmp
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

-- Format
local format = function(_, vim_item) return vim_item end
local lspkind_ok, lspkind = pcall(require, "lspkind")
if lspkind_ok then
  format = lspkind.cmp_format {
    mode = "symbol_text",
    preset = "default",
    -- symbol_map = {
    --   Class = " ",
    --   Color = " ",
    --   Constant = "ﲀ ",
    --   Constructor = " ",
    --   Enum = "練",
    --   EnumMember = " ",
    --   Event = " ",
    --   Field = " ",
    --   File = "",
    --   Folder = " ",
    --   Function = " ",
    --   Interface = "ﰮ ",
    --   Keyword = " ",
    --   Method = " ",
    --   Module = " ",
    --   Operator = "",
    --   Property = " ",
    --   Reference = " ",
    --   Snippet = " ",
    --   Struct = " ",
    --   Text = " ",
    --   TypeParameter = " ",
    --   Unit = "塞",
    --   Value = " ",
    --   Variable = " ",
    -- },
    -- maxwidth = 50,
    menu = {
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      cmp_nvim_lsp_signature_help = "[Signature]",
      -- ultisnips = "[Snips]",
      luasnip = "[Snips]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Tex]",
      treesitter = "[TS]",
      path = "[Path]",
      cmdline = "[Cmd]",
      spell = "[Spell]",
      calc = "[Calc]",
      crates = "[Crates]"
    },

    -- The function below will be called before any actual modifications from lspkind
    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    before = function(_, vim_item)
      return vim_item
    end
  }
end

local mappings = {
  ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
  ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
}
local expand = function(_) error("snippet engine is not configured.") end
local snips_ok, snips = pcall(require, "luasnip")
if snips_ok then
  -- expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end
  require("luasnip.loaders.from_snipmate").lazy_load()

  expand = function(args) snips.lsp_expand(args.body) end

  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  mappings = vim.tbl_deep_extend("force", mappings, {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- that way you will only jump inside the snippet region
      elseif snips.expand_or_jumpable() then
        snips.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s", "c" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif snips.jumpable(-1) then
        snips.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  })
end

-- local snips_ok, snips = pcall(require, "cmp_nvim_ultisnips")
-- if snips_ok then
--   snips.setup {} -- redundant; setup only required when customization
--   local snips_mappings = require("cmp_nvim_ultisnips.mappings")
--   mappings = vim.tbl_deep_extend("force", mappings, {
--     ["<Tab>"] = cmp.mapping(function(fallback) snips_mappings.expand_or_jump_forwards(fallback) end,
--       { "i", "s", "c" }),
--     ["<S-Tab>"] = cmp.mapping(function(fallback) snips_mappings.jump_backwards(fallback) end, { "i", "s", "c" }),
--   })
-- end


cmp.setup {
  performance = {
    debounce = 60,
    throttle = 30,
    fetching_timeout = 500,
    confirm_resolve_timeout = 80,
    async_budget = 1,
    max_view_entries = 200,
  },
  -- rust lsp https://github.com/hrsh7th/cmp-nvim-lsp/issues/29
  preselect = cmp.PreselectMode.None,
  mapping = cmp.mapping.preset.insert(mappings),
  snippet = {
    expand = expand,
  },
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged },
    completeopt = 'menu,menuone,noselect',
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
  },
  formatting = {
    expandable_indicator = true,
    fields = { "abbr", "kind", "menu" },
    format = format,
  },
  matching = {
    disallow_fuzzy_matching = false,
    disallow_fullfuzzy_matching = false,
    disallow_partial_fuzzy_matching = true,
    disallow_partial_matching = false,
    disallow_prefix_unmatching = false,
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      -- compare.scopes,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      -- compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  sources = cmp.config.sources({
    { name = "cmp-nvim-lsp-signature-help" },
  }, {
    { name = "path" },
  }, {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "crates" },
  }, {
    { name = "calc" },
    { name = "luasnip" },
    -- { name = "ultisnips" },
  }, {
    { name = "buffer" },
  }, {
    { name = "spell" },
  }),
  confirmation = {
    default_behavior = cmp.ConfirmBehavior.Insert,
    get_commit_characters = function(commit_characters)
      return commit_characters
    end,
  },
  event = {},
  experimental = { ghost_text = true },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
    docs = { auto_open = true },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}

-- Use buffer source for `/` and `?`
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(mappings),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(mappings),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
