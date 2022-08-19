local api = vim.api

local opts = { clear = true }
local reload_buf = api.nvim_create_augroup("reload_buf", opts)
local restore_cursor = api.nvim_create_augroup("restore_cursor", opts)
local im_switch = api.nvim_create_augroup("im_switch", opts)
local reload_snippets = api.nvim_create_augroup("reload_snippets", opts)

api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = reload_buf,
  pattern = { "*" },
  desc = "Reload buffer",
  callback = function() api.nvim_command("checktime") end
})

api.nvim_create_autocmd("BufRead", {
  group = restore_cursor,
  pattern = "*",
  desc = "Restore cursor",
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd([[ exe 'normal! g`"' ]])
    end
  end,
})

-- 退出插入模式时禁用输入法
-- 创建 Buf 时禁用输入法
-- 进入 Buf 时禁用输入法
--离开 Buf 时禁用输入法
api.nvim_create_autocmd({ "InsertLeave", "BufCreate", "BufEnter", "BufLeave" }, {
  group = im_switch,
  pattern = "*",
  desc = "Auto switch im",
  callback = function() vim.cmd([[ :silent !fcitx5-remote -c ]]) end
})

local cmp_nvim_ultisnips = require("cmp_nvim_ultisnips")
api.nvim_create_autocmd("BufWritePost", {
  group = reload_snippets,
  pattern = { "*.snippets" },
  desc = "Reload Snippets",
  callback = function() cmp_nvim_ultisnips.reload_snippets() end,
})
