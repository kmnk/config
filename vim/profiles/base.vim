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

" use command line window as default
nmap : <SID>(command-line-enter)
xmap : <SID>(command-line-enter)
nmap q: <SID>(default-command-line-enter)
xmap q: <SID>(default-command-line-enter)
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(default-command-line-enter) :
xnoremap <SID>(default-command-line-enter) :

" command line window settings {{{
autocmd VimrcAutoCmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  set nonumber
  set norelativenumber

  nnoremap <buffer> qq :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  nnoremap <buffer> <CR> <CR>
  inoremap <buffer><expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr> <C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr> <BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer> qq <Esc>:<C-u>quit<CR>
  inoremap <buffer> kk <Esc>k

  inoremap <buffer><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction
" command line window settings }}}
