return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- harpoon keybindings
        vim.keymap.set("n", "<leader>a", mark.add_file) -- adds file to harpoon
        vim.keymap.set("n", "<leader><Tab>", ui.toggle_quick_menu) -- shows harpoon menu

       vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end) -- go to mark 1
       vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end) -- go to mark 2
       vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end) -- go to mark 3
       vim.keymap.set("n", "<C-h>", function() ui.nav_file(4) end) -- go to mark 4
       vim.keymap.set("n", "<C-y>", function() ui.nav_file(5) end) -- go to mark 5
       vim.keymap.set("n", "<C-i>", function() ui.nav_file(6) end) -- go to mark 6

       -- does not workk as you cant bind to ; 
       -- vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end) -- go to mark 4
    end
}
