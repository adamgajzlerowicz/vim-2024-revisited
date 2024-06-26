local util = require("formatter.util")

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
	return {
		exe = "eslint_d",
		try_node_modules = true,
		cwd = util.get_current_buffer_file_dir(),
		args = {
			"--stdin",
			"--stdin-filename",
			util.escape_path(util.get_current_buffer_file_path()),
			"--fix-to-stdout",
		},
		stdin = true,
	}
end

local prettier = function()
	return {
		exe = "prettier",
		try_node_modules = true,
		args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()) },
		cwd = util.get_current_buffer_file_dir(),
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
		-- function()
		-- 	return {
		-- 		exe = "~/gci-format",
		-- 		args = { vim.api.nvim_buf_get_name(0) },
		-- 		stdin = false,
		-- 	}
		-- end,

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
