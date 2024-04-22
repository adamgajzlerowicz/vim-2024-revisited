local defaultOptions = {
	noremap = true,
	silent = true,
	nowait = true,
}

function CustomLspRename()
	local opts = {
		prompt = "New Name: ",
	}

	vim.ui.input(opts, function(input)
		if input then
			vim.lsp.buf.rename(input)
		end
	end)
end

function FormatAndSave()
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
vim.api.nvim_set_keymap("n", "<S-Tab>", ":Fern . -reveal=%<CR>", { noremap = true, silent = true })
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
vim.keymap.set({ "n" }, "<tab>", function()
	require("telescope.builtin").buffers({ sort_mru = true })
end, { silent = true, desc = "Fuzzy complete file" })

vim.api.nvim_set_keymap("n", "<leader>fw", ":Telescope live_grep<CR>", defaultOptions)
vim.api.nvim_set_keymap("n", "<leader>fe", ":Telescope dir live_grep<CR>", defaultOptions)
vim.api.nvim_set_keymap("v", "<leader>fw", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", defaultOptions)
vim.api.nvim_set_keymap("n", "<leader>o", ":Startify<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jj", ":TZAtaraxis<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { desc = "copy to system clipboard", nowait = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>p",
	"<cmd>lua Git_auto_push()<cr>",
	{ noremap = true, silent = true, nowait = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>u",
	":Telescope lsp_references<CR>",
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
	"<leader>b",
	"<cmd>lua package.loaded.gitsigns.blame_line()<CR>",
	{ noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap("n", "<Esc>", "<cmd>noh | cclose<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "fs", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "fS", ":Telescope lsp_workspace_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "fg", ":Telescope resume<CR>", { noremap = true, silent = true })
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
vim.api.nvim_set_keymap("n", "<leader>kc", "<cmd>Gitsigns preview_hunk<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "tb", function()
	require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "tc", function()
	require("dap").continue()
end)

vim.keymap.set("n", "<leader>tu", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.toggle()
end)

vim.keymap.set("n", "td", function()
	require("dap-go").debug_test()
end)

vim.keymap.set("n", "<leader>gl", function()
	require("dap-go").debug_last()
end)
vim.api.nvim_set_keymap("n", "f", "<cmd>HopChar1<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>kg", "<cmd>.GBrowse<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "y", "yy", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>y", '"+yy', { nowait = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>yr", ':let @+ = expand("%")<CR>', { nowait = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ya", ':let @+ = expand("%:p")<CR>', { nowait = true, silent = true })
vim.api.nvim_set_keymap("x", "<Leader>c", "<Plug>Commentary", {})
vim.api.nvim_set_keymap("c", "<C-f>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", "<Plug>(fern-action-hidden:toggle)", { noremap = true })

local function debug_nearest()
	vim.g["test#go#runner"] = "delve"
	vim.cmd("TestNearest")
	vim.g["test#go#runner"] = nil
end

vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua debug_nearest()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tt", ":TestNearest<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>tT", ":TestFile<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>ta", ":TestSuite<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>tg", ":TestVisit<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>[", ":cprevious<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>]", ":cnext<CR>", { silent = true })
