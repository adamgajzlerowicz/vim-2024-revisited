function CustomLspRename()
	local opts = {
		prompt = "New Name: ", -- The prompt text
	}

	vim.ui.input(opts, function(input)
		if input then
			vim.lsp.buf.rename(input)
		end
	end)
end

function FormatAndSave()
	vim.api.nvim_exec("silent FormatWrite", false)
	vim.api.nvim_command("silent wall")
end

function Git_auto_push()
	local branchName = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")

	vim.cmd("wa")
	vim.cmd("!git add --all")
	vim.cmd("!git commit -m " .. branchName)
	vim.cmd("!git push")
end

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<c-p>", ":Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":NnnPicker %:p:h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>d",
	":lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>l",
	"<cmd>lua FormatAndSave()<CR>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap("n", "<tab>", ":Telescope buffers<CR>", { noremap = true, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>fw", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>o", ":Startify<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jj", ":TZAtaraxis<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { desc = "copy to system clipboard", nowait = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>p",
	"<cmd>lua Git_auto_push()<CR><cr>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>u",
	"<cmd>Telescope lsp_references<CR>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>e",
	":lua CustomLspRename()<CR>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>k",
	"<cmd>Telescope git_status<CR>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>b",
	"<cmd>lua package.loaded.gitsigns.blame_line()<CR>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fs",
	"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap("n", "<Esc>", "<cmd>noh | cclose<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap(
	"n",
	"<tab>",
	[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
	{ noremap = true, silent = true }
)

-- lsp
-- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>:Lspsaga goto_definition<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>:Lspsaga show_buf_diagnostics<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader><cr>",
	"<cmd>lua vim.lsp.buf.code_action()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "LSP Diagnostics" })
vim.keymap.set(
	"n",
	"<Leader>q",
	vim.diagnostic.setqflist,
	{ noremap = true, silent = true, desc = "LSP Diagnostics Quickfix" }
)

-- harpoon
vim.api.nvim_set_keymap(
	"n",
	"<leader>fa",
	"<cmd>lua require('harpoon.mark').add_file()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>kc", "<cmd>Gitsigns preview_hunk<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gb", function()
	require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>gc", function()
	require("dap").continue()
end)

vim.keymap.set("n", "<leader>gu", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.toggle()
end)

vim.keymap.set("n", "<leader>gt", function()
	require("dap-go").debug_test()
end)

vim.keymap.set("n", "<leader>gl", function()
	require("dap-go").debug_last()
end)
vim.api.nvim_set_keymap("n", "f", "<cmd>HopChar1<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>kg", "<cmd>.GBrowse<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "y", "yy", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>y", '"+yy', { nowait = true })
vim.api.nvim_set_keymap("x", "<Leader>c", "<Plug>Commentary", {})
vim.api.nvim_set_keymap("c", "<C-f>", "<Nop>", { noremap = true })
