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

plugins = {
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
    { "kyazdani42/nvim-web-devicons", lazy = false },
    { "kyazdani42/nvim-tree.lua", lazy = false },

	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"ahmedkhalf/project.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",
	"folke/which-key.nvim",
    "folke/zen-mode.nvim",
    "christoomey/vim-tmux-navigator",

	-- Colorschemes
    { "catppuccin/nvim", lazy = false },
    { "olimorris/onedarkpro.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true},
	{ "sainnhe/edge", lazy = true },
	{ "morhetz/gruvbox", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "sainnhe/edge", lazy = true },
    

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	-- Git
	"lewis6991/gitsigns.nvim",

	-- LSP
--     { "williamboman/nvim-lsp-installer" } -- simple to use language server installer
-- 	{ "neovim/nvim-lspconfig" } -- enable LSP
-- 	{ "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
}

require("lazy").setup(plugins, opts)