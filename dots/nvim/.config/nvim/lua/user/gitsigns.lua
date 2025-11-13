require('gitsigns').setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        local function next_hunk()
            if vim.wo.diff then return ']g' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end
        local function prev_hunk()
            if vim.wo.diff then return ']g' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end
        vim.keymap.set("n", "]c", next_hunk, { expr = true, buffer = bufnr, desc = "goto next hunk" })
        vim.keymap.set("n", "[c", prev_hunk, { expr = true, buffer = bufnr, desc = "goto previous hunk" })

        -- Actions
        local function stage_hunk()
            gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
        end
        local function reset_hunk()
            gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
        end
        local function blame_line()
            gs.blame_line { full = true }
        end
        vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr })
        vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { buffer = bufnr })
        vim.keymap.set('v', '<leader>gs', stage_hunk, { buffer = bufnr })
        vim.keymap.set('v', '<leader>gr', reset_hunk, { buffer = bufnr })
        vim.keymap.set('n', '<leader>gS', gs.stage_buffer, { buffer = bufnr })
        vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, { buffer = bufnr })
        vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { buffer = bufnr })
        vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { buffer = bufnr })
        vim.keymap.set('n', '<leader>gb', blame_line, { buffer = bufnr })
        vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { buffer = bufnr })
        vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { buffer = bufnr })
        vim.keymap.set('n', '<leader>gn', gs.next_hunk, { buffer = bufnr })
        vim.keymap.set('n', '<leader>gN', gs.prev_hunk, { buffer = bufnr })

        -- Text object
        vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { buffer = bufnr })
    end
}
