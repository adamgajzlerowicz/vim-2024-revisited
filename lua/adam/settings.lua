vim.opt.ignorecase = true

vim.cmd [[
  set encoding=UTF-8
  syntax on
  set ignorecase
  set smartcase
  set hidden
  set number
  set nobackup
  set nospell
  set termguicolors
  set nowritebackup
  set smarttab
  set nocompatible
  set cindent
  set tabstop=2
  set softtabstop=2
  set noswapfile
  set shiftwidth=2
  set expandtab
  set cursorline
  au FocusLost * silent! wa
  set nowrap
  syntax enable
  set autowriteall
  set background=dark
]]

vim.opt.autoread = true
vim.cmd [[au CursorHold * checktime]]
