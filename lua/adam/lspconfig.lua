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

require("lspconfig").gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

require("lspconfig").golangci_lint_ls.setup({
	filetypes = { "go" },
})
