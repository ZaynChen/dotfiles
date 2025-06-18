return {
  init_options = {
    typescript = {
      tsdk = vim.env.XDG_DATA_HOME .. '/npm/lib/node_modules/typescript/lib'
    }
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}
