--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.smartindent = true

vim.opt.wrap = false

-- These are for an extra column that can be popluated by other plugins but I don't have any at this time
-- Could be used for LSP diagnostics, git signs, etc.
-- vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "80"

-- turn off auto comment when going newline in insert mode
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")



































































