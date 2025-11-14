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
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", opts)    -- open neogit

-- -- Toggle diffview
local function toggle_diffview()
    local diffview = require('diffview.lib')
    local view = diffview.get_current_view()
    if view then
        vim.cmd('DiffviewClose')
    else
        vim.cmd('DiffviewOpen')
    end
end
vim.keymap.set("n", "<leader>gd", toggle_diffview, opts)              -- toggle diffview
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", opts)   -- git file history (all files)
vim.keymap.set("n", "<leader>gf", ":DiffviewFileHistory %<CR>", opts) -- git file history (current file)
vim.keymap.set("n", "<C-S-t>", ":e#<CR>", opts)                       -- open last closed file
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)                         -- recenter after scroll
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)                         -- recenter after scroll
vim.keymap.set("n", "<C-w>", ":bd<CR>", opts)                         -- close tab
vim.keymap.set("n", "n", "nzz", opts)                                 -- recenter after search
vim.keymap.set("n", "N", "Nzz", opts)                                 -- recenter after search

-- Non-vim editor commands
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "s", "", { desc = "Do nothing" })

-- Formatting
vim.keymap.set("n", "<leader>lf", ":Format<CR>", opts) -- manual format
vim.keymap.set("n", "<leader>W", ":W<CR>", opts)       -- save without formatting

-- File nav
vim.keymap.set("n", "<C-e>", ":NvimTreeFindFileToggle<CR>", opts) -- open explorer
vim.keymap.set("n", "<leader>e", ":Oil<CR>", opts)

-- Finders
vim.keymap.set("n", "<leader>fp", ":FzfLua files<CR>", opts)
vim.keymap.set("n", "<C-p>", ":FzfLua files<CR>", opts)
vim.keymap.set("n", "<leader>ff", ":lua FzfLua.live_grep({resume=true})<CR>", opts)
vim.keymap.set("n", "<C-f>", ":lua FzfLua.live_grep({resume=true})<CR>", opts)
vim.keymap.set("n", "<leader>fk", ":FzfLua keymaps<CR>", opts)
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

-- Copilot
vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, silent = true })
vim.keymap.set("i", "<M-]>", '<Plug>(copilot-next)', { silent = true })
vim.keymap.set("i", "<M-[>", '<Plug>(copilot-previous)', { silent = true })
vim.keymap.set("i", "<M-\\>", '<Plug>(copilot-suggest)', { silent = true })
vim.g.copilot_no_tab_map = true

-- CopilotChat
local function toggle_copilot_chat()
    local chat_bufnr = nil
    -- Find existing CopilotChat buffer
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) then
            local bufname = vim.api.nvim_buf_get_name(buf)
            if bufname:match("copilot%-chat") then
                chat_bufnr = buf
                break
            end
        end
    end
    
    -- If buffer exists and is visible in a window, close it
    if chat_bufnr then
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == chat_bufnr then
                vim.api.nvim_win_close(win, false)
                return
            end
        end
        -- Buffer exists but not visible, open it
        vim.cmd("CopilotChatOpen")
        return
    end
    
    -- Buffer doesn't exist, toggle normally
    vim.cmd("CopilotChatToggle")
end

vim.keymap.set({ "n", "v" }, "<C-i>", toggle_copilot_chat, { desc = "Toggle Copilot Chat", silent = true })
vim.keymap.set({ "n", "v" }, "<leader>i", toggle_copilot_chat, { desc = "Toggle Copilot Chat", silent = true })

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
