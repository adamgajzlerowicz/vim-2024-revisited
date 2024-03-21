require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "%.git/", "node_modules/" },
		preview = false,
		mappings = {
			i = {
				-- When an item is selected in insert mode
				["<CR>"] = function(bufnr)
					require("telescope.actions").select_default(bufnr)
					vim.cmd("normal! zz") -- Center the screen after selection
				end,
			},
			n = {
				-- When an item is selected in normal mode
				["<CR>"] = function(bufnr)
					require("telescope.actions").select_default(bufnr)
					vim.cmd("normal! zz") -- Center the screen after selection
				end,
			},
		},
		layout_strategy = "vertical",
		layout_config = {
			width = 0.9,
			height = 0.9,
		},
		path_display = { "truncate" },
	},
	pickers = {
		git_files = {
			show_untracked = true,
		},
		buffers = {
			sort_lastused = true,
			ignore_current_buffer = true,
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
