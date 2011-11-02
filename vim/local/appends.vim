" appends

" maps
nmap <Leader>1 <SID>(toggle-number)

nmap <C-h> <SID>(help-shortcut)
imap <C-h> <SID>(backspace)

nmap <Leader>ev <SID>(edit-vimrc)
nmap <Leader>eg <SID>(edit-gvimrc)

nmap <Leader>mt <SID>(buffer-to-new-tab)


" disp always number of lines
set number
nnoremap <silent> <SID>(toggle-number) :<C-u>set number!<CR>

" indent
set autoindent
set nocindent
set smartindent

" TOhtml options
let g:use_xhtml     = 1
let g:html_use_css  = 1
let g:html_no_pre   = 1

" help key map
nnoremap <SID>(help-shortcut) :<C-u>h<Space>
inoremap <SID>(backspace)     <BS>

" edit vimrc right now
nnoremap <silent> <SID>(edit-vimrc)  :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <SID>(edit-gvimrc) :<C-u>tabedit $MYGVIMRC<CR>

" useful commands {{{
" rename by one command
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
"}}}

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
nmap <SID>(command-line-enter) q:
xmap <SID>(command-line-enter) q:
nmap <SID>(command-line-norange) q:<C-u>

nmap : <SID>(command-line-enter)
xmap : <SID>(command-line-enter)

autocmd VimrcAutoCmd CmdwinEnter * call s:init_cmdwin()  "{{{
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

" CSV high light
command! -nargs=1 Csvhl :call s:CSVH(<args>)
function! s:CSVH(x)   "{{{
  execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
  execute 'normal ^'.a:x.'f,'
endfunction "}}}

" autoloader of .vimrc {{{
if !has('gui_running') && !(has('win32') || has('win64'))
  autocmd VimrcAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
  autocmd VimrcAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
\   if has('gui_running') | source $MYGVIMRC  
  autocmd VimrcAutoCmd BufWritePost $MYGVIMRC
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

" matchit
runtime macros/matchit.vim

" search from current word
nnoremap * *N
nnoremap # #N

" revisual after indenting action
vnoremap > >gv
vnoremap < <gv

" clear highlightsearch
nnoremap <ESC><ESC> :nohlsearch<CR>

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
