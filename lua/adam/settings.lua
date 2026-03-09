vim.opt.encoding = "UTF-8"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.backup = false
vim.opt.spell = false
vim.opt.termguicolors = true
vim.opt.writebackup = false
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.autowriteall = true
vim.opt.background = "dark"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undo")
vim.opt.autoread = true
vim.opt.numberwidth = 10

vim.api.nvim_create_autocmd("FocusLost", {
	pattern = "*",
	command = "silent! wa",
})

vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	command = "checktime",
})

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

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	command = "highlight DiagnosticUnderlineError gui=underline guifg=NONE guisp=Red ctermfg=NONE cterm=underline",
})

vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	signs = true,
	severity_sort = true,
})

vim.api.nvim_create_user_command("GoGenerate", function()
	vim.cmd("!go generate %")
end, {})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.fn.jobstart("git -C " .. vim.fn.expand("~/.config/nvim") .. " pull --ff-only", {
			detach = true,
		})
	end,
})
