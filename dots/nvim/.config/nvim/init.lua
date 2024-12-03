-- Settings before plugins
require "user.settings_pre"
require "user.keymaps" -- repeated at start so available if settings crash

-- Plugins
require "user.lazy"
require "user.colorschemes"
require "user.cmp"
require "user.treesitter"
require "user.comment"
require "user.gitsigns"
require "user.neovide"
require "user.nvim-scrollbar"
require "user.nvim-tree"
require "user.lualine"
require "user.toggleterm"
require "user.autosession"
require "user.harpoon"
require "user.lsp"

require("bufferline").setup {}


-- Settings after plugins
require "user.settings_post"
require "user.keymaps" -- repeated in case plugin overrides
