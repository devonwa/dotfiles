local options = {
  backup = false,                           -- creates a backup file
  clipboard = "unnamedplus",                -- allows neovim to access the system clipboard
  cmdheight = 1,                            -- more space in the neovim command line for displaying messages
  conceallevel = 0,                         -- so that `` is visible in markdown files
  expandtab = true,                         -- convert tabs to spaces
  fileencoding = "utf-8",                   -- the encoding written to a file
  hlsearch = true,                          -- highlight all matches on previous search pattern
  ignorecase = true,                        -- ignore case in search patterns
  guifont = "FiraCode Nerd Font:12",        -- font
  mouse = "a",                              -- allow the mouse to be used in neovim
  number = true,                            -- set numbered lines
  numberwidth = 2,                          -- set number column width to 2 {default 4}
  relativenumber = true,                    -- set relative numbered lines
  scrolloff = 8,                            -- keep cursor X lines away from top/bottom of the screen
  signcolumn = "yes",                       -- always show the sign column, otherwise it would shift the text each time
  shiftwidth = 4,                           -- the number of spaces inserted for each indentation
  showmode = false,                         -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                          -- always show tabs
  smartcase = true,                         -- smart case
  smartindent = true,                       -- make indenting smarter again
  splitbelow = true,                        -- force all horizontal splits to go below current window
  splitright = true,                        -- force all vertical splits to go to the right of current window
  swapfile = false,                         -- creates a swapfile
  tabstop = 4,                              -- insert 2 spaces for a tab
  termguicolors = true,                     -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                          -- enable persistent undo
  updatetime = 300,                         -- faster completion (4000ms default)
  writebackup = false,                      -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  wrap = false,                             -- display lines as one long line
}
for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.iskeyword:append("-")

-- set scolorscheme
vim.cmd [[
try
  colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
