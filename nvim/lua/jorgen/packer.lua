-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- My old theme - I don't use it anymore
    --use({
        --'folke/tokyonight.nvim',
        --as = "tokyonight",
        --config = function()
        --        vim.cmd('colorscheme tokyonight')
      --  end
    --})

    -- Onddark theme
    use({
        'navarasu/onedark.nvim',
        as = "onedark",
        config = function()
                vim.cmd('colorscheme onedark')
        end
    })

    -- Treesitter - is used for better and faster syntax highlighting
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Harpoon - is used for quick navigation between files
    use('ThePrimeagen/harpoon')

    -- Undotree - is used for better undo history with branches
    use('mbbill/undotree')

    -- Block comment and uncommenting 
    use('terrortylor/nvim-comment')

   
    -- Github copilot the default less efficient implementation for neovim
    use('github/copilot.vim')


    -- ## TODO ## get copilot to work with lua nad use cmd to get it's suggestions in there
    -- Copilot that using lua for efficiency and easy plugin integration
    -- use {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({})
    --     end,
    -- }







    -- uncomment and fix copilot and cmp with LSP when you have time
    -- ################################################# -- 

    -- -- cmp plugins - is used for autocompletion
    -- use {
    --     'hrsh7th/nvim-cmp',         -- for completion 
    --     'hrsh7th/cmp-buffer',       -- buffer completions
    --     'hrsh7th/cmp-path',         -- path completions
    --     'hrsh7th/cmp-cmdline',      -- cmdline completions
    --     'saadparwaiz1/cmp_luasnip', -- snippet completions
    --     'hrsh7th/cmp-nvim-lsp'      -- LSP completions for nvim cmp
    -- }
    --
    -- -- snippets - the snippets that the autocompletion(cmp) needs
    -- use {
    --     'L3MON4D3/LuaSnip',             -- snippet engine
    --     'rafamadriz/friendly-snippets'  -- Many snippets for many languages
    -- }
    --
    -- -- LSP
    -- use {
    --     'neovim/nvim-lspconfig',            -- default LSP nvim setup
    --     'williamboman/mason.nvim',          -- simple to use language server installer
    --     'williamboman/mason-lspconfig.nvim' -- closes some gaps between the two above
    -- }

    -- ################################################### --








 --   use ({
     --   "hrsh7th/nvim-cmp",
   --     config = [[require('config.cmp')]], -- may very based on config
 --       requires = {
           -- "hrsh7th/cmp-buffer",
          --  "hrsh7th/cmp-nvim-lsp",
           -- "hrsh7th/cmp-path",
         --   "hrsh7th/cmp-nvim-lua",
       --     "L3MON4D3/LuaSnip", -- may very based on config

    --    }
  --  })




    -- Copilot install run on lua for efficiency and compatability with next plugin
 --   use {
  --      "zbirenbaum/copilot.lua",
--        cmd = "Copilot",
--        event = "InsertEnter",
--        config = function()
--            require("copilot").setup({})
--        end,
 --   }

    
--    use {
--        "zbirenbaum/copilot-cmp",
--        after = { "copilot.lua" },
--        config = function ()
 --           require("copilot_cmp").setup()
--       end

--    }


    -- Mason - is used to install LSP servers
    --use "williamboman/mason.nvim"

    -- LSP - is used for autocompletion



--    this is a plugin for git (I don't use it, but might want to in the future)
--    use('tpope/vim-fugitive') 
end)

-- After every :PackerSync, you need to run :lua ColorMyPencils() to get transparent background
