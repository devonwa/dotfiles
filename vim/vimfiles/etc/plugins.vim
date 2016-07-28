" path variables
let vundle_path = vim_folder_path . '/bundle/Vundle.vim/'

" load vundle
execute 'set runtimepath+=' . vundle_path
let path = vim_folder_path . '/bundle'

" vundle plugins
call vundle#begin(path)

" vundle - plugin manager
Plugin 'gmarik/Vundle.vim'

" file organizers
" ctrl-P - file/misc finder
Plugin 'kien/ctrlp.vim'
" minibufexpl - buffer explorer
Plugin 'fholgado/minibufexpl.vim'
" Markdown Vim Mode
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" nerdtree - file organizer
Plugin 'scrooloose/nerdtree'
" vim-misc - session saver dependency
Plugin 'xolox/vim-misc'
" vim-session - session saver
Plugin 'xolox/vim-session'

" programming
" syntastic - syntax error highlighting
Plugin 'scrooloose/syntastic'
" youcompleteme - code-completion
Plugin 'Valloric/YouCompleteMe'


" end vundle plugins
call vundle#end()

" vundle requirements 
filetype plugin indent on     " required

" plugin settings
" vim-markdown
let g:vim_markdown_folding_disabled=1

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeWinSize=31

" vim-session
let g:session_autosave='yes'
let g:session_autoload='yes'

