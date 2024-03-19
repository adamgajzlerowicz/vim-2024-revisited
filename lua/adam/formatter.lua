local filetypes = {
	"css",
	"eruby",
	"html",
	"less",
	"sass",
	"scss",
	"svelte",
	"pug",
	"vue",
}

local eslint_d = function()
	local filename = vim.api.nvim_buf_get_name(0)
	filename = filename:gsub("%[", "\\["):gsub("%]", "\\]")

	return {
		exe = "eslint_d",
		try_node_modules = true,
		args = { "--stdin", "--stdin-filename", filename, "--fix-to-stdout" },
		stdin = true,
	}
end

local prettier = function()
	local filepath_original = vim.api.nvim_buf_get_name(0)
	local filepath = filepath_original:gsub("%[", "\\["):gsub("%]", "\\]")

	return {
		exe = "prettier",
		try_node_modules = true,
		args = { "--stdin-filepath", filepath },
		stdin = true,
	}
end

local formatterConfig = {
	lua = {
		require("formatter.filetypes.lua").stylua,
	},
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
	javascriptreact = { eslint_d, prettier },
	javascript = { eslint_d, prettier },
	typescript = { eslint_d, prettier },
	typescriptreact = { eslint_d, prettier },
	astro = { prettier },
	go = {
		function()
			return {
				exe = "goimports",
				args = {},
				stdin = true,
			}
		end,
		function()
			return {
				exe = "gofmt",
				args = {},
				stdin = true,
			}
		end,
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
