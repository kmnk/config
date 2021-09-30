" dein-plugins

" Shougo's plugins {{{
call dein#add('Shougo/ddu.vim')

call dein#add('Shougo/ddc.vim')
" ddc sources {{{
call dein#add('LumaKernel/ddc-file', {'on_source': 'ddc.vim'})
call dein#add('Shougo/ddc-around', {'on_source': 'ddc.vim'})
call dein#add('Shougo/ddc-matcher_head', {'on_source': 'ddc.vim'})
call dein#add('Shougo/ddc-nvim-lsp', {'on_source': 'ddc.vim'})
call dein#add('Shougo/ddc-sorter_rank', {'on_source': 'ddc.vim'})
" ddc sources }}}

call dein#add('Shougo/defx.nvim')

call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')
" Shougo's plugins }}}

call dein#add('vim-denops/denops.vim')

call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')

call dein#add('altercation/vim-colors-solarized')

call dein#add('thinca/vim-visualstar')

call dein#add('mattn/vim-sonictemplate')

call dein#add('kana/vim-submode')
call dein#add('kana/vim-operator-replace')
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-textobj-user')

call dein#add('phpactor/phpactor', {
      \ 'on_ft': ['php'],
      \ 'build': 'composer install',
      \})

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#add('ryanoasis/vim-devicons')

call dein#add('airblade/vim-gitgutter')

call dein#add('junegunn/vim-easy-align')

call dein#add('h1mesuke/textobj-wiw', {'depends': ['kana/vim-textobj-user']})

call dein#add('cespare/vim-toml')

call dein#add('plasticboy/vim-markdown')

" my plugins {{{
call dein#add('kmnk/denite-dirmark')
call dein#add('kmnk/gitn')
call dein#add('kmnk/sonictemplate-vim-denite-extension')
" my plugins }}}

