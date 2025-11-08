local kind_hl = function(ctx)
  if vim.list_contains({ "path" }, ctx.source_id) then
    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
    return dev_icon and dev_hl or "Special"
  end

  return "Special"
end

return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "fang2hou/blink-copilot",
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      opts = {
        panel = { enabled = false },
        suggestion = { enabled = false },
        disable_limit_reached_message = true,
      },
    },
  },
  opts = {
    keymap = {
      preset = "none",
      ["<C-E>"] = { "hide", "fallback" },
      ["<C-Y>"] = { "select_and_accept", "fallback" },

      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

      ["<C-B>"] = { "scroll_documentation_up", "fallback" },
      ["<C-F>"] = { "scroll_documentation_down", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-K>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-J>"] = { "select_next", "fallback_to_mappings" },

      -- ["<C-SPACE>"] = { "show", "show_documentation", "hide_documentation" },
      -- ["<M-m>"] = { "show_signature", "hide_signature", "fallback" },
    },
    appearance = {
      kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",

        Field = "󰜢",
        Variable = "󰀫",
        Property = "󰜢",

        Class = "󰠱",
        Interface = "",
        Struct = "󰙅",
        Module = "",

        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        EnumMember = "",

        Keyword = "󰌋",
        Constant = "󰏿",

        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      },
    },
    signature = {
      -- alternative "ray-x/lsp_signature.nvim"
      enabled = false,
      trigger = {
        enabled = true,
        show_on_keyword = true,
        blocked_trigger_characters = {},
        blocked_retrigger_characters = {},
        show_on_trigger_character = true,
        show_on_insert = true,
        show_on_insert_on_trigger_character = true,
        show_on_accept = true,
        show_on_accept_on_trigger_character = true,
      },
      window = {
        min_width = 1,
        max_width = 100,
        max_height = 12,
        border = "rounded",
        winblend = 0,
        winhighlight = "BlinkCmpSignatureHelpActiveParameter:Search",
        scrollbar = false,
        direction_priority = { "n", "s" },
        treesitter_highlighting = true,
        show_documentation = true,
      },
    },
    completion = {
      documentation = { auto_show = true },
      ghost_text = {
        enabled = true,
        show_without_selection = true,
      },
      list = {
        selection = {
          preselect = false,
        },
      },
      menu = {
        border = "rounded",
        -- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        draw = {
          padding = { 0, 1 }, -- padding only on right side
          treesitter = { "lsp" },
          components = {
            label = {
              highlight = function(ctx)
                -- label and label details
                local label = ctx.label
                local highlights = {
                  { 0, #label, group = "BlinkCmpLabel" },
                }

                if ctx.label_detail then
                  table.insert(highlights, { #label, #label + #ctx.label_detail, group = "BlinkCmpLabelDetail" })
                end

                if ctx.deprecated then
                  vim.list_extend(highlights, {
                    { 0, #label, group = "DiagnosticDeprecated" },
                    { 0, #label, group = "Comment" }
                  })
                else
                  if vim.list_contains(ctx.self.treesitter, ctx.source_id) then
                    vim.list_extend(highlights, require("blink.cmp.completion.windows.render.treesitter").highlight(ctx))
                  elseif vim.list_contains({ "path" }, ctx.source_id) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      table.insert(highlights, { 0, #label, group = dev_hl })
                    end
                  end
                end

                -- characters matched on the label by the fuzzy matcher
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = "PmenuMatchSel" }) -- "BlinkCmpLabelMatch"
                end
                return highlights
              end,
            },
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.list_contains({ "path" }, ctx.source_id) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                end

                return icon .. ctx.icon_gap
              end,
              highlight = kind_hl,
            },
            kind = {
              highlight = kind_hl,
            }
          },
          columns = {
            { "label",      "label_description", gap = 1 },
            { "kind_icon",  "kind",              gap = 1 },
            { "source_name" }
          },
        }
      }
    },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "buffer", "snippets", "copilot" },
      providers = {
        lsp = {
          name = "[LSP]",
          fallbacks = {}
        },
        path = {
          name = "[Path]"
        },
        snippets = {
          name = "[Snippets]"
        },
        buffer = {
          name = "[Buffer]"
        },
        cmdline = {
          name = "[Cmdline]"
        },
        copilot = {
          name = "[Copilot]",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      -- max_typos = 0, -- 0 for fzf
      sorts = {
        "exact",
        "score",
        "sort_text",
      },
    },
    cmdline = {
      enabled = true,
      keymap = { preset = "inherit" },
      sources = { "buffer", "cmdline" },

      completion = {
        list = {
          selection = {
            preselect = false,
          },
        },
        menu = { auto_show = true },
      }
    }
  },
  opts_extend = { "sources.default" },
}
