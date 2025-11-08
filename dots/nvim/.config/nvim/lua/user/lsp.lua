vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("gopls")
vim.lsp.enable("nil_ls")

-- LSP keymaps
local opts = { noremap = true, silent = true, nowait = true }
vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>", opts)
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>zz', opts)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)


-- Diagnostic keymaps
local diag_shown = true
local toggle_diagnostics = function()
    if diag_shown then
        vim.diagnostic.hide()
    else
        vim.diagnostic.show()
    end
    diag_shown = not diag_shown
end

vim.keymap.set('n', '<leader>dh', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>dt', toggle_diagnostics)
