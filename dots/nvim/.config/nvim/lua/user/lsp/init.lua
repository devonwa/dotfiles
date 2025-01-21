-- Setup Mason
require("mason").setup()
require("mason-lspconfig").setup {
    automatic_installation = true,
}


-- Setup language servers.
local lspconfig = require('lspconfig')
-- lsp-format
local lsp_format = require("lsp-format")
lsp_format.setup {}
-- golang
lspconfig.gopls.setup {
    on_attach = lsp_format.on_attach,
}
-- lua
lspconfig.lua_ls.setup {
    on_attach = lsp_format.on_attach,
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
            },
        },
    },
}
-- python
lspconfig.pyright.setup {}
-- ruff settings https://docs.astral.sh/ruff/editors/settings/
lspconfig.ruff.setup {
    on_attach = lsp_format.on_attach,
    init_options = {
        settings = {
            organizeImports = true,
            fixAll = true
        }
    }
}
-- rust
lspconfig.rust_analyzer.setup {}
-- javascript / typescript


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>zz', opts)
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    end,
})

-- Mappings
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
