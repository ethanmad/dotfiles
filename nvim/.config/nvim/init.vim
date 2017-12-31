set nocompatible

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

" Bind leader to <Space>
nnoremap <SPACE> <Nop>
let mapleader=" "

" Word Processor Mode
func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

" vim-plug (plugin manager)
call plug#begin('~/.nvim/plugged')
Plug 'bling/vim-airline'                                            " powerline
Plug 'benekastah/neomake'                                           " syntax checker
Plug 'tpope/vim-fugitive'                                           " Git wrapper
Plug 'tpope/vim-surround'                                           " modify surroundings in pairs
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }        " keyword completion system
Plug 'Shougo/neoinclude.vim'                                        " keyword completion from included files
Plug 'zchee/deoplete-clang'                                         " clang completion for C(++)
Plug 'jiangmiao/auto-pairs'                                         " pair handling for delimiters
Plug 'tomasr/molokai'                                               " molokai color scheme
Plug 'lervag/vimtex'                                                " TeX suport
Plug 'godlygeek/tabular'                                            " alignment tool
Plug 'plasticboy/vim-markdown'                                      " markdown syntax highlighting
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " fuzzy-file finder
Plug 'airblade/vim-gitgutter'                                       " Git diff in gutter
Plug 'vim-pandoc/vim-pandoc'                                        " Pandoc support
Plug 'vim-pandoc/vim-pandoc-syntax'                                 " Pandoc syntax support
call plug#end()

" Use molokai colorscheme
colorscheme molokai

" Bold current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Use deoplete for completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" Enable syntax highlighting for fenced code in markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash']

" Enable powerline symbols
let g:airline_powerline_fonts = 1
