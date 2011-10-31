" initial settings "{{{
" my mapleader
let mapleader = ','

" favorite color theme
colorscheme lucius
"}}}

" local settings
let s:local_vimrc_dir_path = expand('<sfile>:h:h') . '/vim/local/'
let s:my_vimrc_names = [
\ 'default',
\ 'appends',
\ 'unite',
\ 'maps',
\ 'plugins',
\ 'matchit'
\]

" get ready (no need for editing) {{{
" initialize VimrcAutoCmd augroup {{{
augroup VimrcAutoCmd
  autocmd!
augroup END
"}}}

" source bundle at first
source <sfile>:h:h/vim/local/bundles.vim

" source local settings
let g:path_to_vimrc_profile = '~/.vimrc_profile'
if filereadable(expand(g:path_to_vimrc_profile))
  execute printf('source %s', expand(g:path_to_vimrc_profile))
endif

" source my vimrc {{{
function! s:source_my_vimrc(names)"{{{
  for l:name in a:names
    let l:path = printf('%s%s.vim', s:local_vimrc_dir_path, l:name)
    if filereadable(l:path)
      execute printf('source %s', l:path)
    endif
  endfor
endfunction"}}}
call s:source_my_vimrc(s:my_vimrc_names)
"}}}
"}}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
