local formatterConfig = {
	lua = {
		require("formatter.filetypes.lua").stylua,
	},
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
	go = {
		function()
			return {
				exe = "gofmt",
				args = {},
				stdin = true,
			}
		end,
	},
}

require("formatter").setup({
	filetype = formatterConfig,
})

local format_augroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = format_augroup,
	pattern = "*",
	command = "silent FormatWrite",
})
