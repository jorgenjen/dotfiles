return {
  'Wansmer/treesj',
  -- keys = { '<space>m', '<space>j', '<space>s' },
  -- dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup({
      ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
      use_default_keymaps = false,
    })
    vim.keymap.set("n", "<leader>m", require('treesj').toggle, {desc = "Toggle splitjoin of lists"})
  end,
}
