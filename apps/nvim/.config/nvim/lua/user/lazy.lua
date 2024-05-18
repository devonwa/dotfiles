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
    "nvim-lua/plenary.nvim",                   -- Useful lua functions used by lots of plugins
    "windwp/nvim-autopairs",                   -- Autopairs, integrates with both cmp and treesitter
    { 'numToStr/Comment.nvim', lazy = false }, -- Comment with C-/
    { "folke/neodev.nvim",     opts = {} },    -- tooltips for neovim init.lua development

    -- 	in tryout
    "ahmedkhalf/project.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    { "nvim-tree/nvim-web-devicons", lazy = false },
    { "nvim-tree/nvim-tree.lua",     lazy = false },
    "akinsho/bufferline.nvim",
    "moll/vim-bbye",
    "nvim-lualine/lualine.nvim",
    { "akinsho/toggleterm.nvim",   lazy = false },
    "goolord/alpha-nvim",
    "folke/which-key.nvim",
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    { "folke/persistence.nvim",    event = "BufReadPre" }, -- only start session saving when an actual file was opened

    -- Colorschemes
    { "catppuccin/nvim",           lazy = false },
    { "dracula/vim",               lazy = true },
    { "olimorris/onedarkpro.nvim", lazy = true },
    { "folke/tokyonight.nvim",     lazy = true },
    { "sainnhe/edge",              lazy = true },
    { "morhetz/gruvbox",           lazy = true },
    { "sainnhe/sonokai",           lazy = true },
    { "sainnhe/gruvbox-material",  lazy = true },
    { "sainnhe/everforest",        lazy = true },
    { "sainnhe/edge",              lazy = true },

    -- cmp plugins
    "hrsh7th/nvim-cmp", -- The completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets

    -- Telescope
    "nvim-telescope/telescope.nvim",
    { "ibhagwan/fzf-lua",        dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",

    -- Mini
    --{ 'echasnovski/mini.nvim', version = false },

    -- Buffers
    { "akinsho/bufferline.nvim", version = "*",                                   dependencies = "nvim-tree/nvim-web-devicons" },

    -- Git
    "lewis6991/gitsigns.nvim",
    "sindrets/diffview.nvim",
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",     -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",    -- optional
            "ibhagwan/fzf-lua",          -- optional
        },
        config = true
    },

    -- Manager of LSPs, Linters, Formatters
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- LSPs, Linters, Formatters
    { "neovim/nvim-lspconfig",            lazy = false }, -- enable LSP
    { "williamboman/nvim-lsp-installer",  lazy = false }, -- simple to use language server installer
    { "jose-elias-alvarez/null-ls.nvim",  lazy = false }, -- for formatters and linters

    -- Debugger
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",

    -- Presentation
    { "folke/zen-mode.nvim", opts = { window = { width = 130 } } }
}

require("lazy").setup(plugins)
