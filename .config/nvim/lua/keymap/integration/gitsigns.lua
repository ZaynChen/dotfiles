local M = {}

M.on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local map = function(l, r, desc, opts)
    opts = opts or {}
    opts.buffer = bufnr
    require("keymap.util").map(l, r, desc, opts)
  end

  -- Navigation
  map("<leader>gj", function()
    if vim.wo.diff then return "]c" end
    vim.schedule(gs.next_hunk)
    return "<Ignore>"
  end, "[Gitsigns]Hunk next", { expr = true })

  map("<leader>gk", function()
    if vim.wo.diff then return "[c" end
    vim.schedule(gs.prev_hunk)
    return "<Ignore>"
  end, "[Gitsigns]Hunk prev", { expr = true, })

  -- Actions
  map("<leader>gs", ":Gitsigns stage_hunk<CR>", "[Gitsigns]Hunk stage", { mode = { "n", "v" } })
  map("<leader>gr", ":Gitsigns reset_hunk<CR>", "[Gitsigns]Hunk reset", { mode = { "n", "v" } })
  map("<leader>gu", function() gs.undo_stage_hunk() end, "[Gitsigns]Hunk stage undo")
  map("<leader>gp", function() gs.preview_hunk() end, "[Gitsigns]Hunk preview")
  map("<leader>gS", function() gs.stage_buffer() end, "[Gitsigns]Buffer stage")
  map("<leader>gR", function() gs.reset_buffer() end, "[Gitsigns]Buffer reset")
  map("<leader>gb", function() gs.blame_line { full = true } end, "[Gitsigns]Blame line")
  map("<leader>gd", function() gs.diffthis() end, "[Gitsigns]Diffthis")
  map("<leader>gD", function() gs.diffthis("~") end, "[Gitsigns]Diffthis~")
  map("<leader>gtb", function() gs.toggle_current_line_blame() end, "[Gitsigns]Toggle line blame")
  map("<leader>gtd", function() gs.toggle_deleted() end, "[Gitsigns]Toggle deleted")

  -- Text object
  map("ih", ":<C-U>Gitsigns select_hunk<CR>", "[Gitsigns]Hunk select", { mode = { "o", "x" } })
end

return M
