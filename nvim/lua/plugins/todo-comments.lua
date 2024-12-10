-- PERF:  does not look like it should
-- TODO:
-- HACK:
-- NOTE:
-- FIX:
-- WARNING:
-- BUG:

-- Plugin does what you can see above!

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  config = function (opts)
    require('todo-comments').setup()
    vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", {silent = true, desc="Fuzzy search through todo's in work directory"})
  end
}
