return {
	"akinsho/toggleterm.nvim",
	-- tag = "*",
	-- config = true,
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-t>]], -- Map Ctrl+t to toggle the terminal
			direction = "float", -- Default direction is floating
		})
	end,
}
