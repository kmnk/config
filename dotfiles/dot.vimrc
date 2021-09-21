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

" dein settings {{{
let s:dein_cache_dir = './.cache/dein'
let s:dein_repository_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+=' . s:dein_repository_dir

if dein#load_state(s:dein_repository_dir)
  call dein#begin(s:dein_cache_dir)

  call dein#add('Shougo/dein.vim')

  " plugins to add {{{
  call dein#add('altercation/vim-colors-solarized')
  " plugins to add }}}

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" dein setings }}}

" color settings {{{
syntax enable
let g:solarized_termcolors= 256
set background=dark
colorscheme solarized
" color settings }}}

" vim: expandtab softtabstop=2 shiftwidth=2
