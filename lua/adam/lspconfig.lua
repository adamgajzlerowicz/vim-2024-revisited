local lspconfig = require("lspconfig")

local servers = { "html", "astro", "tailwindcss", "jsonls", "eslint" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({})
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

require("lspconfig").tsserver.setup({
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
			importModuleSpecifierEnding = "minimal",
		},
	},
})
