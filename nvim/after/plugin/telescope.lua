local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ss', builtin.live_grep, {})
