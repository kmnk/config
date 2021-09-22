let s:dein_cache_dir = './.cache/dein'
let s:dein_repository_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'
let s:dein_plugins_toml = expand('<sfile>:h:h') . '/toml/plugins.toml'

execute 'set runtimepath+=' . s:dein_repository_dir

if dein#load_state(s:dein_repository_dir)
  call dein#begin(s:dein_cache_dir)

  call dein#add('Shougo/dein.vim')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#load_toml(s:dein_plugins_toml)

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
