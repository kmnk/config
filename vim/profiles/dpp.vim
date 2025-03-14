set nocompatible

const s:dpp_base = expand('<sfile>:h:h:h') . '/.cache/dpp/'
const s:dpp_repos = s:dpp_base . 'repos/'
const s:dpp_repos_github = s:dpp_repos . 'github.com/'

const s:dpp_config = expand('<sfile>:h:h') . '/configs/dpp.ts'

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

if s:dpp_base->dpp#min#load_state(s:dpp_base)
  execute 'set runtimepath^=' .. s:denops_src
  execute 'set runtimepath^=' .. s:denops_installer_src

  autocmd User DenopsReady
    \ : echohl WarningMsg
    \ | echomsg 'dpp load_state() is failed'
    \ | echohl NONE
    \ | call dpp#make_state(s:dpp_base, s:dpp_config)
endif

autocmd User Dpp:makeStatePost
      \ : echohl WarningMsg
      \ | echomsg 'dpp make_state() is done'
      \ | echohl NONE

command! DppCheckLoadState echo dpp#min#load_state(s:dpp_base)
command! DppMakeState call dpp#make_state(s:dpp_base, s:dpp_config)
command! DppInstallPlugins call dpp#sync_ext_action('installer', 'install')

const g:dpp_plugins_has_installed = len(split(glob(s:dpp_repos_github . '*'), "\n")) > 2

filetype indent plugin on

if has('syntax')
  syntax on
endif
