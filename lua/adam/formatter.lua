local filetypes = {
	"css",
	"eruby",
	"html",
	"javascript",
	"javascriptreact",
	"less",
	"sass",
	"scss",
	"svelte",
	"pug",
	"typescriptreact",
	"typescript",
	"vue",
	"astro",
}

local formatterConfig = {
	lua = {
		require("formatter.filetypes.lua").stylua,
	},
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
}

for _, filetype in ipairs(filetypes) do
	formatterConfig[filetype] = {
		function()
			return {
				exe = "prettier",
				args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
				stdin = true,
			}
		end,
	}
end

require("formatter").setup({
	filetype = formatterConfig,
})

local format_augroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = format_augroup,
	pattern = "*",
	command = "silent FormatWrite",
})
