require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			width = 0.9,
			height = 0.9,
		},
		path_display = "shorten",
	},
	pickers = {
		git_files = {
			show_untracked = true,
		},
	},
	extensions = {
		recent_files = {
			only_cwd = true,
		},
	},
})

require("telescope").load_extension("harpoon")
require("telescope").load_extension("recent_files")

local lsp_symbols_excluding_types = require("adam.telescope-customer-picker")
vim.api.nvim_create_user_command("LspSymbolsExcludingTypes", lsp_symbols_excluding_types, {})
