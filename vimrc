au BufNewFile,BufRead *.ts     setf typescript 
au BufNewFile,BufRead *.tsx    setf typescriptreact
au BufNewFile,BufRead *.jsx    setf javascriptreact


set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set backspace=indent,eol,start

" line width helpers for python. Consider making this lang dependent
"Searches are case sensitive IFF I use caps. For manually searching: \c* \C*
set ignorecase
set smartcase

"Automatically detect and reload a file when it is altered by another program
set autoread
" For highlighting the line w/ the cursor 
" set cursorline
" Use a line cursor in insert mode 
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Show invisible characters
set list

filetype plugin on 
autocmd Filetype python setlocal
    \ colorcolumn=80
    \ textwidth=79
    \ linebreak "break on reasonable characters (spaces)
"    "set breakindent

autocmd Filetype javascript,javascriptreact,typescript,typescriptreact,html,json,yaml,scss,sass setlocal
    \ tabstop=2
    \ shiftwidth=2
    \ linebreak "break on reasonable characters (spaces)


" reminder on scope:
" https://github.com/JarrodCTaylor/vim-plugin-starter-kit/wiki/Working-with-VimScript-variables
" g:var - global.
" a:var - function argument.
" l:var - local to function.
" b:var - local to buffer.
" w:var - local to window.
" t:var - local to tab.
" v:var - Predefined by Vim.

" netrw settings
let g:netrw_liststyle=1
" let g:netrw_banner=0
let g:netrw_sort_options="i"

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
set foldignore=

" Describe how to illustrate invisible chars when 'set list' is invoked 
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" allow dashes in auto-completed names
set iskeyword+=\-

" use ctrl+H and ctrl+L to jump to the next word
nnoremap <C-H> b
nnoremap <C-L> w
vnoremap <C-H> <C-\><C-O>b
vnoremap <C-L> <C-\><C-O>w
inoremap <C-H> <C-\><C-O>b
inoremap <C-L> <C-\><C-O>w
onoremap <C-H> <C-\><C-O>b
cnoremap <C-L> <C-\><C-O>w
cnoremap <C-H> <C-\><C-O>b
onoremap <C-L> <C-\><C-O>w
noremap <C-H> b
noremap <C-L> w


" cmd + j is ESC in many modes 
inoremap <C-j> <ESC>
nnoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
noremap <C-j> <ESC>

" Enable syntax
syntax on
onoremap <C-j> <ESC>
cnoremap <C-j> <ESC>
"
set ttimeout		" time out for key codes
set ttimeoutlen=1	" wait up to 100ms after Esc for special key

syntax on
set number relativenumber
" necessary for tmux
if !has('nvim')
    set ttymouse=xterm2
endif
set mouse=a 

set hlsearch

" Enable vim-airline
packadd vim-airline
packadd vim-airline-themes


set guifont=Menlo:h13


" Airline settings 
set noshowmode
"set noshowmode
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts=1

let g:airline_theme='fruit_punch'

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
" inoremap <expr> <Space> pumvisible() ? "\<C-x>" : "\<Space>"
" inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "<CR>"
"
" use the following if you don't want to automatically select the first
" suggested option
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<CR>"

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


" echo expand('<sfile>:p:h:h')
let local_settings_file = expand('<sfile>:p:h') . '/local_settings.vim'

if filereadable(local_settings_file)
  "source local_settings_file
  execute 'source ' . fnameescape(local_settings_file)
  "echo "using " . local_settings_file
else
  " use monokai colorscheme, fix some weird colors. 
  color monokai
  colorscheme monokai
  hi Search cterm=NONE ctermfg=NONE ctermbg=red
  hi Search gui=NONE guifg=NONE guibg=yellow
  
  " for crusoexia monokai variant
  "set termguicolors
  set t_Co=256
  let g:monokai_term_italic = 1
  let g:monokai_gui_italic = 1
endif


" Load a virtual environment
" Taken from: https://stackoverflow.com/questions/3881534/set-python-virtualenv-in-vim?noredirect=1&lq=1

" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
" let defaultvirtualenv = $HOME . #"/.virtualenvs/stable"
let defaultvirtualenv = $HOME . "/.venvs/bkg_env"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif

" context.vim settings
packadd context.vim
let g:context_enabled = 1
