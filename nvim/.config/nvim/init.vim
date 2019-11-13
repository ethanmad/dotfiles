set nocompatible

" Enable syntax highlighting
syntax on

" enable autowrite (autosave)
set autowrite

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
Plug 'liuchengxu/eleline.vim'
Plug 'tpope/vim-fugitive'                                           " Git wrapper
Plug 'tpope/vim-surround'                                           " modify surroundings in pairs
Plug 'jiangmiao/auto-pairs'                                         " pair handling for delimiters
Plug 'mhartington/oceanic-next'                                     " oceanic-next color scheme
Plug 'lervag/vimtex'                                                " TeX suport
Plug 'godlygeek/tabular'                                            " alignment tool
Plug 'plasticboy/vim-markdown'                                      " markdown syntax highlighting
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " fuzzy-file finder
Plug 'airblade/vim-gitgutter'                                       " Git diff in gutter
Plug 'vim-pandoc/vim-pandoc'                                        " Pandoc support
Plug 'vim-pandoc/vim-pandoc-syntax'                                 " Pandoc syntax support
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " Intellisense engine
Plug 'w0rp/ale'                                                     " ALE linter
Plug 'octol/vim-cpp-enhanced-highlight'                             " Additional C++17 highlighting
Plug 'junegunn/goyo.vim'
Plug 'fatih/vim-go'                                                 " golang support for vim
call plug#end()

" Oceanic-next colorscheme
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" Bold current line
set cursorline
hi CursorLine term=bold cterm=bold

" Enable syntax highlighting for fenced code in markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash', 'c', 'cpp']
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1

" Enable powerline symbols
let g:airline_powerline_fonts = 1

" Set textwidth to 72 cols in mutt
au BufRead /tmp/mutt-* set tw=72

" Set vim-cpp-enhanced-highlight settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" vim-go settings
let g:go_def_mode='gopls' "autocomplete using gopls
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
map <C-n> :cnext<CR>
map <C-m> :cprev<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
