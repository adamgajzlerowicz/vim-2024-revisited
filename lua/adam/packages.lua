local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "rose-pine/neovim", name = "rose-pine" },

	"mhinz/vim-startify",

	{ "nvim-telescope/telescope.nvim" },

	{ "smartpde/telescope-recent-files" },

	-- { "github/copilot.vim" },

	{ "nvim-lua/plenary.nvim" },

	{
		"ThePrimeagen/harpoon",
		lazy = false,
		config = function()
			require("harpoon").setup({
				mark_branch = true,
			})
		end,
	},

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
		"mhartington/formatter.nvim",
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
		"mfussenegger/nvim-dap",
		dependencies = { "leoluz/nvim-dap-go" },
		config = function()
			require("dap-go").setup()
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
		"luukvbaal/nnn.nvim",
		config = function()
			require("nnn").setup()
		end,
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
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
})
