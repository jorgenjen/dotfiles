return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- harpoon keybindings
        vim.keymap.set("n", "<leader>a", mark.add_file, {desc = "Add file to current harpoon"}) -- adds file to harpoon
        vim.keymap.set("n", "<leader><Tab>", ui.toggle_quick_menu, {desc = "Show harpoon mark overview"}) -- shows harpoon menu

       vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, {desc = "go to harpoon mark 1"})
       vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, {desc = "go to harpoon mark 2"})
       vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, {desc = "go to harpoon mark 3"})
       vim.keymap.set("n", "<C-h>", function() ui.nav_file(4) end, {desc = "go to harpoon mark 4"})
       vim.keymap.set("n", "<C-y>", function() ui.nav_file(5) end, {desc = "go to harpoon mark 5"})
       vim.keymap.set("n", "<C-i>", function() ui.nav_file(6) end, {desc = "go to harpoon mark 6"})

       -- does not workk as you cant bind to ; 
       -- vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end) -- go to mark 4
    end
}
