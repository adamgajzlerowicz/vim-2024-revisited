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

function ToggleOrFindNvimTree()
	local bufnr = vim.api.nvim_get_current_buf()
	local api = require("nvim-tree.api")

	if api.tree.is_tree_buf(bufnr) then
		vim.cmd("NvimTreeClose")
	else
		vim.cmd("NvimTreeFindFile")
	end
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
vim.api.nvim_set_keymap("n", "<S-Tab>", ":lua ToggleOrFindNvimTree()<CR>", { noremap = true, silent = true })
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
vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>wincmd l<CR>", { noremap = true, silent = true })

-- lsp
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
