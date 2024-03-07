require("telescope").setup({
	defaults = {
    layout_strategy = "vertical",
		layout_config = {
			width = 0.9,
			height = 0.9,
		},
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
