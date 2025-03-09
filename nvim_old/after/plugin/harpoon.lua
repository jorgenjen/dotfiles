local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file) -- adds file to harpoon
vim.keymap.set("n", "<leader><Tab>", ui.toggle_quick_menu) -- shows harpoon menu


vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end) -- go to mark 1
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end) -- go to mark 2
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end) -- go to mark 3
vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end) -- go to mark 4
