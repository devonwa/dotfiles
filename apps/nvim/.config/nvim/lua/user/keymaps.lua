local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Leader key
--vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reload nvim
-- TODO Isn't working right now
vim.api.nvim_create_user_command('Reload', ':luafile $MYVIMRC', {})

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------
-- Normal
vim.keymap.set("n", "<leader>w", ":w<CR>", opts) -- save
vim.keymap.set("n", "<C-w>", ":bd<CR>", opts) -- close buffer
--vim.keymap.set("n", "<leader>q", ":q<CR>", opts) -- quit
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", opts) -- quit
vim.keymap.set("n", "<leader>n", ":nohl<CR>", opts) -- clear highlights after search
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", opts) -- ZenMode
vim.keymap.set("n", "<leader>r", ":Reload<CR>", opts) -- Reload config
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", opts) -- clear highlights after search

-- Sidebars
--vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle 30<CR>", opts) -- explorer
-- debug
-- testing
-- git

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Neovide zoom
if vim.g.neovide == true then
  vim.keymap.set("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  vim.keymap.set("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  vim.keymap.set("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

-----------------
-- Visual
-- Paste replace without overwrite
vim.keymap.set("v", "p", '"_dP', opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Visual Block
-- Paste replace without overwrite
vim.keymap.set("x", "p", '"_dP', opts)

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
