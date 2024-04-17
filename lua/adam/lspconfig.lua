local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "html", "astro", "tailwindcss", "jsonls", "eslint" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

require("lspconfig").tsserver.setup({
	capabilities = capabilities,
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
			importModuleSpecifierEnding = "minimal",
		},
	},
})

require("lspconfig").gopls.setup({
	capabilities = capabilities,
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
	capabilities = capabilities,
	filetypes = { "go" },
})




local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})

