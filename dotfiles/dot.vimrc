"
if has('win32') || has('win64')
  set shellslash
endif

" add local .vim directory to runtimepath
let s:local_dot_vim_dir_path = expand('<sfile>:h:h') . '/vim/dot.vim'
execute 'set runtimepath+=' . s:local_dot_vim_dir_path

" initial settings (edit for yourself){{{
" my mapleader (default '\')
let mapleader = ','

" my favorite color theme (default 'default')
colorscheme lucius
"}}}

" local settings
let s:profiles_dir_path = expand('<sfile>:h:h') . '/vim/profiles/'
let s:profile_names = [
\ 'default',
\ 'appends',
\ 'unite',
\ 'maps',
\ 'plugins',
\ 'functions',
\ 'tmp',
\ 'office-appends',
\ 'office-bundles',
\ 'office-maps',
\]

" local functions {{{
function! s:source_profile(name)"{{{
  let l:path = printf('%s%s.vim', s:profiles_dir_path, a:name)
  if filereadable(l:path)
    execute printf('source %s', l:path)
  endif
endfunction"}}}
function! s:source_profiles(names)"{{{
  for l:name in a:names
    call s:source_profile(l:name)
  endfor
endfunction"}}}
function! s:call_source_profiles(args)"{{{
  call s:source_profiles(split(a:args, '[, :]'))
endfunction"}}}
command! -nargs=+ ResourceProfile call s:call_source_profiles(<q-args>)
"}}}

" initialize VimrcAutoCmd augroup
augroup VimrcAutoCmd
  autocmd!
augroup END

" source bundles at first
call s:source_profile('bundles')
" source profiles
call s:source_profiles(s:profile_names)

" source local settings at last
let g:path_to_vimrc_profile = '~/.vimrc_profile'
if filereadable(expand(g:path_to_vimrc_profile))
  execute printf('source %s', expand(g:path_to_vimrc_profile))
endif
