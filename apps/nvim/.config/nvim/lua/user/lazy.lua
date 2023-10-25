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

local plugins = {
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim", -- Comment with C-/
    { "folke/neodev.nvim", opts = {} }, -- tooltips for neovim init.lua development

    -- 	in tryout
	"ahmedkhalf/project.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
    { "nvim-tree/nvim-web-devicons", lazy = false },
    { "nvim-tree/nvim-tree.lua", lazy = false },
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"goolord/alpha-nvim",
	"folke/which-key.nvim",
    {"folke/zen-mode.nvim", opts = { window = { width = 130 }}},
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
	},

	-- Colorschemes
    { "catppuccin/nvim", lazy = false },
    { "dracula/vim", lazy = true },
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

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

    -- Buffers
    {"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"},

	-- Git
	"lewis6991/gitsigns.nvim",

	-- Manager of LSPs, Linters, Formatters
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- LSPs, Linters, Formatters
 	{ "neovim/nvim-lspconfig", lazy = false }, -- enable LSP
	{ "williamboman/nvim-lsp-installer", lazy = false }, -- simple to use language server installer
	{ "jose-elias-alvarez/null-ls.nvim", lazy = false }, -- for formatters and linters

    -- Debugger
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

}

require("lazy").setup(plugins)
