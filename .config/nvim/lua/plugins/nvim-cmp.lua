-- Setup nvim-cmp
local cmp = require('cmp')
local lspkind = require("lspkind")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

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
        ultisnips = "[UltiSnips]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
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
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = cmp.mapping(function(fallback) cmp_ultisnips_mappings.expand_or_jump_forwards(fallback) end,
      { "i", "c", }),
    ["<S-Tab>"] = cmp.mapping(function(fallback) cmp_ultisnips_mappings.jump_backwards(fallback) end, { "i", "c" }),
    ['<CR>'] = {
      c = cmp.confirm({ select = true }),
      i = cmp.confirm({ select = false })
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
    { name = "ultisnips" },
  }, {
    { name = "buffer" },
  }, {
    { name = "spell" },
  }),
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use buffer source for `?`.
cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
