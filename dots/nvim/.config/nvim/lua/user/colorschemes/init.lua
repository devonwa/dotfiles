require("user.colorschemes.catppuccin")
require("user.colorschemes.tokyonight")
require("user.colorschemes.noirbuddy")
require("user.colorschemes.gruvbox")

-- set scolorscheme
vim.cmd [[
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


