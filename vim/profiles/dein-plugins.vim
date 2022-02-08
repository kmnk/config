" dein-plugins

" Shougo's plugins {{{
call dein#add('Shougo/ddu.vim')
call dein#add('Shougo/ddu-commands.vim')
" ddu UIs {{{
call dein#add('Shougo/ddu-ui-ff')
" }}}
" ddu sources {{{
call dein#add('Shougo/ddu-source-file')
call dein#add('Shougo/ddu-source-file_old')
call dein#add('Shougo/ddu-source-file_rec')
call dein#add('Shougo/ddu-source-line')
call dein#add('Shougo/ddu-source-register')
call dein#add('4513ECHO/ddu-source-colorscheme')
call dein#add('matsui54/ddu-source-help')
" }}}
" ddu kinds {{{
call dein#add('Shougo/ddu-kind-file')
call dein#add('Shougo/ddu-kind-word')
" }}}
" ddu filters {{{
call dein#add('Shougo/ddu-filter-matcher_substring')
call dein#add('Shougo/ddu-filter-matcher_relative')
" }}}

call dein#add('Shougo/ddc.vim')
" ddc sources {{{
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')
call dein#add('Shougo/ddc-omni')
call dein#add('LumaKernel/ddc-file')
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

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#add('ryanoasis/vim-devicons')

call dein#add('airblade/vim-gitgutter')

call dein#add('junegunn/vim-easy-align')

call dein#add('h1mesuke/textobj-wiw', {'depends': ['kana/vim-textobj-user']})

call dein#add('cespare/vim-toml')

" my plugins {{{
call dein#add('kmnk/denite-dirmark')
call dein#add('kmnk/gitn', {
      \  'depends': ['Shougo/denite.nvim', 'tpope/vim-fugitive']
      \})
call dein#add('kmnk/sonictemplate-vim-denite-extension')
call dein#add('kmnk/denite-cmdl')
" my plugins }}}

call dein#add('phpactor/phpactor', {
      \ 'lazy': 1,
      \ 'on_ft': ['php'],
      \ 'build': 'composer install',
      \})

call dein#add('rust-lang/rust.vim', {
      \  'lazy': 1,
      \  'on_ft': ['rust'],
      \})

call dein#add('fatih/vim-go', {
      \  'lazy': 1,
      \  'on_ft': ['go'],
      \})

call dein#add('kchmck/vim-coffee-script', {
      \  'lazy': 1,
      \  'on_ft': ['coffee'],
      \})

call dein#add('leafgarland/typescript-vim', {
      \  'lazy': 1,
      \  'on_ft': ['typescript'],
      \})
call dein#add('Quramy/tsuquyomi', {
      \  'lazy': 1,
      \  'on_ft': ['typescript'],
      \})
