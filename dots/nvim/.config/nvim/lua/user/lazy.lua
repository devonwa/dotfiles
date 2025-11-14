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
    "nvim-lua/plenary.nvim",                            -- Useful lua functions used by lots of plugins
    "windwp/nvim-autopairs",                            -- Autopairs, integrates with both cmp and treesitter
    { 'numToStr/Comment.nvim',  lazy = false },         -- Comment with C-/
    { "folke/persistence.nvim", event = "BufReadPre" }, -- only start session saving when an actual file was opened

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",

    -- 	in tryout
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

    -- Files, Finders
    { "nvim-tree/nvim-tree.lua" },
    { 'stevearc/oil.nvim',       opts = {},                                       dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "ibhagwan/fzf-lua",        dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "ThePrimeagen/harpoon",    branch = "harpoon2",                             dependencies = { "nvim-lua/plenary.nvim" } },
    { "akinsho/bufferline.nvim", version = "*",                                   dependencies = "nvim-tree/nvim-web-devicons" },
    "nvim-lualine/lualine.nvim",
    { "akinsho/toggleterm.nvim",  lazy = false },


    -- Editor buffer
    { 'Aasim-A/scrollEOF.nvim',   event = { 'CursorMoved', 'WinScrolled' }, opts = {} },
    { "petertriho/nvim-scrollbar" },                                     -- show where lsp errors are in the buffer
    { "folke/zen-mode.nvim",      opts = { window = { width = 130 } } }, -- change editor view a focused window


    -- Colorschemes and Appearance
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
        end
    },
    { "jesseleite/nvim-noirbuddy", dependencies = { "tjdevries/colorbuddy.nvim" }, lazy = false },
    { "catppuccin/nvim",           lazy = false },
    { "dracula/vim",               lazy = true },
    { "olimorris/onedarkpro.nvim", lazy = true },
    { "folke/tokyonight.nvim",     lazy = true },
    { "sainnhe/edge",              lazy = true },
    { "sainnhe/sonokai",           lazy = true },
    { "sainnhe/everforest",        lazy = true },
    { "sainnhe/edge",              lazy = true },


    -- Git
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
    { "neovim/nvim-lspconfig",           lazy = false },  -- enable LSP
    "lukas-reineke/lsp-format.nvim",


    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
    },

    -- Manager of LSPs, Linters, Formatters
    { "williamboman/nvim-lsp-installer", lazy = false },  -- simple to use language server installer
    { "ckipp01/stylua-nvim" },


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
    --

    -- Copilot
    "github/copilot.vim",
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = { { "github/copilot.vim" }, { "nvim-lua/plenary.nvim" }, },
        opts = { debug = false, },
    },


    -- testing out
    {
        "folke/flash.nvim",
        -- event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },

    -- remove if nothing breaks
    -- "moll/vim-bbye",
    -- "ahmedkhalf/project.nvim",

    -- check before removing
    "lukas-reineke/indent-blankline.nvim",

    -- Session management
    { 'rmagatti/auto-session' }
}

require("lazy").setup(plugins)
