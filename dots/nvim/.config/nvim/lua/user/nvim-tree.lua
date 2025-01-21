local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<C-e>", api.tree.toggle, opts('toggle'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
    on_attach = my_on_attach,
    hijack_cursor = true,
    reload_on_bufenter = true,
    view = {
        adaptive_size = true,
        relativenumber = true
    },
    filters = {
        git_ignored = false,
    },
}
