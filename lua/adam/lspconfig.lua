local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  html = {},
  astro = {},
  tailwindcss = {},
  jsonls = {},
  eslint = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  ts_ls = {
    preferences = {
      importModuleSpecifierPreference = "relative",
      importModuleSpecifierEnding = "minimal",
    },
  },
}

for server_name, config in pairs(servers) do
  -- Configure the LSP server using the new vim.lsp.config API
  vim.lsp.config[server_name] = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
  }, config)

  -- Enable the LSP server
  vim.lsp.enable(server_name)
end