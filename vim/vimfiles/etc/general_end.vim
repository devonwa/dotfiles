""" colors
" colorscheme 
set t_Co=256
colorscheme desert

" syntax highlighting
syntax enable
set foldmethod=indent
set foldlevel=99
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" color changes (must come after syntax enable)
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#2c3156

""" alias
" copy / paste use system clipboard
set clipboard=unnamedplus

" window moves
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" buffer moves
" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr> 

" remove toolbar and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=L

" denote the end of a c + [motion] replacement
:set cpoptions+=$

" make NERDTree and MiniBufExplorer play nicely
" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')
