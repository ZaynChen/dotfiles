-- Setup nvim-cmp
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local lspkind_ok, lspkind = pcall(require, "lspkind")
local format = nil
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
      ultisnips = "[Snips]",
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

local snips_ok, snips = pcall(require, "cmp_nvim_ultisnips")
if snips_ok then
  snips.setup {} -- redundant; setup only required when customization
  local snips_mappings = require("cmp_nvim_ultisnips.mappings")
  mappings = vim.tbl_deep_extend("force", mappings, {
    ["<Tab>"] = cmp.mapping(function(fallback) snips_mappings.expand_or_jump_forwards(fallback) end,
      { "i", "s", "c" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback) snips_mappings.jump_backwards(fallback) end, { "i", "s", "c" }),
  })
end

cmp.setup {
  snippet = {
    expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end
  },
  experimental = {
    ghost_text = true,
  },
  -- rust lsp https://github.com/hrsh7th/cmp-nvim-lsp/issues/29
  preselect = cmp.PreselectMode.None,
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = format
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert(mappings),
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
    { name = "ultisnips" },
  }, {
    { name = "buffer" },
  }, {
    { name = "spell" },
  }),
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(mappings),
  sources = {
    { name = 'buffer' }
  }
})

-- Use buffer source for `?`.
cmp.setup.cmdline('?', {
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
