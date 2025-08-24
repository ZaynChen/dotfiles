return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-omni",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "kdheepak/cmp-latex-symbols",
    "f3fora/cmp-spell",
    "honza/vim-snippets",
    "saadparwaiz1/cmp_luasnip",
    -- "ray-x/cmp-treesitter" -- to much content
    -- "jsfaint/gen_tags.vim"
    -- "c0r73x/neotags.lua"
    -- "rcarriga/cmp-dap"
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        if vim.fn.has "win32" == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
    },
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      opts = {
        panel = { enabled = false },
        suggestion = { enabled = false },
        disable_limit_reached_message = true,
      },
    }
  },
  config = function()
    local format = require("lspkind").cmp_format {
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
        Copilot = "[Copilot]",
        luasnip = "[Snips]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Tex]",
        treesitter = "[TS]",
        path = "[Path]",
        cmdline = "[Cmd]",
        spell = "[Spell]",
        calc = "[Calc]",
        crates = "[Crates]",
      },

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(_, vim_item)
        return vim_item
      end
    }

    local snips = require("luasnip")
    local cmp = require("cmp")
    require("luasnip.loaders.from_snipmate").lazy_load()

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    cmp.setup {
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
        filtering_context_budget = 3,
        confirm_resolve_timeout = 80,
        async_budget = 1,
        max_view_entries = 200,
      },
      -- rust lsp https://github.com/hrsh7th/cmp-nvim-lsp/issues/29
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
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
        end, { "i", "c" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif snips.jumpable(-1) then
            snips.jump(-1)
          else
            fallback()
          end
        end, { "i", "c" }),
        ["C-j"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "c" }),
        ["C-k"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "c" }),
      }),
      snippet = {
        expand = function(args) snips.lsp_expand(args.body) end,
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
        disallow_symbol_nonprefix_matching = true,
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          cmp.config.compare.offset,
          -- cmp.config.compare.scopes,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
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
        { name = "copilot" },
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
        entries = {
          name = "custom",
          selection_order = "near_cursor",
          follow_cursor = false,
        },
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
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'buffer' },
        { name = 'latex_symbols' },
      })
    })

    -- Use cmdline & path source for ':'.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }, {
        { name = 'latex_symbols' },
      })
    })
  end
}
