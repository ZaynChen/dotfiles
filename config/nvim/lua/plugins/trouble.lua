function trouble(mode)
  return function()
    require("trouble").toggle(mode)
  end
end

return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = {
    cmd_options = {},
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    action_keys = {
      -- key mappings for actions in the trouble list
      close = "q",                                             -- close the list
      cancel = "<esc>",                                        -- cancel the preview and get back to your last window / buffer / cursor
      refresh = "r",                                           -- manually refresh
      jump = { "<cr>", "<tab>" },                              -- jump to the diagnostic or open / close folds
      open_split = { "<c-x>" },                                -- open buffer in new split
      open_vsplit = { "<c-v>" },                               -- open buffer in new vsplit
      open_tab = { "<c-t>" },                                  -- open buffer in new tab
      jump_close = { "o" },                                    -- jump to the diagnostic and close the list
      toggle_mode = "m",                                       -- toggle between "workspace" and "document" mode
      toggle_preview = "P",                                    -- toggle auto_preview
      hover = "K",                                             -- opens a small popup with the full multiline message
      preview = "p",                                           -- preview the diagnostic location
      close_folds = { "zM", "zm" },                            -- close all folds
      open_folds = { "zR", "zr" },                             -- open all folds
      toggle_fold = { "zA", "za" },                            -- toggle fold of current file
      previous = "k",                                          -- preview item
      next = "j",                                              -- next item
    },
    indent_lines = true,                                       -- add an indent guide below the fold icons
    auto_open = false,                                         -- automatically open the list when you have diagnostics
    auto_close = false,                                        -- automatically close the list when you have no diagnostics
    auto_preview = true,                                       -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false,                                         -- automatically fold a file trouble list at creation
    auto_jump = { "lsp_definitions", "lsp_type_definitions" }, -- for the given modes, automatically jump if there is only a single result
    -- signs = {
    --   -- icons / text used for a diagnostic
    --   error = "",
    --   warning = "",
    --   hint = "",
    --   information = "",
    --   other = "﫠",
    -- },
    use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
  },
  keys = {
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
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
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
    { "<leader>lr", trouble("lsp_references"),        desc = "[Trouble]lsp_references" },
    { "<leader>li", trouble("lsp_implementations"),   desc = "[Trouble]lsp_implementations" },
    { "<leader>ld", trouble("document_diagnostics"),  desc = "[Trouble]document_diagnostics" },
    { "<leader>lD", trouble("workspace_diagnostics"), desc = "[Trouble]workspace_diagnostics" },
    { "<leader>lq", trouble("quickfix"),              desc = "[Trouble]quickfix" },
    { "<leader>ll", trouble("loclist"),               desc = "[Trouble]loclist" },
    { "<leader>lo", trouble("todo"),                  desc = "[Trouble]todo" },
    { "<leader>lx", trouble(),                        desc = "[Trouble]toggle" },
  }
}
--

-- -- map("<leader>x", function() trouble.open() end, "[Trouble]Toggle previous")
