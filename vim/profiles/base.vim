" my mapleader (default '\')
let mapleader = ','
noremap \ ,

" add my .vim directory to runtimepath
let s:dot_vim_dir_path = expand('<sfile>:h:h') . '/dot.vim'
execute 'set runtimepath+=' . s:dot_vim_dir_path

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
