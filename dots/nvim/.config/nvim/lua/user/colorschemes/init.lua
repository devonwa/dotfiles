require("user.colorschemes.catppuccin")
require("user.colorschemes.tokyonight")
require("user.colorschemes.noirbuddy")

-- set scolorscheme
vim.cmd [[
try
  colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


