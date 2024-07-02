-- Settings before plugins
require "user.settings_pre"
require "user.keymaps"

-- Plugins
require "user.lazy"
require "user.colorschemes"
require "user.cmp"
require "user.treesitter"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine"
require "user.toggleterm"
require "user.lsp"
require "user.autosession"

-- Settings after plugins
require "user.settings_post"
require "user.keymaps" -- repeated in case plugin overrides
