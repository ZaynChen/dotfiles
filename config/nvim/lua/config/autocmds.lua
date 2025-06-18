local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = augroup("checktime"),
  desc = "Reload buffer",
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  desc = "Restore cursor",
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  desc = "Highlight Yank",
  callback = function()
    vim.hl.on_yank()
  end
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  desc = "Resize splits",
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end
})

-- 退出插入模式时禁用输入法
-- 创建 Buf 时禁用输入法
-- 进入 Buf 时禁用输入法
-- 离开 Buf 时禁用输入法
vim.api.nvim_create_autocmd({ "InsertLeave", "BufCreate", "BufEnter", "BufLeave" }, {
  group = augroup("im_switch"),
  pattern = "*",
  desc = "Auto switch im",
  callback = function() vim.cmd([[ :silent !fcitx5-remote -c ]]) end
})
