require('gitsigns').setup {
  signs                        = {
    add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
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

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(gs.next_hunk)
      return '<Ignore>'
    end, { expr = true, desc = "[Gitsigns]Hunk next" })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(gs.prev_hunk)
      return '<Ignore>'
    end, { expr = true, desc = "[Gitsigns]Hunk prev" })

    -- Actions
    map({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', { desc = "[Gitsigns]Hunk stage " })
    map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = "[Gitsigns]Hunk reset" })
    map('n', '<leader>gu', function() gs.undo_stage_hunk() end, { desc = "[Gitsigns]Hunk stage undo" })
    map('n', '<leader>gp', function() gs.preview_hunk() end, { desc = "[Gitsigns]Hunk preview" })
    map('n', '<leader>gS', function() gs.stage_buffer() end, { desc = "[Gitsigns]Buffer stage" })
    map('n', '<leader>gR', function() gs.reset_buffer() end, { desc = "[Gitsigns]Buffer reset" })
    map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "[Gitsigns]Blame line" })
    map('n', '<leader>gd', function() gs.diffthis() end, { desc = "[Gitsigns]Diffthis" })
    map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "[Gitsigns]Diffthis~" })
    map('n', '<leader>gtb', function() gs.toggle_current_line_blame() end, { desc = "[Gitsigns]Toggle line blame" })
    map('n', '<leader>gtd', function() gs.toggle_deleted() end, { desc = "[Gitsigns]Toggle deleted" })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "[Gitsigns]Hunk select" })
  end
}
