" tab configuration for python. Consider making this lang dependent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" line width helpers for python. Consider making this lang dependent
set textwidth=79
"set breakindent
set colorcolumn=80

" Allow text folding, don't overthink it
set foldmethod=indent

inoremap <D-j> <ESC>
nnoremap <D-j> <ESC>
vnoremap <D-j> <ESC>
noremap <D-j> <ESC>

" Enable syntax
syntax on

set number
set mouse=a 

set hlsearch


" use monokai colorscheme, fix some weird colors. 
color monokai
colorscheme monokai
hi Search cterm=NONE ctermfg=NONE ctermbg=red
hi Search gui=NONE guifg=NONE guibg=yellow

" Airline settings 
set noshowmode
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts=1

let g:airline_theme='dark'

let g:python_highlight_all = 1
"let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0


"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_left_alt_sep = '|'
"let g:airline_right_alt_sep = '|'

" gui vim settings
if has("gui_running")
   set guioptions-=m
   set guioptions-=T
   set guioptions-=r
   set guioptions-=L
endif
