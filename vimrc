set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set textwidth=79
"set breakindent
set colorcolumn=80


set foldmethod=indent

inoremap <D-j> <ESC>
nnoremap <D-j> <ESC>
vnoremap <D-j> <ESC>
noremap <D-j> <ESC>

syntax on
set number
set mouse=a 

set hlsearch



color monokai
colorscheme monokai
hi Search cterm=NONE ctermfg=NONE ctermbg=red
hi Search gui=NONE guifg=NONE guibg=yellow

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


if has("gui_running")
   set guioptions-=m
   set guioptions-=T
   set guioptions-=r
   set guioptions-=L
endif
