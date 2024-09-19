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
  ---
  on_attach = my_on_attach,
  ---
}



-- local function my_on_attach(bufnr)
--   local api = require "nvim-tree.api"
--
--   local function opts(desc)
--     return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end
--
--   -- default mappings
--   api.config.mappings.default_on_attach(bufnr)
--
--   -- custom mappings
--   vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
--   vim.keymap.del('n', '<C-e>', { buffer = bufnr })
--   vim.keymap.set('n', '<esc>', api.tree.close)
-- end
--
-- local HEIGHT_RATIO = 0.8
-- local WIDTH_RATIO = 0.8
-- nvim_tree.setup {
--   on_attach = my_on_attach,
--   view = {
--     relativenumber = true,
--     float = {
--       enable = true,
--       quit_on_focus_loss = true,
--       open_win_config = function()
--         local screen_w = vim.opt.columns:get()
--         local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
--         local window_w = screen_w * WIDTH_RATIO
--         local window_h = screen_h * HEIGHT_RATIO
--         local window_w_int = math.floor(window_w)
--         local window_h_int = math.floor(window_h)
--         local center_x = (screen_w - window_w) / 2
--         local center_y = ((vim.opt.lines:get() - window_h) / 2)
--                          - vim.opt.cmdheight:get()
--         return {
--           border = 'rounded',
--           relative = 'editor',
--           row = center_y,
--           col = center_x,
--           width = window_w_int,
--           height = window_h_int,
--         }
--         end,
--     },
--     width = function()
--       return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
--     end,
--   },
-- }
