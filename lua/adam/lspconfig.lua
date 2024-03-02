local lspconfig = require("lspconfig")

local servers = { "html", "tsserver", "astro", "tailwindcss", "jsonls", "eslint" }

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
