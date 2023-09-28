return {
    {
        'navarasu/onedark.nvim',
        as = "onedark",

        init = function ()
            vim.cmd('colorscheme onedark')
        end,

        opts = {
            transparent = true,
            style = 'darker',
        }
      --  config = function()
      --      --vim.cmd('colorscheme onedark')
      --      require("onedark").setup {
      --          transparent = true,
      --          style= 'darker',
      --      }
      --      require("onedark").load()
      --  end
    } 
}
