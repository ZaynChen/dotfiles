vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    pattern = { "*" },
    callback = function() vim.api.nvim_command("checktime") end
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd([[ exe 'normal! g`"' ]])
        end
    end,
})

-- 退出插入模式时禁用输入法
-- 创建 Buf 时禁用输入法
-- 进入 Buf 时禁用输入法
-- 离开 Buf 时禁用输入法
vim.api.nvim_create_autocmd({ "InsertLeave", "BufCreate", "BufEnter", "BufLeave" }, {
    pattern = "*",
    callback = function() vim.cmd([[ :silent !fcitx5-remote -c ]]) end
})
-- vim.cmd([[
--     autocmd InsertLeave * :silent !fcitx5-remote -c
--     autocmd BufCreate *  :silent !fcitx5-remote -c
--     autocmd BufEnter *  :silent !fcitx5-remote -c
--     autocmd BufLeave *  :silent !fcitx5-remote -c
-- ]])

