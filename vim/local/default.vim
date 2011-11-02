" default
syntax on

" color
set t_Co=256

" status line settings
set laststatus=2
let &statusline = '%<%f %m%r%h%w[%{(&fenc!=""?&fenc:&enc)}][%{&ff}]%=%{cfi#format("[%s()]", "no function")} %l,%c%V%8P'

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

" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Leader>lv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Leader>lg :<C-u>source $MYGVIMRC<CR>

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
autocmd VimrcAutoCmd WinEnter * match MultiByteSpace /　/
highlight EOLWhiteSpace ctermbg=blue guibg=blue
match EOLWhiteSpace /\s\+$/
autocmd VimrcAutoCmd WinEnter * match EOLWhiteSpace /\s\+$/
highlight TabSpace ctermbg=blue guibg=blue
match TabSpace /\t/
autocmd VimrcAutoCmd WinEnter * match TabSpace /\t/
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

" set file type (setf) {{{
augroup FileTypeCmd
  autocmd!
augroup END
autocmd FileTypeCmd FileType js setlocal ft=javascript
autocmd FileTypeCmd FileType pl setlocal ft=perl
"}}}

" encoding settings {{{
set encoding=utf-8
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932
set fileencoding=utf-8
set fileformat=unix
"}}}

" unnamed clipboard
set clipboard&
set clipboard+=unnamed

"
set foldmethod=marker

" matchit
runtime macros/matchit.vim

" search from current word
nnoremap * *N
nnoremap # #N

" revisual after indenting action
vnoremap > >gv
vnoremap < <gv

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
