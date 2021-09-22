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
