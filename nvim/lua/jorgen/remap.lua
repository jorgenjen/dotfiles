vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- can be used to quit the current buffer
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true}) -- Control backspace - Deletes previous word as expected

-- moves all selected lines up or down in visual mode on shift + j/k
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move selected lines up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines down

-- This makes it so that when you press J it will not move the cursor towazrds the end
vim.keymap.set("n", "J", "mzJ`z") -- Append line below to current line

-- Keep cursor centered when scrolling and searching
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up half page and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down half page and center cursor
vim.keymap.set("n", "n", "nzzzv") -- Search forward and center cursor
vim.keymap.set("n", "N", "Nzzzv") -- Search backward and center cursor

-- paste over selected text and don't write the overwritten text to the register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y") -- copy line to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y") -- copy visual selection to system clipboard
vim.keymap.set("n", "<leader>Y", "\"+Y") 

