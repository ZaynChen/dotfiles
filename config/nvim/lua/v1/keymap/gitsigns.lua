local M = {}

M.on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local map = function(l, r, desc, opts)
    opts = opts or {}
    opts.buffer = bufnr
    require("v1.keymap.util").map(l, r, desc, opts)
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
  map("<leader>gu", gs.undo_stage_hunk, "[Gitsigns]Hunk stage undo")
  map("<leader>gp", gs.preview_hunk, "[Gitsigns]Hunk preview")
  map("<leader>gS", gs.stage_buffer, "[Gitsigns]Buffer stage")
  map("<leader>gR", gs.reset_buffer, "[Gitsigns]Buffer reset")
  map("<leader>gb", function() gs.blame_line { full = true } end, "[Gitsigns]Blame line")
  map("<leader>gd", gs.diffthis, "[Gitsigns]Diffthis")
  map("<leader>gD", function() gs.diffthis("~") end, "[Gitsigns]Diffthis~")
  map("<leader>gtb", gs.toggle_current_line_blame, "[Gitsigns]Toggle line blame")
  map("<leader>gtd", gs.toggle_deleted, "[Gitsigns]Toggle deleted")

  -- Text object
  map("ih", ":<C-U>Gitsigns select_hunk<CR>", "[Gitsigns]Hunk select", { mode = { "o", "x" } })
end

return M
