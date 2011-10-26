" source bundle at first
source <sfile>:h:h/vim/local/bundles.vim

" source local settings
let g:path_to_vimrc_profile = '~/.vimrc_profile'
if filereadable(expand(g:path_to_vimrc_profile))
  execute printf('source %s', expand(g:path_to_vimrc_profile))
endif

augroup KmnkAutoCmd
  autocmd!
augroup END

" my mapleader
let mapleader = ','

" is windows ?
let s:is_windows  = (has('win32') || has('win64'))

syntax on

" status line settings
set laststatus=2
let &statusline = '%<%f %m%r%h%w[%{(&fenc!=""?&fenc:&enc)}][%{&ff}]%=%{cfi#format("[%s()]", "no function")} %l,%c%V%8P'

" default tab settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"set nocompatible

" 
set showcmd
set showmatch
set hlsearch

" disp always number of lines
set number
nnoremap <Leader>1 :<C-u>set number!<CR>

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

" indent
set autoindent
set nocindent
set smartindent

" TOhtml options
let g:use_xhtml     = 1
let g:html_use_css  = 1
let g:html_no_pre   = 1

" help key map
nnoremap <C-h> :<C-u>h<Space>
inoremap <C-h> <BS>
nnoremap <BS> :<C-u>h<Space>

" edit vimrc right now
nnoremap <silent> <Leader>ev  :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Leader>eg  :<C-u>tabedit $MYGVIMRC<CR>

" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Leader>lv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Leader>lg :<C-u>source $MYGVIMRC<CR>

" create swp data to only tmp directory
set directory&
set directory-=.

" useful commands {{{
" rename by one command
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
"}}}

" no guioptions
if has('gui_running')
  set go=
endif

" ignore and smartcase
set ignorecase
set smartcase

" <Leader>ao move current buffer into a new tab.
nnoremap <silent> <Leader>mt :<C-u>call <SID>move_window_into_tab_page(0)<Cr>
" kana's useful tab function {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction " }}}

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

" add runtimepath for developing vim script. {{{
autocmd KmnkAutoCmd BufNewFile,BufReadPost *.vim call s:set_local_runtimepath(getcwd())
function! s:set_local_runtimepath(loc) "{{{
  let &runtimepath .= ',' . a:loc
endfunction
"}}}
"}}}

" Command-line window {{{
nmap <SID>(command-line-enter) q:
xmap <SID>(command-line-enter) q:
nmap <SID>(command-line-norange) q:<C-u>

nmap : <SID>(command-line-enter)
xmap : <SID>(command-line-enter)

autocmd KmnkAutoCmd CmdwinEnter * call s:init_cmdwin()  "{{{
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer> qq <Esc>:<C-u>quit<CR>
  inoremap <buffer> kk <Esc>k

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  call altercmd#define('b', 'gr[ep]', 'Grep', 'i')

  startinsert!
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

" svn move current file to : SvnMove {{{
command! -nargs=1 -complete=file -bang SvnMove call s:MoveCurrentFileTo('<args>', '<bang>')
function! s:MoveCurrentFileTo(file, bang)   "{{{
  let l:res   = system('svn move ' . expand('%') . ' ' . a:file)
  if a:bang == ''
    echo l:res
  endif
endfunction "}}}
"}}}

" cd current directory command : CD {{{
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang) "{{{
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' . a:directory
  endif

  if a:bang == ''
    pwd
  endif
endfunction "}}}

" Change current directory.
nnoremap <silent> <C-,>cd :<C-u>CD<CR>
"}}}

" syntax completion settings {{{
filetype on
filetype plugin on

" syntax completetion on any language {{{
autocmd KmnkAutoCmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif
"}}}

" open popup in always
set completeopt=menuone,preview

" completion targets
set complete=.,w,b,u,t,i

set pumheight=20
set completefunc=
set omnifunc&
set omnifunc+=
"}}}

" color settings {{{
set t_Co=256
colorscheme lucius
"}}}

" CSV high light
command! -nargs=1 Csvhl :call s:CSVH(<args>)
function! s:CSVH(x)   "{{{
  execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
  execute 'normal ^'.a:x.'f,'
endfunction "}}}

" highlights {{{
highlight MultiByteSpace ctermbg=LightGray guibg=LightGray
match MultiByteSpace /　/
autocmd KmnkAutoCmd WinEnter * match MultiByteSpace /　/
highlight EOLWhiteSpace ctermbg=blue guibg=blue
match EOLWhiteSpace /\s\+$/
autocmd KmnkAutoCmd WinEnter * match EOLWhiteSpace /\s\+$/
highlight TabSpace ctermbg=blue guibg=blue
match TabSpace /\t/
autocmd KmnkAutoCmd WinEnter * match TabSpace /\t/
"}}}

" {{{
command! -complete=file -nargs=+ Grep  call s:grep([<f-args>])
function! s:grep(args)
  execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction
"}}}

" set file type (setf) {{{
augroup FileTypeCmd
  autocmd!
augroup END
autocmd FileTypeCmd FileType js setlocal ft=javascript
autocmd FileTypeCmd FileType pl setlocal ft=perl
"}}}

" align setting
let g:Align_xstrlen=3

" AllMaps
command!
\   -nargs=* -complete=mapping
\   AllMaps
\   map <args> | map! <args> | lmap <args>

" autoloader of .vimrc {{{
if !has('gui_running') && !s:is_windows
  autocmd KmnkAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
  autocmd KmnkAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
\   if has('gui_running') | source $MYGVIMRC  
  autocmd KmnkAutoCmd BufWritePost $MYGVIMRC
\   if has('gui_running') | source $MYGVIMRC
endif
"}}}

" Open junk file. {{{
nmap <Leader>\ <SID>(open-junk-file)
nnoremap <SID>(open-junk-file) :<C-u>JunkFile<CR>
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file() "{{{
  let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction "}}}
"}}}

" encoding settings {{{
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    set fileencodings&
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd KmnkAutoCmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"改行コード指定
set fileformat=unix
"ファイルエンコード(japan = euc-jp)
set fileencoding=utf-8
"ファイルエンコーディングス(set fileencode=xxxで、文字コード変更用･･･？)
set fileencodings=utf-8,japan,sjis,iso-2022-jp

command! -bang -nargs=? Utf8  edit<bang> ++enc=utf-8  <args>
command! -bang -nargs=? EucJp edit<bang> ++enc=euc-jp <args>
"}}}


" unnamed clipboard
set clipboard&
set clipboard+=unnamed

"
set foldmethod=marker

" source my vimrc {{{
let s:dotfiles_dir_path = expand('<sfile>:h:h') . '/vim/local/'

let s:my_vimrc_names = ['unite', 'maps', 'plugins']

function! s:source_my_vimrc(names)"{{{
  for l:name in a:names
    let l:path = printf('%s%s.vim', s:dotfiles_dir_path, l:name)
    if filereadable(l:path)
      execute printf('source %s', l:path)
    endif
  endfor
endfunction"}}}
call s:source_my_vimrc(s:my_vimrc_names)
"}}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
