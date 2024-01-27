let s:profiles_dir_path = expand('<sfile>:h:h') . '/vim/profiles/'
let s:profile_names = [
\ 'airline',
\ 'base',
\ 'cmdwin',
\ 'cmdl',
\ 'color',
\ 'denite',
\ 'ddc',
\ 'ddu',
\ 'ddu-file',
\ 'ddu-help',
\ 'ddu-mr',
\ 'develop-plugin',
\ 'git',
\ 'maps',
\ 'phpactor',
\ 'plugin-settings',
\ 'snippets',
\ 'submode',
\ 'term',
\ 'local',
\]
let s:nvim_profile_names = [
\ 'hop',
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

function! s:init_profiles()
  " source other profiles
  call s:source_profiles(s:profile_names)

  " source other nvim profiles
  if has('nvim')
    call s:source_profiles(s:nvim_profile_names)
  endif
endfunction
" source profile functions }}}

" source plugin manager profile at first
"call s:source_profile('dpp')
const s:dpp_base = expand('<sfile>:h:h') . '/.cache/dpp/'
const s:dpp_repos = s:dpp_base . 'repos/'
const s:dpp_repos_github = s:dpp_repos . 'github.com/'

const s:dpp_config = expand('<sfile>:h:h') . '/vim/configs/dpp.ts'

const s:dpp_src = s:dpp_repos_github . 'Shougo/dpp.vim'
const s:denops_src = s:dpp_repos_github . 'vim-denops/denops.vim'
const s:dpp_ext_installer_src = s:dpp_repos_github . 'Shougo/dpp-ext-installer'
const s:dpp_ext_lazy_src = s:dpp_repos_github . 'Shougo/dpp-ext-lazy'
const s:dpp_ext_toml_src = s:dpp_repos_github . 'Shougo/dpp-ext-toml'
const s:dpp_protocol_git_src = s:dpp_repos_github . 'Shougo/dpp-protocol-git'

execute 'set runtimepath^=' .. s:dpp_src
execute 'set runtimepath^=' .. s:dpp_ext_installer_src
execute 'set runtimepath^=' .. s:dpp_ext_lazy_src
execute 'set runtimepath^=' .. s:dpp_ext_toml_src
execute 'set runtimepath^=' .. s:dpp_protocol_git_src

if dpp#min#load_state(s:dpp_base)
  execute 'set runtimepath^=' .. s:denops_src
endif
command! DppCheckLoadState echo dpp#min#load_state(s:dpp_base)
command! DppMakeState call dpp#make_state(s:dpp_base, s:dpp_config)
command! DppInstallPlugins call dpp#sync_ext_action('installer', 'install')

filetype indent plugin on

if has('syntax')
  syntax on
endif

" Shougo scripts and vim-denops only ? or not
if len(split(glob(s:dpp_repos_github . '*'), "\n")) > 2
  call s:init_profiles()
endif

" source local profile at last
let s:path_to_local_vimrc = '~/.vimrc_profile'
if filereadable(expand(s:path_to_local_vimrc))
  execute printf('source %s', expand(s:path_to_local_vimrc))
endif
