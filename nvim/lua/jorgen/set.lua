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

-- vim.opt.shell = "/bin/zsh" -- HAve not configured zsh in the container
vim.opt.shell = "/bin/bash" -- usng bash as zsh not set up

vim.opt.termguicolors = true

vim.opt.scrolloff = 6

vim.opt.smartindent = true

vim.opt.wrap = false

-- to get higlihgted current line - like vsCode
vim.opt.cursorline = true

-- These are for an extra column that can be popluated by other plugins but I don't have any at this time
-- Could be used for LSP diagnostics, git signs, etc.
-- vim.opt.colorcolumn = "80"

-- Sets the signcolumn to be on at all times such that it does not move when gitsigns adds symbols to it
vim.opt.signcolumn = "yes:2"

-- turn off auto comment when going newline in insert mode
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- set c and c++ to use 4 spaces for tab
local function set_c_cpp_indentation()
	vim.bo.tabstop = 4
	vim.bo.softtabstop = 4
	vim.bo.shiftwidth = 4
end

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "c", "cpp", "cuda", "cu" },
	callback = set_c_cpp_indentation,
})

local function update_scroll()
	local divided_lines = math.floor(vim.o.lines / 3)
	if divided_lines > 0 then
		vim.opt.scroll = divided_lines
		vim.notify(
			"Updated scroll to " .. vim.opt.scroll:get() .. " lines",
			vim.log.levels.INFO,
			{ title = "Scroll Update" }
		)
	else
		vim.opt.scroll = 18 -- Set as default (normal value for my setup that is 1/3)
		vim.notify(
			"Scroll set to my default " .. vim.opt.scroll:get() .. " lines",
			vim.log.levels.INFO,
			{ title = "Scroll Update" }
		)
	end
end

vim.api.nvim_create_user_command("UpdateScroll", update_scroll, { nargs = 0 })

-- Vimenter does not happen and resize happeens all the time so just use a function
-- vim.api.nvim_create_autocmd({ "VimEnter", "VimResized" }, {
-- 	callback = update_scroll,
-- })
