return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    signs                        = {
      add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
      interval = 1000,
      follow_files = true
    },
    attach_to_untracked          = true,
    current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil, -- Use default
    max_file_length              = 40000,
    preview_config               = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    yadm                         = {
      enable = false
    },
    on_attach                    = function(bufnr)
      local gs = package.loaded.gitsigns

      local map = function(l, r, desc, opts)
        opts = opts or {}
        opts.buffer = bufnr
        require("util").map(l, r, desc, opts)
      end

      -- Navigation
      map("]h", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(gs.next_hunk)
        return "<Ignore>"
      end, "[Git]Hunk next", { expr = true })

      map("[h", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(gs.prev_hunk)
        return "<Ignore>"
      end, "[Git]Hunk prev", { expr = true, })

      -- Actions
      map("<leader>gs", ":Gitsigns stage_hunk<CR>", "[Git]Hunk Stage", { mode = { "n", "v" } })
      map("<leader>gr", ":Gitsigns reset_hunk<CR>", "[Git]Hunk Reset", { mode = { "n", "v" } })
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
      map("ih", ":<C-U>Gitsigns select_hunk<CR>", "[Git]Hunk Select", { mode = { "o", "x" } })
    end
  },
}
