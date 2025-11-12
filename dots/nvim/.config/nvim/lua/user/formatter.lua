local format = require "lsp-format"

format.setup {
    sync = true,  -- Enable format on save by default
    exclude = {}, -- Don't format on save for specific filetypes
}

-- Attach formatter to LSP clients
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.supports_method("textDocument/formatting") then
            format.on_attach(client, args.buf)
        end
    end,
})

-- Save without formatting commands
vim.api.nvim_create_user_command('W', function()
    vim.cmd('noautocmd write')
end, { desc = 'Write without formatting' })

vim.api.nvim_create_user_command('Wq', function()
    vim.cmd('noautocmd write')
    vim.cmd('quit')
end, { desc = 'Write and quit without formatting' })

-- Manual format command
vim.api.nvim_create_user_command('Format', function()
    vim.lsp.buf.format({ async = false })
end, { desc = 'Format current buffer' })
