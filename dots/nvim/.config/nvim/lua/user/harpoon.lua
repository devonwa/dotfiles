local harpoon = require('harpoon')
harpoon:setup({})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader><S-a>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
-- not working: terminal eating ctrl+number ?
-- vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>h", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>l", function() harpoon:list():next() end)

