return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    require("null-ls").setup {
      cmd = { "nvim" },
      debounce = 250,
      debug = false,
      default_timeout = 5000,
      diagnostics_format = "#{m}",
      fallback_severity = vim.diagnostic.severity.ERROR,
      -- @usage set logging level
      -- possible values: { "off", "error", "warn", "info", "debug", "trace" }
      log_level = "warn",
      -- format string for vim.notify messages
      notify_format = "[null-ls] %s",
      -- on_attach = require("plugins_back.lsp").on_attach,
      on_init = nil,
      on_exit = nil,
      -- root_dir = u.root_pattern(".null-ls-root", "Makefile", ".git"),
      sources = {
        require("null-ls").builtins.formatting.black.with({
          filetypes = { 'py' },
        }),
        -- null_ls.builtins.diagnostics.eslint.with({
        -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
        -- })
      },
      update_in_insert = false,
    }
  end
}
