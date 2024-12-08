return {
    'nvim-telescope/telescope.nvim', -- tag = '0.1.3',
    branch = "0.1.x",
    event = "BufWinEnter",
    dependencies = {
        'nvim-lua/plenary.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}, -- for better performance 
        'nvim-tree/nvim-web-devicons', -- for icons in telescope -- file icons
    },

    config = function ()
        -- File search and swapping -- using builtin functions to telescope
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Fuzzy file search"})
        vim.keymap.set('n', '<leader>gg', builtin.git_files, {desc = "Fuzzy file search for all tracked files in the git repo"})
        vim.keymap.set('n', '<leader>ss', builtin.live_grep, {desc = "Search for files based on content in the file"})
        vim.keymap.set('n', '<leader>fs', builtin.grep_string, {desc = "Find word under cursor in current working directory"})


        -- Setup for LSP utilizing telescope
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        -- Keybindings in insert mode for this plugin
                        ["<C-k>"] = actions.move_selection_previous, -- move to previous result
                        ["C-j>"] = actions.move_selection_next,      -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })

        -- For improved telescope sorting performance
        telescope.load_extension("fzf");



    end
}
