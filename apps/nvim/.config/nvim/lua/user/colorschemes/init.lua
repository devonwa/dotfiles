require("user.colorschemes.catppuccin")
require("user.colorschemes.tokyonight")

-- set scolorscheme
vim.cmd [[
try
  colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


