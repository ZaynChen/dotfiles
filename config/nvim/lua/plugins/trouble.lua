local function trouble(mode)
  return function() require("trouble").toggle(mode) end
end

return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = {
    auto_jump = true, -- auto jump to the item when there's only one
  },
  keys = {
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
    { "<leader>ld", trouble("diagnostics"), desc = "[Trouble]diagnostics" },
    { "<leader>lq", trouble("quickfix"),    desc = "[Trouble]quickfix" },
    { "<leader>ll", trouble("loclist"),     desc = "[Trouble]loclist" },
    { "<leader>lo", trouble("todo"),        desc = "[Trouble]todo" },
    { "<leader>lx", trouble("lsp"),         desc = "[Trouble]lsp" },
  }
}
