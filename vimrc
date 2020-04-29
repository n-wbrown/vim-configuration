set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" line width helpers for python. Consider making this lang dependent
"Searches are case sensitive IFF I use caps. For manually searching: \c* \C*
set ignorecase
set smartcase

"Aut\omatically detect and reload a file when it is altered by another program
set autoread

filetype plugin on 
autocmd Filetype python setlocal
    \ colorcolumn=80
    \ textwidth=79
    \ linebreak "break on reasonable characters (spaces)
"    "set breakindent


" reminder on scope:
" https://github.com/JarrodCTaylor/vim-plugin-starter-kit/wiki/Working-with-VimScript-variables
" g:var - global.
" a:var - function argument.
" l:var - local to function.
" b:var - local to buffer.
" w:var - local to window.
" t:var - local to tab.
" v:var - Predefined by Vim.


" for managing long strings of text and text wrapping
let mapleader = "\\"
" from https://vim.fandom.com/wiki/Move_cursor_by_display_lines_when_wrapping
noremap <silent> <Leader>w :call ToggleWrap()<CR>
"let wrappersetting = 0
function ToggleWrap()
  if !exists("b:wrappersetting")
    let b:wrappersetting = 0
  endif
  "if &wrap
  if b:wrappersetting == 1
    let b:wrappersetting = 0
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    let b:wrappersetting = 1
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction



"noremap j gj
"noremap k gk
"noremap <Up> g<Up>
"noremap <Down> g<Down>
"imap <A-Up> <C-o>g<Up>
"imap <A-Down> <C-o>g<Down>
"imap <A-Up> <C-o>g<Up>
"imap <A-Down> <C-o>g<Down>
"inoremap <S-Up> <C-o>g<Up>
"inoremap <S-Down> <C-o>g<Down>
"imap <Leader><Up> <C-o>k
"imap <Leader><Down> <C-o>j



"imap <S-Up> <C-[> g<Up> i
"imap <S-Down> <C-[> g<Down> i
"map <S-Up> g<Up>
"map <S-Down> g<Down>
"imap <S-Up> <C-[> g<Up> i
"imap <S-Down> <C-[> g<Down> i

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

if has("gui_running")
    autocmd GUIEnter * set vb t_vb=
   set guioptions-=m
   set guioptions-=T
   set guioptions-=r
   set guioptions-=L
endif
