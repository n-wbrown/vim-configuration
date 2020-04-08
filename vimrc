set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" line width helpers for python. Consider making this lang dependent
"Searches are case sensitive IFF I use caps. For manually searching: \c* \C*
set ignorecase
set smartcase

"Automatically detect and reload a file when it is altered by another program
set autoread

set textwidth=79
"set breakindent
set colorcolumn=80

" Use system clipboard for yanks
set clipboard=unnamed

" Allow text folding, don't overthink it
set foldmethod=indent

" cmd + j is ESC in many modes 
inoremap <D-j> <ESC>
nnoremap <D-j> <ESC>
vnoremap <D-j> <ESC>
noremap <D-j> <ESC>

" Enable syntax
syntax on
onoremap <D-j> <ESC>
cnoremap <D-j> <ESC>

syntax on
set number
" necessary for tmux
set ttymouse=xterm2
set mouse=a 

set hlsearch

" Enable vim-airline
packadd vim-airline

set guifont=Menlo:h13

" use monokai colorscheme, fix some weird colors. 
color monokai
colorscheme monokai
hi Search cterm=NONE ctermfg=NONE ctermbg=red
hi Search gui=NONE guifg=NONE guibg=yellow
" for crusoexia monokai variant
"set termguicolors
"set t_Co=256
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" Airline settings 
set noshowmode
"set noshowmode
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts=1

let g:airline_theme='dark'

let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" COC configuration - copied from COC wiki 
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"




"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_left_alt_sep = '|'
"let g:airline_right_alt_sep = '|'

" gui vim settings
" for managing long strings of text and text wrapping
set linebreak "break on reasonable characters (spaces)
map j gj
map k gk
map <S-Up> g<Up>
map <S-Down> g<Down>
"imap <S-Up> <C-[> g<Up> i
"imap <S-Down> <C-[> g<Down> i

if has("gui_running")
    autocmd GUIEnter * set vb t_vb=
   set guioptions-=m
   set guioptions-=T
   set guioptions-=r
   set guioptions-=L
endif
