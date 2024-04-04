local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "rose-pine/neovim", name = "rose-pine" },

	"mhinz/vim-startify",

	{ "nvim-lua/plenary.nvim" },

	{
		"Pocco81/TrueZen.nvim",
		lazy = false,
		cmd = { "TZAtaraxis", "TZMinimalist" },
		config = function()
			require("true-zen").setup({
				modes = {
					ataraxis = {
						shade = "dark",
						backdrop = 0.20,
						minimum_writing_area = {
							width = 90,
							height = 44,
						},
						quit_untoggles = true,
						padding = {
							left = 30,
							right = 30,
							top = 1,
							bottom = 1,
						},
					},
				},
			})
		end,
	},

	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"williamboman/mason.nvim",
	},

	{
		"williamboman/mason-lspconfig.nvim",
	},

	{
		"neovim/nvim-lspconfig",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
		lazy = false,
	},

	{
		"saadparwaiz1/cmp_luasnip",
		lazy = false,
	},

	{
		"hrsh7th/nvim-cmp",
	},

	{
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"gpanders/editorconfig.nvim",
	},

	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				sections = {
					lualine_a = {},
					lualine_b = { "branch" },
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "diagnostics" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},

	{
		"olexsmir/gopher.nvim",
		config = function()
			require("gopher").setup()
		end,
	},

	{
		"sainnhe/gruvbox-material",
	},

	{
		"rebelot/kanagawa.nvim",
	},

	{
		"sainnhe/everforest",
	},

	{
		"catppuccin/nvim",
	},

	{
		"AlexvZyl/nordic.nvim",
	},

	{
		"wuelnerdotexe/vim-astro",
	},

	{
		"virchau13/tree-sitter-astro",
	},

	{
		"mhartington/formatter.nvim",
	},

	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {},
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"tpope/vim-rhubarb",
	},

	{
		"nvim-neotest/nvim-nio",
	},

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},

	{
		"lambdalisue/fern.vim",
	},

	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#strategy"] = "vimux"
			vim.g["test#go#runner"] = "delve"
		end,
	},

	{
		"preservim/vimux",
	},

	{
		"windwp/nvim-ts-autotag",
		setup = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"onsails/lspkind.nvim",
	},

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({
				-- "borderless_full",
				"max-perf",
				previewer = false,
				winopts = {
					fullscreen = false,
					preview = {
						layout = "vertical",
						vertical = "down:75%",
					},
				},
			})
		end,
	},

	{
		"junegunn/fzf",
	},

	{
		"junegunn/fzf.vim",
	},

	{
		"princejoogie/dir-telescope.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("dir-telescope").setup({
				-- these are the default options set
				hidden = true,
				no_ignore = false,
				show_preview = true,
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"smartpde/telescope-recent-files",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"%.git/",
						"node_modules/",
						".yarn/",
						"yarn",
						"github",
						"lerna.json",
						"nx.json",
						"README.md",
						".gitignore",
						".firebaserc",
						".editorconfig",
						"firebase.json",
						".prettierrc",
					},
					preview = false,
					mappings = {
						i = {
							-- When an item is selected in insert mode
							["<CR>"] = function(bufnr)
								require("telescope.actions").select_default(bufnr)
								vim.cmd("normal! zz") -- Center the screen after selection
							end,
						},
						n = {
							-- When an item is selected in normal mode
							["<CR>"] = function(bufnr)
								require("telescope.actions").select_default(bufnr)
								vim.cmd("normal! zz") -- Center the screen after selection
							end,
						},
					},
					layout_strategy = "vertical",
					layout_config = {
						width = 0.9,
						height = 0.9,
					},
					path_display = { "truncate" },
				},
				pickers = {
					git_files = {
						sort_lastused = true,
						show_untracked = true,
					},
					buffers = {
						sort_lastused = true,
						ignore_current_buffer = true,
					},
				},
				extensions = {
					recent_files = {
						only_cwd = true,
					},
				},
			})

			require("telescope").load_extension("recent_files")
			require("telescope").load_extension("dir")

			local lsp_symbols_excluding_types = require("adam.telescope-custom-picker")
			vim.api.nvim_create_user_command("LspSymbolsExcludingTypes", lsp_symbols_excluding_types, {})
		end,
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			require("dap-go").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
})
