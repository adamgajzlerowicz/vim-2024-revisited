vim.g.startify_lists = {
  { type = "sessions", header = { "   Sessions" } },
  { type = "bookmarks", header = { "   Bookmarks" } },
  { type = "commands", header = { "   Commands" } },
}

vim.g.startify_bookmarks = {
  { agilix = "~/projects/agilix" },
  { vim_config = "~/.config/nvim/lua/adam" },
}

vim.g.startify_session_persistence = 1
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_enable_special = 0

vim.api.nvim_create_autocmd("VimEnter", {
	nested = true,
	callback = function()
		if vim.fn.argc() == 0 then
			local session_dir = vim.g.startify_session_dir or (vim.fn.stdpath("data") .. "/session")
			local sessions = vim.fn.glob(session_dir .. "/*", false, true)
			if #sessions > 0 then
				table.sort(sessions, function(a, b)
					return vim.fn.getftime(a) > vim.fn.getftime(b)
				end)
				local session_name = vim.fn.fnamemodify(sessions[1], ":t")
				vim.cmd("silent! SLoad " .. vim.fn.fnameescape(session_name))
			end
		end
	end,
})
