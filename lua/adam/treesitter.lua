require('nvim-treesitter.configs').setup({
  ensure_installed = {'astro', 'go', 'tsx', 'typescript', 'html'},
  auto_install = true,
  highlight = {
    enable = true
  },
})
