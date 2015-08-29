" appends

" maps
nmap <Leader>1 <SID>(toggle-number)
nmap <Leader>2 <SID>(toggle-spell)
nmap <Leader>3 <SID>(toggle-paste)

imap <C-h> <SID>(backspace)

nmap <Leader>ev <SID>(edit-vimrc)
nmap <Leader>eg <SID>(edit-gvimrc)

nmap <Leader>mt <SID>(buffer-to-new-tab)

" feel good repeat-substitute
nmap & <SID>(repeat-substitute)
xmap & <SID>(repeat-substitute)

" command line
nmap : <SID>(command-line-enter)
xmap : <SID>(command-line-enter)
nmap q: <SID>(default-command-line-enter)
xmap q: <SID>(default-command-line-enter)
nmap / <SID>(search-line-enter)
xmap / <SID>(search-line-enter)

" disp always relativenumber of lines
set number
nnoremap <SID>(toggle-number) :<C-u>set number!<CR>

" spell mode
nnoremap <SID>(toggle-spell) :<C-u>set spell!<CR>

" paste mode
nnoremap <SID>(toggle-paste) :<C-u>set paste!<CR>

" indent
set autoindent
set nocindent
set smartindent

" color column
set colorcolumn=80

" TOhtml options
let g:use_xhtml     = 1
let g:html_use_css  = 1
let g:html_no_pre   = 1

" help key map
inoremap <SID>(backspace) <BS>

" edit vimrc right now
nnoremap <silent> <SID>(edit-vimrc)  :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <SID>(edit-gvimrc) :<C-u>tabedit $MYGVIMRC<CR>

" no guioptions
if has('gui_running')
  set go=
endif

" <Leader>mt move current buffer into a new tab.
nnoremap <silent> <SID>(buffer-to-new-tab) :<C-u>call <SID>move_window_into_tab_page(0)<CR>
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

" add runtimepath for developing vim script. {{{
autocmd VimrcAutoCmd BufNewFile,BufReadPost *.vim call s:set_local_runtimepath(getcwd())
function! s:set_local_runtimepath(loc) "{{{
  let &runtimepath .= ',' . a:loc
endfunction
"}}}
"}}}

" Command-line window {{{
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(default-command-line-enter) :
xnoremap <SID>(default-command-line-enter) :
nnoremap <SID>(search-line-enter) /\v
xnoremap <SID>(search-line-enter) /\v

autocmd VimrcAutoCmd CmdwinEnter * call s:init_cmdwin()  "{{{
function! s:init_cmdwin()
  set nonumber
  set norelativenumber

  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  nnoremap <buffer> <CR> <CR>
  inoremap <buffer><expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr> <C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr> <BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer> qq <Esc>:<C-u>quit<CR>
  inoremap <buffer> kk <Esc>k

  " Completion.
  inoremap <buffer><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  call altercmd#define('b', 'gr[ep]', 'Grep', 'i')

  startinsert!
endfunction "}}}
"}}}

" feeling good repeat substitute
nnoremap <SID>(repeat-substitute) :&&<CR>
xnoremap <SID>(repeat-substitute) :&&<CR>

" CSV high light
command! -nargs=1 Csvhl :call s:CSVH(<args>)
function! s:CSVH(x)   "{{{
  execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
  execute 'normal ^'.a:x.'f,'
endfunction "}}}

" matchit
runtime macros/matchit.vim

" search from current word
nnoremap * *Nzz
nnoremap # #Nzz

" clear highlightsearch
nnoremap <C-l> :nohlsearch<CR><C-l>

" activate incsearch
set incsearch

" 
set history=10000

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
