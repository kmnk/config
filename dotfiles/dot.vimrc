let s:profiles_dir_path = expand('<sfile>:h:h') . '/vim/profiles/'
let s:profile_names = [
\ 'airline',
\ 'base',
\ 'cmdwin',
\ 'cmdl',
\ 'color',
\ 'ddc',
\ 'ddu',
\ 'defx',
\ 'denite',
\ 'develop-plugin',
\ 'git',
\ 'maps',
\ 'phpactor',
\ 'plugin-settings',
\ 'submode',
\ 'term',
\ 'local',
\]

" source profile functions {{{
function! s:source_profile(name)
  let l:path = printf('%s%s.vim', s:profiles_dir_path, a:name)
  if filereadable(l:path)
    execute printf('source %s', l:path)
  endif
endfunction

function! s:source_profiles(names)
  for l:name in a:names
    call s:source_profile(l:name)
  endfor
endfunction

function! s:call_source_profiles(args)
  call s:source_profiles(split(a:args, '[, :]'))
endfunction
command! -nargs=+ ReSourceProfile call s:call_source_profiles(<q-args>)
" source profile functions }}}

" source plugin manager profile at first
call s:source_profile('dein')

" source other profiles
call s:source_profiles(s:profile_names)

" source local profile at last
let s:path_to_local_vimrc = '~/.vimrc_profile'
if filereadable(expand(s:path_to_local_vimrc))
  execute printf('source %s', expand(s:path_to_local_vimrc))
endif
