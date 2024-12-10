vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex) -- can be used to quit the current buffer
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true}) -- Control backspace - Deletes previous word as expected

-- moves all selected lines up or down in visual mode on shift + j/k 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {silent = true, desc="Move selected lines up"}) -- Move selected lines up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {silent = true, desc="Move selected lines down"}) -- Move selected lines down



-- This makes it so that when you press J it will not move the cursor towazrds the end
-- vim.keymap.set("n", "J", "mzJ`z") -- Append line below to current line

-- Keep cursor centered when scrolling and searching
-- vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up half page and center cursor
-- vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down half page and center cursor
vim.keymap.set("n", "n", "nzzzv") -- Search forward and center cursor
vim.keymap.set("n", "N", "Nzzzv") -- Search backward and center cursor

-- paste over selected text and don't write the overwritten text to the register
vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "Paste over seleted text and don't write to register"})

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+Y', {noremap=true, desc= "Copy to system clipboard"}) -- copy line to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', {noremap=true, desc="Copy to system clipboard"}) -- copy visual selection to system clipboard
-- vim.keymap.set("n", "<leader>Y", "\"+y") -- Don't see the point of this one


vim.keymap.set("n", "<leader>d", '"_dd', {noremap=true, desc="Delete without writing to register"} ) -- delete line and don't write to register
vim.keymap.set("v", "<leader>d", '"_dd', {noremap=true, desc="Delete without writing to register"}) -- delete visual selection and don't write to register

vim.keymap.set("n", "<C-p>", '"+P', {noremap=true, desc="Paste from system clipboard"}) -- paste from system clipboard
vim.keymap.set("v", "<C-p>", '<leader>d"+Pa<CR>', {noremap=true, desc="Paste from system clipboard"}) -- paste from system clipboard


-- replace the word under the cursor with the word you type for all those instances in the file
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {desc = "Search and replace"})
vim.keymap.set("v", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {desc = "Search and replace"})





-- Remap for saving with control + s
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })


-- comment out lines -- Set in plugins/nvim-plugins.lua
--vim.keymap.set("n", "<leader>l", ":CommentToggle<CR>")
--vim.keymap.set("v", "<leader>l", ":CommentToggle<CR>")

