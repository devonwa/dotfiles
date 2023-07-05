local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", "<leader>w", ":w<CR>", opts) -- save
keymap("n", "<C-w>", ":bd<CR>", opts) -- close buffer
keymap("n", "<leader>q", ":q<CR>", opts) -- quit
keymap("n", "<leader>n", ":nohl<CR>", opts) -- clear highlights after search
keymap("n", "<leader>z", ":ZenMode<CR>", opts) -- ZenMode
keymap("n", "<leader>r", ":Reload<CR>", opts) -- Reload config
keymap("n", "<leader>t", ":ToggleTerm<CR>", opts) -- clear highlights after search

-- Sidebars
keymap("", "<Space>", "<Nop>", opts)
keymap("n", "<C-e>", ":NvimTreeToggle 30<CR>", opts) -- explorer
-- debug
-- testing
-- git

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-Tab>", ":bnext<CR>", opts)
keymap("n", "<C-S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Neovide zoom
if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

-----------------
-- Visual
-- Paste replace without overwrite
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block
-- Paste replace without overwrite
keymap("x", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
