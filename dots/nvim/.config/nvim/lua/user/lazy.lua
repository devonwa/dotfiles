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

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",

    -- 	in tryout
    "ahmedkhalf/project.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    { "nvim-tree/nvim-web-devicons", lazy = false },
    "moll/vim-bbye",
    { "akinsho/toggleterm.nvim",     lazy = false },
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
    { "folke/persistence.nvim",  event = "BufReadPre" }, -- only start session saving when an actual file was opened
    { "petertriho/nvim-scrollbar"
    },                                                   -- show where lsp errors are in the buffer

    -- Files, Finders, and Buffers
    { "nvim-tree/nvim-tree.lua" },
    { 'stevearc/oil.nvim',       opts = {},                                       dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "ibhagwan/fzf-lua",        dependencies = { "nvim-tree/nvim-web-devicons" } },
    -- "nvim-telescope/telescope.nvim",
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    { "ThePrimeagen/harpoon",    branch = "harpoon2",                             dependencies = { "nvim-lua/plenary.nvim" } },
    { "akinsho/bufferline.nvim", version = "*",                                   dependencies = "nvim-tree/nvim-web-devicons" },
    "nvim-lualine/lualine.nvim",
    { "folke/zen-mode.nvim",       opts = { window = { width = 130 } } },


    -- Colorschemes and Appearance
    { "jesseleite/nvim-noirbuddy", dependencies = { "tjdevries/colorbuddy.nvim" }, lazy = false },
    { "catppuccin/nvim",           lazy = false },
    { "dracula/vim",               lazy = true },
    { "olimorris/onedarkpro.nvim", lazy = true },
    { "folke/tokyonight.nvim",     lazy = true },
    { "sainnhe/edge",              lazy = true },
    { "ellisonleao/gruvbox.nvim",  lazy = false },
    { "sainnhe/sonokai",           lazy = true },
    { "sainnhe/gruvbox-material",  lazy = true },
    { "sainnhe/everforest",        lazy = true },
    { "sainnhe/edge",              lazy = true },
    { 'Aasim-A/scrollEOF.nvim',    event = { 'CursorMoved', 'WinScrolled' },       opts = {} },

    -- Git
    -- "lewis6991/gitsigns.nvim",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
            require("scrollbar.handlers.gitsigns").setup()
        end
    },
    "sindrets/diffview.nvim",
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            -- "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim", -- optional
            "ibhagwan/fzf-lua",       -- optional
        },
        config = true
    },

    -- LSPs, Linters, Formatters
    { "neovim/nvim-lspconfig",            lazy = false }, -- enable LSP
    "lukas-reineke/lsp-format.nvim",

    -- Manager of LSPs, Linters, Formatters
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/nvim-lsp-installer",  lazy = false }, -- simple to use language server installer


    -- Auto-completion
    "hrsh7th/nvim-cmp",   -- The completions engine
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path",   -- path completions
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- Debugger
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",

    -- Snippets

    -- Session management
    { 'rmagatti/auto-session' }
}

require("lazy").setup(plugins)
