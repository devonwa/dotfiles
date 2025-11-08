local opts = { noremap = true, silent = true, nowait = true }

-- Leader key
--vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------
-- Normal
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", opts)      -- save
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", opts)      -- quit
vim.keymap.set("n", "<leader>x", ":w|bd<CR>", opts)       -- save and close buffer
vim.keymap.set("n", "<leader>n", ":nohl<CR>", opts)       -- clear highlights after search
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", opts)    -- ZenMode
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", opts) -- clear highlights after search
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", opts)    -- clear highlights after search
vim.keymap.set("n", "<C-S-t>", ":e#<CR>", opts)           -- open last closed file
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)             -- recenter after scroll
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)             -- recenter after scroll
vim.keymap.set("n", "<C-w>", ":bd<CR>", opts)             -- close tab
vim.keymap.set("n", "n", "nzz", opts)                     -- recenter after search
vim.keymap.set("n", "N", "Nzz", opts)                     -- recenter after search

-- Non-vim editor commands
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "s", "", { desc = "Do nothing" })

-- File nav
vim.keymap.set("n", "<C-e>", ":NvimTreeFindFileToggle<CR>", opts) -- open explorer
vim.keymap.set("n", "<leader>e", ":Oil<CR>", opts)

-- Finders
vim.keymap.set("n", "<leader>fp", ":FzfLua files<CR>", opts)
vim.keymap.set("n", "<C-p>", ":FzfLua files<CR>", opts)
vim.keymap.set("n", "<leader>ff", ":lua FzfLua.live_grep({resume=true})<CR>", opts)
vim.keymap.set("n", "<C-f>", ":lua FzfLua.live_grep({resume=true})<CR>", opts)

vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate windows
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<leader><Tab>", ":b#<CR>", opts)
vim.keymap.set("n", "<C-Tab>", ":b#<CR>", opts)
vim.keymap.set("n", "<leader><S-Tab>", ":FzfLua buffers<CR>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
-- vim.keymap.set("n", "<C-w>", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<C-n>", ":enew<CR>", { desc = "New no name buffer" })

-- Neovide zoom
if vim.g.neovide == true then
    vim.keymap.set("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
        { silent = true })
    vim.keymap.set("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
        { silent = true })
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
