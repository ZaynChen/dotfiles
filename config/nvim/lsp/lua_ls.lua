return {
  settings = {
    Lua = {
      runtime = {
        version = "Lua 5.5",
        path = {
          "?.lua",
          "?/init.lua",
          vim.fn.expand("~/.local/share/luarocks/lua/5.5/?.lua"),
          vim.fn.expand("~/.local/share/luarocks/lua/5.5/?/init.lua"),
          "/usr/share/lua/5.5/?.lua",
          "/usr/share/lua/5.5/?/init.lua"
        }
      },
      workspace = {
        library = {
          vim.fn.expand("~/.local/share/luarocks/lua/5.5"),
          "/usr/share/lua/5.5",
        }
      },
      format = {
        enable = true,
        -- defaultConfig = {
        --   indent_style = "space",
        --   indent_size = "2",
        -- }
      },
      completion = {
        keywordSnippet = "Replace", -- Disable,Replace,Both
        -- callSnippet = "Replace",
      },
      diagnostics = {
        enable = true,
        globals = { "vim", "hs", "it", "describe", "before_each", "after_each" },
        disable = { "lowercase-global" },
        -- neededFileStatus = {
        --   ["codestyle-check"] = "Any",
        -- }
      },
      hint = {
        enable = true,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      }
    },
  }
}
