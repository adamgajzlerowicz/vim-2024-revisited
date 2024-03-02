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

  {"nvim-telescope/telescope.nvim"},

  {"smartpde/telescope-recent-files"},

  "github/copilot.vim",

  "nvim-lua/plenary.nvim",

  {
    "Pocco81/TrueZen.nvim",
    lazy = false,
    cmd = { "TZAtaraxis", "TZMinimalist" },
    config = function()
      require("true-zen").setup {
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
      }
    end,
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "williamboman/mason.nvim"
  },

  {
    "williamboman/mason-lspconfig.nvim"
  },
  
  {
    "neovim/nvim-lspconfig"
  },

  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },

  {
    "nvim-tree/nvim-tree.lua",
  },
  
  {
    "nvim-tree/nvim-web-devicons"  
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  }
})
