" nocompatible
set nocompatible

" status line settings
set laststatus=2
let &statusline = '%<%f %m%r%h%w[%{(&fenc!=""?&fenc:&enc)}][%{&ff}]%= %l,%c%V%8P'

" default tab space settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 
set showcmd
set showmatch
set hlsearch

" accent current line
set cursorline

" no error alarm
set vb t_vb=

" backspace
set backspace=indent,eol,start

"
set virtualedit&
set virtualedit+=block

" break undo sequence on <C-w>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" create swp data to only tmp directory
set directory&
set directory-=.

" ignore and smartcase
set ignorecase
set smartcase

" Load settings for each location. {{{
augroup vimrc-local "{{{
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END "}}}

function! s:vimrc_local(loc) "{{{
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction "}}}
"}}}

augroup vimrc-auto-mkdir  "{{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  "{{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  "}}}
augroup END  "}}}

" highlights {{{
highlight MultiByteSpace ctermbg=LightGray guibg=LightGray
match MultiByteSpace /　/
highlight EOLWhiteSpace ctermbg=DarkBlue guibg=DarkBlue
match EOLWhiteSpace /\s\+$/
highlight TabSpace ctermbg=DarkBlue guibg=DarkBlue
match TabSpace /\t/
function! g:Extra_highlights()
  autocmd VimrcAutoCmd WinEnter * match MultiByteSpace /　/
  autocmd VimrcAutoCmd WinEnter * match EOLWhiteSpace /\s\+$/
  autocmd VimrcAutoCmd WinEnter * match TabSpace /\t/
endfunction
"}}}

" syntax completion settings {{{
filetype on
filetype plugin on

" syntax completetion on any language {{{
autocmd VimrcAutoCmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif
"}}}

set pumheight=20
set completefunc=
set omnifunc&
set omnifunc+=
"}}}

" open popup in always
set completeopt=menuone,preview
" completion targets
set complete=.,w,b,u,t,i

" encoding settings {{{
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,euc-jp,eucjp-ms,cp932
set fileencoding=utf-8
set fileformat=unix
"}}}

" unnamed clipboard
set clipboard&
set clipboard+=unnamed

"
set foldmethod=marker

"
set list
set listchars=trail:_,tab:>-,nbsp:%

"
set scrolloff=3

" vim: expandtab softtabstop=2 shiftwidth=2
