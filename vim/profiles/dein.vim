let s:dein_cache_dir = './.cache/dein'
let s:dein_repository_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+=' . s:dein_repository_dir

if dein#load_state(s:dein_repository_dir)
  call dein#begin(s:dein_cache_dir)

  call dein#add('Shougo/dein.vim')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " plugins to add {{{
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/ddu.vim')
  call dein#add('Shougo/ddc.vim')

  call dein#add('vim-denops/denops.vim')

  call dein#add('altercation/vim-colors-solarized')
  " plugins to add }}}

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
