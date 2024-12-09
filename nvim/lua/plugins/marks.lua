return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require('marks').setup {
      -- Your marks.nvim setup options here
    }

    -- -- Override the MarkSignHL highlight group
    -- vim.api.nvim_create_autocmd("ColorScheme", {
    --   callback = function()
    --     vim.api.nvim_set_hl(0, "MarkSignHL", { link = "Comment" })
    --   end,
    -- })

  end
}
