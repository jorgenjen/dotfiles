-- Installation of formatters throught code instead of having to open mason
-- and adding the formatters manually on each install
return {
	"williamboman/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = { -- Auto-install
				"clang-format", -- c and cpp
				"stylua", -- lua
				"isort", -- python
				"black", -- python
				"prettierd", -- JS
				"prettier", -- JS
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
