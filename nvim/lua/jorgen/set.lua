--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.smartindent = true

vim.opt.wrap = false

-- These are for an extra column that can be popluated by other plugins but I don't have any at this time
-- Could be used for LSP diagnostics, git signs, etc.
-- vim.opt.colorcolumn = "80"

-- Sets the signcolumn to be on at all times such that it does not move when gitsigns adds symbols to it
vim.opt.signcolumn = "yes:1" 


-- turn off auto comment when going newline in insert mode
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
