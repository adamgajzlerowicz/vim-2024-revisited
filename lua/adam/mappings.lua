vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope git_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<tab>', ':Telescope buffers<CR>', {noremap = true, nowait = true})
vim.api.nvim_set_keymap('n', '<leader>fe', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>o', ':Startify<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>jj', ':TZAtaraxis<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { desc = "copy to system clipboard", nowait = true })


vim.api.nvim_set_keymap("n", "<tab>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true})
