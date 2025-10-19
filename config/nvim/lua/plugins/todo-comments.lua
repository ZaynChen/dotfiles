return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "[Todo]Next" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "[Todo]Prev" },
  },
  opts = {}
}

-- FIX:
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:
