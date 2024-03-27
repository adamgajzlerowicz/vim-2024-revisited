vim.opt.ignorecase = true

vim.cmd([[
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
]])

vim.opt.autoread = true
vim.cmd([[au CursorHold * checktime]])
vim.cmd([[highlight CursorLine cterm=NONE ctermbg=DarkGrey guibg=#3A3C4E]])

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopePrompt",
	once = true,
	callback = function()
		vim.api.nvim_command("highlight TelescopeSelection guibg=#3A3C4E gui=none")
	end,
})

vim.api.nvim_create_augroup("CenterScreenOnEnter", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "normal zz",
	group = "CenterScreenOnEnter",
})

-- Function to check and jump to the last cursor position in a file
local function set_last_position()
	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = "*",
		callback = function()
			local last_pos = vim.api.nvim_buf_get_mark(0, '"')
			local last_line = last_pos[1]
			local last_col = last_pos[2]
			if last_line > 0 and last_line <= vim.api.nvim_buf_line_count(0) then
				vim.api.nvim_win_set_cursor(0, { last_line, last_col })
			end
		end,
	})
end

-- Call the function to set up the autocommand
set_last_position()

vim.cmd([[
  augroup DiagnosticsHighlight
    autocmd!
    autocmd ColorScheme * highlight DiagnosticUnderlineError gui=underline guifg=NONE guisp=Red ctermfg=NONE cterm=underline
  augroup END
]])

vim.cmd([[
  let g:everforest_background = 'hard'
  colorscheme kanagawa
]])

vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	signs = true,
	severity_sort = true,
})

vim.api.nvim_create_user_command("GoGenerate", function()
	vim.cmd("!go generate %")
end, {})

-- vim.opt.mouse = ""
