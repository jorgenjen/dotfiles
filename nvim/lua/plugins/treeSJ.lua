return {
  'Wansmer/treesj',
  -- keys = { '<space>m', '<space>j', '<space>s' },
  -- dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup({--[[ your config ]]})
    vim.keymap.set("n", "<leader>s", require('treesj').toggle, {desc = "Toggle splitjoin of lists"})
  end,
}
