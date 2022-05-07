local opts = { clear = true }
local reload_buf = vim.api.nvim_create_augroup("reload_buf", opts)
local restore_cursor = vim.api.nvim_create_augroup("restore_cursor", opts)
local format = vim.api.nvim_create_augroup("format", opts)
local im_switch = vim.api.nvim_create_augroup("im_switch", opts)
local reload_snippets = vim.api.nvim_create_augroup("reload_snippets", opts)
local diagnostic = vim.api.nvim_create_augroup("diagnostic", opts)

-- autoread reload
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = reload_buf,
  pattern = { "*" },
  callback = function() vim.api.nvim_command("checktime") end
})

vim.api.nvim_create_autocmd("BufRead", {
  group = restore_cursor,
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd([[ exe 'normal! g`"' ]])
    end
  end,
})

-- FormatOnSave
vim.api.nvim_create_autocmd("BufWritePre", {
  group = format,
  pattern = "<buffer>",
  callback = vim.lsp.buf.formatting_sync
})

-- 退出插入模式时禁用输入法
-- 创建 Buf 时禁用输入法
-- 进入 Buf 时禁用输入法
-- 离开 Buf 时禁用输入法
vim.api.nvim_create_autocmd({ "InsertLeave", "BufCreate", "BufEnter", "BufLeave" }, {
  group = im_switch,
  pattern = "*",
  callback = function() vim.cmd([[ :silent !fcitx5-remote -c ]]) end
})

local cmp_nvim_ultisnips = require("cmp_nvim_ultisnips")
vim.api.nvim_create_autocmd("BufWritePost", {
  group = reload_snippets,
  pattern = { "*.snippets" },
  callback = function() cmp_nvim_ultisnips.reload_snippets() end
})

-- Show diagnostic popup on cursor hover
vim.api.nvim_create_autocmd("CursorHold", {
  group = diagnostic,
  pattern = "*",
  callback = function() vim.diagnostic.open_float(nil, { focusable = false }) end
})
