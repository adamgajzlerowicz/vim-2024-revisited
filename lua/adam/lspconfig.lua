local lspconfig = require "lspconfig"

local servers = { "html", "tsserver", "astro", "tailwindcss", "jsonls", "eslint", "lua_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end
