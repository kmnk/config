" develop-plugin

" add runtimepath for developing vim script. {{{
autocmd VimrcAutoCmd BufNewFile,BufReadPost *.vim call s:set_local_runtimepath(getcwd())
function! s:set_local_runtimepath(loc) "{{{
  let &runtimepath .= ',' . a:loc
endfunction
"}}}
