" Enable syntax highlighting
syntax on

" Enbale filetype plugins
filetype plugin on
filetype indent on

" Show absolute line numbers
set number

" TABs have width of 4
set tabstop=4
set softtabstop=4

" Indents have width of 4
set shiftwidth=4

" Expand TABs to spaces
set expandtab

" Current line gets bolded
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Search options
set hlsearch
set ignorecase
set smartcase
set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Use ; for commands
nnoremap ; :

" point nvim to python 2 interpreter
let g:python_host_prog = '/usr/bin/python2'

" vim-plug (plugin manager)
call plug#begin('~/.nvim/plugged')
Plug 'bling/vim-airline'  " powerline
Plug 'benekastah/neomake' " syntax checker
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-surround' " modify surroundings in pairs
Plug 'Valloric/YouCompleteMe' " completetion engine
call plug#end()
