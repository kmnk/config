" base.vim
if &compatible
  set nocompatible
endif

" my mapleader (default '\')
let mapleader = ','
noremap \ ,

" add my .vim directory to runtimepath
let s:dot_vim_dir_path = expand('<sfile>:h:h') . '/dot.vim'
execute 'set runtimepath+=' . s:dot_vim_dir_path

" initialize VimrcAutoCmd augroup
augroup VimrcAutoCmd
  autocmd!
augroup END

" enable filetype detection
filetype on
filetype plugin on

" default tab and space settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" highlight current cursor line
set cursorline

" display line number
set number

" use unnamed clipboard
set clipboard=unnamed

" use marker as foldmethod
set foldmethod=marker

" no error alarm
set vb t_vb=

" create swp data to only tmp directory
set directory&
set directory-=.

" ignore and smartcase
set ignorecase
set smartcase

" backspace
set backspace=indent,eol,start

" highlight searching strings
set hlsearch

" show last line of command
set showcmd

" show maached bracket
set showmatch

" allow virtual edit on visual block mode
set virtualedit&
set virtualedit+=block

" show listed character as
set list
set listchars=trail:_,tab:>-,nbsp:%

" keep min 3 line below the cursor
set scrolloff=3

" indent
set autoindent
set nocindent
set smartindent

" color 80 column
set colorcolumn=80

" activate incremental search
set incsearch

" remember 10000 history
set history=10000

" base maps {{{
" quick write
nnoremap <CR> :<C-u>w<CR>

" quick ZZ
nnoremap <Leader><CR> ZZ

" Yank like C and D
nnoremap Y y$

" search from current word
nnoremap * *Nzz
nnoremap # #Nzz

" clear highlightsearch
nnoremap <C-l> :nohlsearch<CR><C-l>

" in pattern escape
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
" base maps }}}
