return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    attach_to_untracked = true,
    current_line_blame  = true,
    on_attach           = function(bufnr)
      local gs = package.loaded.gitsigns

      local map = function(l, r, desc, opts)
        opts = opts or {}
        opts.buffer = bufnr
        require("util").map(l, r, desc, opts)
      end

      -- Navigation
      map("]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "[Git]Hunk next")

      map("[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "[Git]Hunk prev")

      -- Actions
      map("<leader>gs", gs.stage_hunk, "[Git]Hunk Stage")
      map("<leader>gr", gs.reset_hunk, "[Git]Hunk Reset")
      map("<leader>gs", function()
        gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, "[Git]Hunk Stage", { mode = "v" })
      map("<leader>gr", function()
        gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, "[Git]Hunk Reset", { mode = "v" })
      map("<leader>gu", gs.undo_stage_hunk, "[Git]Hunk Stage undo")
      map("<leader>gp", gs.preview_hunk_inline, "[Git]Hunk Preview inline")
      -- map("<leader>gS", gs.stage_buffer, "[Gitsigns]Buffer stage")
      -- map("<leader>gR", gs.reset_buffer, "[Gitsigns]Buffer reset")
      map("<leader>gb", function() gs.blame_line { full = true } end, "[Git]Blame line")
      map("<leader>gd", gs.diffthis, "[Git]Diffthis")
      map("<leader>gD", function() gs.diffthis("~") end, "[Git]Diffthis~")
      -- map("<leader>gtb", gs.toggle_current_line_blame, "[Gitsigns]Toggle line blame")
      -- map("<leader>gtd", gs.toggle_deleted, "[Gitsigns]Toggle deleted")

      -- Text object
      map("ih", gs.select_hunk, "[Git]Hunk Select", { mode = { "o", "x" } })
    end
  },
}
