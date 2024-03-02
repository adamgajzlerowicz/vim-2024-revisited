function FormatAndSave()
  vim.api.nvim_exec("silent FormatWrite", false)
  vim.api.nvim_command("silent wall")
end

function git_auto_push()
  vim.cmd "wa"
  vim.cmd "!git add --all"
  vim.cmd "!git commit -m 'Your commit message'"
  vim.cmd "!git push"
end

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope git_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua FormatAndSave()<CR>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<tab>', ':Telescope buffers<CR>', {noremap = true, nowait = true})
vim.api.nvim_set_keymap('n', '<leader>fe', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>o', ':Startify<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>jj', ':TZAtaraxis<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { desc = "copy to system clipboard", nowait = true })
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua git_auto_push()<CR>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<leader>u', '<cmd>Telescope lsp_references<CR>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>Telescope git_status<CR>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua package.loaded.gitsigns.blame_line()<CR>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<leader>fs', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '<Esc>', '<cmd>noh | cclose<CR>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap("n", "<tab>", [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], {noremap = true, silent = true})
