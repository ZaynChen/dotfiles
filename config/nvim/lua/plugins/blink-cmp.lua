local kind_hl = function(ctx)
  local hl = "Special"

  if vim.list_contains({ "path" }, ctx.source_id) then
    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
    -- "~/Repo/learn/rust/lightdm-webkit6-greeter"
    if dev_icon then
      hl = dev_hl
    end
  end

  return hl
end

return {
  'saghen/blink.cmp',
  version = '1.*',
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
      preset = "default",

      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },

      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-j>"] = { "select_next", "fallback_to_mappings" },

      ["<M-k>"] = { "show_signature", "hide_signature", "fallback" }
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
    -- signature = { enabled = false },
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
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
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
                  table.insert(highlights, { #label, #label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
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
          name = "[LSP]"
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
      max_typos = 0,
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
