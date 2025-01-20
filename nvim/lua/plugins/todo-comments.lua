-- PERF:  does not look like it should
-- TODO:
-- HACK:
-- NOTE:
-- FIX:
-- TODO(john): Works with cpp style wih username due to pattern
-- BUG:

-- Plugin does what you can see above!
return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			multiline = true, -- enable multine todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			before = "", -- "fg" or "bg" or empty
			keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			after = "fg", -- "fg" or "bg" or empty
			pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]], -- pattern or table of patterns, used for highlighting (vim regex)
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			-- regex that will be used to match keywords (ripgrep regex).
			-- don't replace the (KEYWORDS) placeholder
			pattern = [[\b(KEYWORDS)(\(\w*\))*:]], -- ripgrep regex
		},
	},
	init = function()
		vim.keymap.set(
			"n",
			"<leader>ft",
			":TodoTelescope<CR>",
			{ silent = true, desc = "Fuzzy search through todo's in work directory" }
		)
	end,
}
