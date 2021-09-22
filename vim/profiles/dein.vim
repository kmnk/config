let s:dein_cache_dir = expand('<sfile>:h:h:h') . '/.cache/dein'
let s:dein_repository_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+=' . s:dein_repository_dir

if dein#load_state(s:dein_repository_dir)
  call dein#begin(s:dein_cache_dir)

  call dein#add('Shougo/dein.vim')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  execute 'source ' . expand('<sfile>:h') . '/dein-plugins.vim'

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
